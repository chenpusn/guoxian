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
<style type="text/css">
    .mui-input-row label {
        width: 25%;
    }

    .mui-input-row label ~ input {
        width: 75%;
    }
</style>
<body>
<div class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>

    <h1 class="mui-title">绑定账号</h1>
</div>
<div class="mui-content" style="padding-top: 3.75rem">
    <div class="mui-content-padded" style="margin: 5px;">
        <form class="mui-input-group" action="<?php echo U('bindUser');?>" method="post" onSubmit="return tgSubmit()">
            <div class="mui-input-row">
                <label for="truename">联系人:</label>
                <input type="text" id="truename" name="truename" value="<?php echo ($info["truename"]); ?>"
                       placeholder="请输入联系人姓名，用作取货身份凭证">
            </div>
            <div class="mui-input-row">
                <label for="mobile">手机号:</label>
                <input type="text" id="mobile" name="mobile" class="mui-input-clear" placeholder="请输入手机号码"
                       value="<?php echo ($info["mobile"]); ?>"
                       data-input-clear="5"><span class="mui-icon mui-icon-clear mui-hidden"></span>
            </div>
            <div class="mui-button-row">
                <button type="button" class="mui-btn mui-btn-danger" onclick="javascript:history.go(-1)">返回首页</button>
                &nbsp;&nbsp;
                <button type="submit" class="mui-btn mui-btn-primary">绑定账号</button>
            </div>
        </form>
    </div>
</div>


<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo ADDON_PUBLIC_PATH;?>/user/js/mui.min.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript">
    mui.init({});
    function tgSubmit() {
        var userName = $('#truename').val();
        if ($.trim(userName) == "") {
            mui.toast("请填写姓名");
            return false;
        }
        var userPhone = $("#mobile").val();
        if ($.trim(userPhone) == "") {
            mui.toast("请填写手机号");
            return false;
        }
        var patrn = /^0?(13[0-9]|15[0123456789]|18[0123456789]|14[0123456789])[0-9]{8}$/;
        if (!patrn.exec($.trim(userPhone))) {
            mui.toast('手机号格式不正确，请确认填写了正确的号码');
            return false;
        }
        return true;
    }
</script>
</body>
</html>