<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>
        <?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $page_title; ?>
    </title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
          name="viewport">
    <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
    <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="0" http-equiv="expires">
    <meta content="telephone=no, address=no" name="format-detection">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <link href="<?php echo ADDON_PUBLIC_PATH;?>/user/css/mui.min-2.4.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
    <link href="<?php echo ADDON_PUBLIC_PATH;?>/user/css/app.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">

    <style type="text/css">

    </style>
</head>
<body>
<form id="orderForm" action="<?php echo addons_url('Shop://User/confirmOrder');?>" method="post" onSubmit="return checkCartSubmit()">
    <nav class="mui-bar mui-bar-tab">
        <div class="mui-tab-item mui-active mui-checkbox"
             style="background-color: #F8FAFA; padding-left: 0.5rem; text-align: left; width: 3%; font-size: 0.875rem">
            <input class="custom_check check_all" id="checkAll" name="checkAll" type="checkbox"
                   checked="checked" style="position: relative; top: 0; right: 0"/>
            <span class="mui-tab-label">全选</span>
            共<span id="totalCount">12</span>件, 总计<span class="goods-price">￥<span id="totalPrice">00.00</span></span>
        </div>
        <div id="goToConfirmOrderTab" class="mui-tab-item one-key-pay">
            <span class="settlement" style="background: transparent; border: 0; color: #F8FAFA">去结算
            </span>
        </div>
    </nav>
    <div class="mui-bar mui-bar-nav">
        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>

        <h1 class="mui-title">我的果盘</h1>
    </div>
    <div class="mui-content" style="padding-top: 2rem">
        <?php if(empty($lists)): ?><div class="cart_empty">
                <img src="<?php echo ADDON_PUBLIC_PATH;?>/mobile/cart.png"/>

                <p>果盘还是空的</p>

                <p><a href="index.php?s=/addon/Shop/User/index">去果园转转吧</a></p>
            </div>

            <?php else: ?>

            <ul class="mui-table-view cart_list">
                <?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="mui-table-view-cell mui-media cart_item">
                        <!---->
                        <dl class="goods_item" style="margin:0">
                            <dt class="goods-check-wrapper mui-checkbox">
                                <input class="custom_check" id="item_<?php echo ($vo["id"]); ?>" rel="<?php echo ($vo["id"]); ?>" name="goods_ids[]"
                                       type="checkbox" value="<?php echo ($vo["goods_id"]); ?>" checked="checked"
                                       style="position: relative; top:0; right: 0"/>

                            </dt>
                            <dt class="goods-picture-wrapper mui-pull-left">
                                <img class="mui-media-object goods_img"
                                     src="<?php echo (get_cover_url($vo["goods_data"]["cover"])); ?>" style="width: 80%; max-width: 80%"/>
                            </dt>
                            <dd class="operation-wrapper mui-pull-right">
                                <p class="operation" id="<?php echo ($vo["id"]); ?>"><span class="mui-icon mui-icon-trash"
                                                                         style="color: #FF840D; font-size: 1.5rem; display: block"></span><span
                                        style="display: inline">删除</span></p>
                            </dd>
                            <dd class="mui-media-body goods_desc">
                                <div class="goods-title name">
                                    <?php echo ($vo["goods_data"]["title"]); ?>
                                </div>

                                <div class="info goods-price"><span class="colorless">单价:</span><span
                                        class="orange">￥<span
                                        class="singlePrice"><?php echo (wp_money_format($vo["goods_data"]["price"])); ?></span></span>
                                </div>

                                <div class="buy_count mui-numbox" data-numbox-min="1" data-numbox-step="1">
                                    <button class="mui-btn mui-btn-numbox-minus reduce" type="button">-</button>
                                    <input class="mui-input-numbox" type="number" name="buyCount[<?php echo ($vo["goods_id"]); ?>]"
                                           value="<?php echo (intval($vo["num"])); ?>" rel="buyCount">
                                    <button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
                                </div>

                            </dd>
                        </dl>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
    </div>
</form>

<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/jquery.min.js"></script>
<!--<script type="text/javascript" src="http://yaotv.qq.com/shake_tv/include/js/lib/zepto.1.1.4.min.js"></script>-->
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui-2.7.js"></script>

<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/shop.js?v=<?php echo SITE_VERSION;?>"></script>

<script type="text/javascript">
    mui.init();
    $(function () {
        updatePriceAndCount();
    });

    mui('.operation-wrapper').on('tap', 'p', deleteGoods);

    var goToConfirmOrderTab = document.getElementById("goToConfirmOrderTab");
    goToConfirmOrderTab.addEventListener("tap", function(){
        document.getElementById("orderForm").submit();
    });
    function deleteGoods() {
        var goodsId = this.getAttribute('id');
        if (confirm('确认要从购物车删除该水果吗？')) {
            mui.ajax('index.php?s=/addon/Shop/User/delCart', {
                data: {
                    ids: goodsId
                },
                dataType: 'json',
                type: 'post',
                timeout: 10000, //10秒
                success: function (response) {
                    if (response > 0) {
                        mui.toast('已成功删除');
                    }
                    else {
                        mui.toast('删除出错，请稍候尝试');
                    }
                    window.location.reload();
                },
                error: function (xhr, type, errorThrown) {
                    mui.toast('删除出错，请稍候尝试');
                    console.log(type);
                }
            });
        }
    }

</script>
</body>
</html>