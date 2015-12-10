$(function(){
    function init(){
        $($('input[name=pay_type]')[0]).attr('checked','checked')
        get_amt()
    }
    init();

    function check_weixin_useragent(){
        return navigator.userAgent.indexOf('MicroMessenger') != -1;
    }

    function get_amt(){
        if($('#id-coupon').length > 0){
            pay_amt = order_amt - coupon_map[$('#id-coupon').val()];
        }else{
            pay_amt = order_amt;
        }
        if($('#id-balance').length > 0){
            if($('#id-balance').is(':checked')){
                if(balance_amt >= pay_amt){
                    balance_use = pay_amt;
                    pay_amt = 0;
                }else{
                    balance_use = balance_amt;
                    pay_amt = pay_amt - balance_amt;
                }
            }else{
                balance_use = 0;
            }
        }
        $('#id-pay-amt').html(pay_amt / 100.0);

    }
    $('#id-coupon').change(get_amt);
    $('#id-balance').change(get_amt);
    $('#id-submit').click(function(){
        $(this).attr('disabled', 'disabled');
        par_pay_type = $('input[name=pay_type]:checked').val();
        if(par_pay_type === undefined && pay_amt > 0){
            alert('请选择合适的支付方式')
            $(this).attr('disabled',null);
            return
        }
        if(par_pay_type == 1 && check_weixin_useragent()){
            $('.mask').css('display','block');
            $(this).attr('disabled',null);
            return
        }
        par_app_code = $('#id-app_code').val();
        par_out_sn = $('#id-out_sn').val();
        par_coupon_code = $('#id-coupon').val();
        par_token = $('#id-token').val();
        par_order_token = $('#id-order_token').val();
        par_mobile = $('#id-mobile').val();
        par_goods_name = $('#id-goods_name').val();
        par_goods_info = $('#id-goods_info').val();
        par_mchnt_name = $('#id-mchnt_name').val();
        par_openid = $('#id-openid').val();
		par_limit_pay = $('#id-limit_pay').val();
        par_coupon_amt = coupon_map[$('#id-coupon').val()];
        $.ajax({
            type : 'POST',
            url : '/order/v1/create',
            data : {
                app_code : par_app_code,
                total_amt : order_amt,
                pay_amt : pay_amt,
                coupon_amt : par_coupon_amt,
                coupon_code : par_coupon_code,
                pay_type : par_pay_type,
                out_sn : par_out_sn,
                token : par_token,
                order_token : par_order_token,
                pay_source : 2,
                mobile : par_mobile,
                goods_name : par_goods_name,
                goods_info : par_goods_info,
                mchnt_name : par_mchnt_name,
                openid : par_openid,
                balance_amt : balance_use,
				limit_pay : par_limit_pay,
                caller : 'h5'
            },
            success : function(data) {
                if(data['respcd'] == '0000'){
                    //如果需要支付
                    if(pay_amt > 0){
                        if(data['data']['pay_type'] == 1){
                            if(data['data']['channel']['url'] == ''){
                                alert('支付宝参数错误');
                            }else{
                                window.location.href=data['data']['channel']['url'];
                            }
                            $('#id-submit').attr('disabled',null);
                        }else if(data['data']['pay_type'] == 2){
                            if(JSON.stringify(data['data']['channel']['pay_dict']) == '{}'){
                                alert('微信支付参数错误');
                                $('#id-submit').attr('disabled',null);
                            }else{
                                WeixinJSBridge.invoke('getBrandWCPayRequest',data['data']['channel']['pay_dict'],function(res){
                                    if(res.err_msg == "get_brand_wcpay_request:ok"){
                                        window.location.href='/wap/v1/callback/weixin?orderid='+data['data']['order_id'];
                                    }else if(res.err_msg == "get_brand_wcpay_request:cancel") {
                                    }else{
                                        alert('微信系统繁忙');
                                    }
                                    $('#id-submit').attr('disabled',null);
                                });
                            }

                        }else if(data['data']['pay_type'] == 3){
                            $('#id-submit').attr('disabled',null);
                            window.location.href='/wap/v1/unionpay/cardno?order_id='+data['data']['order_id']+'&token='+par_token+'&pay_amt='+pay_amt;
                        }else if(data['data']['pay_type'] == 8){
                            var d = data['data']['channel']['pay_dict'];
                            var f = $('<form></form>');
                            f.attr('method','post');
                            f.attr('action','https://m.jdpay.com/wepay/web/pay');
                            for(i in d){
                                f.append('<input type="hidden" name="'+i+'" value="'+d[i]+'"/>');
                            }
                            console.log(f);
                            $('body').append(f);
                            $('#id-submit').attr('disabled',null);
                            f.submit();
                        }else{
                            window.location.href='/wap/v1/callback/normal?orderid='+data['data']['order_id'];
                        }
                    }else{
                        window.location.href='/wap/v1/callback/normal?orderid='+data['data']['order_id'];
                    }
                }else{
                    alert(data['resperr'] || data['respmsg']);
                    $('#id-submit').attr('disabled',null);
                }
            }

        })
    })
    $('.mask-btn').click(function(){
        $('.mask').css('display','none');
    })

});

