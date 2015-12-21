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
    <a id="meTab" class="mui-tab-item mui-active" style="background-color: #F8FAFA">
        <span class="mui-icon mui-icon-person"></span>
        <span class="mui-tab-label">我的信息</span>
    </a>
    <a id="myCartTab" class="mui-tab-item my-basket">
        <span class="mui-icon iconfont icon-shuiguo"></span>
        <span class="mui-tab-label">我的果盘</span>
        <span class="mui-badge" style="color: #cc044d" id="cartCountSpan"><?php echo ($cartCount); ?></span>
    </a>
    <a id="myOrder" class="mui-tab-item one-key-pay">
        <span class="mui-icon iconfont icon-jiesuanfangshi"></span>
        <span class="mui-tab-label">我的订单</span>
    </a>
</nav>
<div class="mui-content">
    <div id="slider" class="mui-slider mui-fullscreen">
        <div id="sliderSegmentedControl"
             class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <div class="mui-scroll" style="-webkit-transform: translate3d(0px, 0px, 0px) translateZ(0px); width: 100%">
                <a class="mui-control-item mui-active" style="width: 50%" href="#itemJingPin"><span
                        class="header-title-text">好之鲜水果超市</span></a>
                <!--<a class="mui-control-item" style="width: 50%" href="#itemChangXiao"><span class="header-title-text">畅销分类</span></a>-->
            </div>
        </div>
        <div class="mui-slider-group" style="-webkit-transform: translate3d(0px, 0px, 0px) translateZ(0px);">
            <div id="itemJingPin" class="mui-slider-item mui-control-content">
                <div id="scrollJinPin" class="mui-scroll-wrapper">
                    <div class="mui-scroll"
                         style="-webkit-transform: translate3d(0px, 0px, 0px) translateZ(0px);">
                        <div class="banner-picture">
                            <?php if(is_array($slideShowList)): $i = 0; $__LIST__ = $slideShowList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$slide): $mod = ($i % 2 );++$i;?><img src="<?php echo (get_cover_url($slide["img"])); ?>"><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                        <div class="category">

                        </div>
                        <ul id="goodList" class="mui-table-view">
                            <?php if(is_array($goodsList)): $i = 0; $__LIST__ = $goodsList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><li class="mui-table-view-cell mui-media">
                                    <dl style="margin: 0">
                                        <dt class="goods-picture-wrapper mui-pull-left">
                                            <img class="mui-media-object" style="width: 100%; max-width: 100%"
                                                 src="<?php echo (get_cover_url($goods["cover"])); ?>"/>
                                            <i class="oblique-tag oblique-tag-presell">热卖</i>
                                        </dt>
                                        <dd class="operation-wrapper mui-pull-right">
                                            <p class="operation" id="<?php echo ($goods["id"]); ?>"><span class="mui-icon iconfont icon-shuiguo" style="color: #FF840D; font-size: 1.5rem; display: block"></span><span style="display: inline">加入果盘</span></p>
                                        </dd>
                                        <dd class="mui-media-body">
                                            <div class="goods-title"><?php echo ($goods["title"]); ?></div>
                                            <div class="mui-ellipsis" style="max-height: 2rem; line-height: 1rem; white-space: normal; vertical-align: middle; overflow: hidden; margin-top: 0.3125rem"><?php echo ($goods["content"]); ?></div>
                                            <div class="goods-price">
                                                <strong class="price">¥<?php echo (wp_money_format($goods["price"])); ?></strong>/<span><?php echo ($goods["spec_num"]); echo (getSpecUnitByID($goods["spec_unit"])); ?></span><span
                                                    class="old-price">¥<?php echo (wp_money_format($goods["old_price"])); ?></span>
                                                <span class="mui-badge mui-badge-danger"><?php echo (getGoodsPropertyByID($goods["goods_property"])); ?></span>
                                            </div>
                                        </dd>
                                    </dl>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                        <!--<div class="mui-pull-bottom-tips">
                             <div class="mui-pull-bottom-wrapper"><span class="mui-pull-loading">上拉显示更多</span></div>
                         </div>-->
                    </div>
                    <div class="mui-scrollbar mui-scrollbar-vertical">
                        <div class="mui-scrollbar-indicator"
                             style="-webkit-transition: 0ms; transition: 0ms; display: block; height: 14px; -webkit-transform: translate3d(0px, 0px, 0px) translateZ(0px);"></div>
                    </div>
                </div>
            </div>
            <!--<div id="itemChangXiao" class="mui-slider-item mui-control-content">
                <div id="scrollChangXiao" class="mui-scroll-wrapper">
                    <div class="mui-scroll"
                         style="-webkit-transform: translate3d(0px, 0px, 0px) translateZ(0px);">
                        畅销分类
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</div>
<input type="hidden" value="<?php echo ($userInfo); ?>" id="userInfoHF">

<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.min.js?v=<?php echo SITE_VERSION;?>"></script>
<!--<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.lazyload.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.lazyload.img.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.pullToRefresh.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript"
        src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.pullToRefresh.material.js?v=<?php echo SITE_VERSION;?>"></script>-->
<script type="text/javascript">
    mui.init();

    (function ($) {
        //阻尼系数
        var deceleration = mui.os.ios ? 0.003 : 0.0009;
        $('.mui-scroll-wrapper').scroll({
            bounce: false,
            indicators: true, //是否显示滚动条
            deceleration: deceleration
        });
    })(mui);

    var userInfo = document.getElementById("userInfoHF");
    function addToCart(goodsId){
        //if(userInfo.getAttribute('value')){
            mui.ajax("<?php echo addons_url('Shop://User/addToCart');?>",{
               data:{
                   goodsId: goodsId
               },
               dataType:'json',
               type:'post',
               timeout:10000, //10秒
               success: function (response) {
                   var cartCountSpan = $("#cartCountSpan")[0];
                   cartCountSpan.innerText = response;
                   cartCountSpan.fadeOut("slow");
                   cartCountSpan.fadeOut(3000);
               },
               error:function(xhr,type,errorThrown){
                   console.log(type);
               }
            });
        //}else{
        //    window.location.assign("<?php echo addons_url('Shop://User/bindUser');?>");
        //    mui.toast('尚未绑定用户信息，请先绑定用户信息');
        //}
    }

    // 点击我的果盘按钮触发
    var myCartTab = document.getElementById("myCartTab");
    myCartTab.addEventListener("tap", function(){
        //if(userInfo.getAttribute('value')){
            window.location.assign("<?php echo addons_url('Shop://User/cart');?>");
        //}
        //else
        //{
        //    window.location.assign("<?php echo addons_url('Shop://User/bindUser');?>");
        //}
    });

    // 点击个人信息按钮触发
    var meTab = document.getElementById("meTab");
    meTab.addEventListener("tap", function(){
        //if(userInfo.getAttribute('value')){
            window.location.assign("<?php echo addons_url('Shop://User/me');?>");
        //}
        //else
        //{
        //    window.location.assign("<?php echo addons_url('Shop://User/bindUser');?>");
        //}
    })

    // 点击我的订单按钮触发
    var myOrder = document.getElementById("myOrder");
    myOrder.addEventListener("tap", function(){
        //if(userInfo.getAttribute('value')){
        window.location.assign("<?php echo addons_url('Shop://User/myOrder');?>");
        //}
        //else
        //{
        //    window.location.assign("<?php echo addons_url('Shop://User/bindUser');?>");
        //}
    });

    // 点击加入果盘按钮图标触发
    mui('.operation-wrapper').on('tap', 'p', function(){
        var goodsId = this.getAttribute('id');
        addToCart(goodsId);
    });


</script>
</body>
</html>