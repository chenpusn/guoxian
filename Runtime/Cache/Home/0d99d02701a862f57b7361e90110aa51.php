<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $page_title; ?></title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
    <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="0" http-equiv="expires">
    <meta content="telephone=no, address=no" name="format-detection">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <link href="<?php echo ADDON_PUBLIC_PATH;?>/user/css/mui.min.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
    <link href="<?php echo ADDON_PUBLIC_PATH;?>/user/css/app.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
</head>
<link href="<?php echo ADDON_PUBLIC_PATH;?>/user/css/iconfont.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
<body>

<nav class="mui-bar mui-bar-tab">
    <div class="mui-tab-item mui-active mui-checkbox"
         style="background-color: #F8FAFA; padding-left: 0.5rem; text-align: center; width: 3%; font-size: 0.875rem">

        <span class="mui-tab-label">实付款:</span><span class="goods-price">￥<span id="totalPrice"><?php echo (wp_money_format($total_price)); ?></span></span>
    </div>
    <div id="submitOrderTab" class="mui-tab-item one-key-pay">
        <span class="settlement" style="background: transparent; border: 0; color: #F8FAFA">提交订单</span>
    </div>
</nav>
<div class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>

    <h1 class="mui-title">确认订单</h1>
</div>
<div class="mui-content" style="padding-top: 2rem">
    <ul class="mui-table-view cart_list">
        <?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="mui-table-view-cell mui-media cart_item">
                <dl class="goods_item" style="margin:0">
                    <dt class="goods-picture-wrapper mui-pull-left">
                        <img class="mui-media-object goods_img"
                             src="<?php echo (get_cover_url($vo["cover"])); ?>" style="width: 80%; max-width: 80%"/>
                    </dt>
                    <dd class="mui-media-body goods_desc">
                        <div class="goods-title name">
                            <?php echo ($vo["title"]); ?>
                        </div>
                        <div class="info">
                            <span class="colorless">单价：</span><span
                                class="singlePrice goods-price">￥<?php echo (wp_money_format($vo["price"])); ?></span></span>
                            <span style="margin-left: 1rem">数量：</span><span><?php echo (intval($vo["num"])); ?></span>
                        </div>
                    </dd>
                </dl>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        <li class="mui-table-view-cell mui-media cart_item" style="text-align: center">
            <span style="font-weight: bold">请就近选择一个提货点</span>
        </li>
        <?php if(is_array($fetch_address)): $i = 0; $__LIST__ = $fetch_address;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$address): $mod = ($i % 2 );++$i;?><li class="mui-table-view-cell mui-media cart_item" style="margin: 0">
                <div class="mui-input-row mui-radio">
                    <label><?php echo ($address["intro"]); ?></label>
                    <input name="address_radio" type="radio" id="<?php echo ($address["id"]); ?>">
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        <li class="mui-table-view-cell mui-media cart_item">
            <textarea name="remark" id="remark" rows="5" style="margin: 0"
                      placeholder="欢迎给我们留言，提供您的意见和建议，我们将竭诚为您提供最优服务。"></textarea>
        </li>
    </ul>
</div>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.min.js"></script>
<script type="text/javascript">
    mui.init();
    var seletedAddressId;
    mui('.mui-input-row.mui-radio').on('tap', 'input',function(){
        seletedAddressId = this.id;
    });

    var submitOrderTab = document.getElementById("submitOrderTab");
    submitOrderTab.addEventListener("tap", function () {
        /*var address_id = $('#address_id').val();
         if (address_id == '') {
         $.Dialog.fail("请选择收货地址");
         return false;
         }*/

        if(seletedAddressId > 0){
            var remark = $('#remark').val();
            var createorderUrl = "<?php echo U('createOrder');?>";
            mui.ajax(createorderUrl, {
                data: {
                    address_id: seletedAddressId,
                    remark: remark
                },
                dataType: 'json',
                type: 'post',
                timeout: 10000, //10秒
                success: function (response) {
                    var orderid = parseInt(response);
                    if (orderid == 0) {
                        mui.toast('提交订单失败，请重新尝试' + response);
                    } else {
                        var payUrl = "<?php echo U('qianfangPay');?>&order_id=" + orderid;
                        window.location.href = payUrl;
                    }
                },
                error: function (xhr, type, errorThrown) {
                    mui.toast('提交订单失败，请重新尝试' + errorThrown);
                    console.log(type);
                }
            });
        }else{
            mui.alert('请就近选择一个提货点','提示',function(){});
        }
    });
</script>
</body>
</html>