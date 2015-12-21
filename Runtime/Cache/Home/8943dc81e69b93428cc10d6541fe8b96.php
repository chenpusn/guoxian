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
<nav class="mui-bar mui-bar-tab" id="goHomeTab">
    <a class="mui-tab-item mui-active" href="<?php echo addons_url('Shop://User/index');?>" style="background-color: #F8FAFA">
        <span class="mui-icon mui-icon-person"></span>
        <span class="mui-tab-label">返回果园</span>
    </a>
</nav>
<div class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>

    <h1 class="mui-title">好之鲜水果超市</h1>
</div>
<div class="mui-card" style="margin-top: 5rem; padding: 2rem">
    <span><?php echo ($feedback); ?></span>
</div>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/jquery.min.js"></script>

<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.min.js"></script>

<script type="text/javascript">
    mui.init();
    var goHomeTab = document.getElementById("goHomeTab");
    goHomeTab.addEventListener("tap", function(){
        window.location.assign("<?php echo addons_url('Shop://User/index');?>");
    });
</script>
</body>
</html>