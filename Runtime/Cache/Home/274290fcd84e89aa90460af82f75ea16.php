<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<meta content="<?php echo C('WEB_SITE_KEYWORD');?>" name="keywords"/>
<meta content="<?php echo C('WEB_SITE_DESCRIPTION');?>" name="description"/>
<link rel="shortcut icon" href="<?php echo SITE_URL;?>/favicon.ico">
<title><?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $page_title; ?></title>
<link href="/Public/static/font-awesome/css/font-awesome.min.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/base.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/module.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<link href="/Public/Home/css/weiphp.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js?v=<?php echo SITE_VERSION;?>"></script>
<![endif]-->

<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="/Public/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/Public/static/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="/Public/static/zclip/ZeroClipboard.min.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/dialog.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/admin_common.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/Home/js/admin_image.js?v=<?php echo SITE_VERSION;?>"></script>
<script type="text/javascript" src="/Public/static/masonry/masonry.pkgd.min.js"></script>
<script type="text/javascript">
var  IMG_PATH = "/Public/Home/images";
var  STATIC = "/Public/static";
var  ROOT = "";
var  UPLOAD_PICTURE = "<?php echo U('home/File/uploadPicture',array('session_id'=>session_id()));?>";
var  UPLOAD_FILE = "<?php echo U('File/upload',array('session_id'=>session_id()));?>";
</script>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body>
	<!-- 头部 -->
	<style type="text/css">
    .public_title {
        position: relative;
        top: -18px;
        color: #666;
        font-size: 18px;
        left: 10px;
    }
</style>

<!-- 提示 -->
<div id="top-alert" class="top-alert-tips alert-error" style="display: none;">
    <a class="close" href="javascript:;"><b class="fa fa-times-circle"></b></a>

    <div class="alert-content">这是内容</div>
</div>
<!-- 导航条
================================================== -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <?php if ($mid ) { $link = M ( 'public_link' )->where ( 'uid=' . $mid )->order ( 'is_use desc' )->select (); foreach ( $link as $l ) { $mp_ids [] = $l ['mp_id']; $is_use [$l ['mp_id']] = $l ['is_use']; } $mp_ids = getSubByKey ( $link, 'mp_id' ); if (! empty ( $mp_ids )) { $mp_ids_list = count ( $mp_ids ); $mp_ids = implode ( ',', $mp_ids ); $map ['id'] = array ( 'in', $mp_ids ); $public_list = M ( 'public' )->where ( $map )->order ( 'FIND_IN_SET(id,"' . $mp_ids . '")' )->select (); $public = $public_list [0]; $token = get_token (); if ($public ['public_id'] && ($is_use [$public ['id']] == 0 || $token == '' || $token == - 1)) { get_token ( $public ['public_id'] ); } unset ( $public_list [0] ); } else { $mp_ids_list=0; } $publicInfo=M('public')->where(array('uid'=>$mid))->find(); $userInfo=getUserInfo($mid); $nowPublicInfo = M('public')->where(array('token'=>get_token()))->find(); } ?>
    <div class="wrap">
        <a class="brand" title="<?php echo C('WEB_SITE_TITLE');?>" href="<?php echo U('index/index');?>">
            <?php if($nowPublicInfo['headface_url'] != NULL): ?><img height="52" src="<?php echo (get_cover_url($nowPublicInfo["headface_url"])); ?>"/>
                <?php else: ?>
                <img height="52" src="/Public/Home/images/logo.png"/><?php endif; ?>
            <span class="public_title"><?php echo empty($page_title) ? C('WEB_SITE_TITLE') : $nowPublicInfo['public_name']; ?></span>
        </a>
        <div class="top_nav">
            <?php if(is_login()): ?><ul class="nav" style="margin-right:0">
                    <?php if($myinfo["is_init"] == 0 ): ?><li><p>该账号配置信息尚未完善，功能还不能使用</p></li>
                        <?php elseif($myinfo["is_audit"] == 0 and !$reg_audit_switch): ?>
                        <li><p>该账号配置信息已提交，请等待审核</p></li>
                        <?php else: ?>
                        <?php if(is_array($core_top_menu)): $i = 0; $__LIST__ = $core_top_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ca): $mod = ($i % 2 );++$i;?><li data-id="<?php echo ($ca["id"]); ?>" class="<?php echo ($ca["class"]); ?>"><a href="<?php echo ($ca["url"]); ?>"
                                                                          target="<?php echo ($ca["target"]); ?>"><?php echo ($ca["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
                    <li class="dropdown admin_nav">
                        <a href="#" class="dropdown-toggle login-nav" data-toggle="dropdown" style="">
                            <?php if(!empty($userInfo[headface_url])): ?><img class="admin_head" src="<?php echo (get_cover_url($userInfo["headface_url"])); ?>"/>
                                <?php else: ?>
                                <img class="admin_head" src="/Public/Home/images/default.png"/><?php endif; ?>
                            <?php echo (getShort(get_username($mid),4)); ?><b class="pl_5 fa fa-sort-down"></b>
                        </a>
                        <ul class="dropdown-menu" style="display:none">
                            <!--<li><a href="<?php echo U ('Home/Public/add',array('id'=>$publicInfo[id]));?>">账号配置</a></li>
                            <li><a href="<?php echo U ('Home/Public/lists');?>">公众号配置</a></li>-->
                            <li><a href="<?php echo U('User/profile');?>">修改密码</a></li>
                            <li><a href="<?php echo U('User/logout');?>">退出</a></li>
                        </ul>
                    </li>
                </ul>
                <?php else: ?>
                <ul class="nav" style="margin-right:0">
                    <li style="padding-right:20px">你好!欢迎来到<?php echo C('WEB_SITE_TITLE');?></li>
                    <li>
                        <a href="<?php echo U('User/login');?>">登录</a>
                    </li>
                    <li>
                        <a href="<?php echo U('User/register');?>">注册</a>
                    </li>
                    <li>
                        <a href="<?php echo U('admin/index/index');?>" style="padding-right:0">后台入口</a>
                    </li>
                </ul><?php endif; ?>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("a[href='http://demo.idouly.com/weiphp3.0/index.php?s=/home/index/main.html&mdm=172']").attr("target", "_self");

    })
</script>
	<!-- /头部 -->
	
	<!-- 主体 -->
	
<?php if(!is_login()){ Cookie ( '__forward__', $_SERVER ['REQUEST_URI'] ); redirect(U('home/user/login',array('from'=>5))); } ?>
<div id="main-container" class="container" style="position:relative">
    <div class="no_side_main_body">
        
    <div class="span9 page_message">
        <section id="contents">
            <ul class="tab-nav nav">
    <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php echo ($vo["class"]); ?>"><a href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?><span class="arrow fa fa-sort-up"></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<?php if(!empty($sub_nav)): ?><div class="sub-tab-nav">
        <ul class="sub_tab">
            <?php if(is_array($sub_nav)): $i = 0; $__LIST__ = $sub_nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a class="<?php echo ($vo["class"]); ?>" href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?><span class="arrow fa fa-sort-up"></span></a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
            <!--<li><a class="cur" href="<?php echo addons_url('WeiSite://footer/lists');?>">底部菜单配置</a></li>
                      <li><a href="<?php echo addons_url('WeiSite://footer/template');?>">底部菜单模板</a></li>-->
        </ul>
    </div><?php endif; ?>
<?php if(!empty($normal_tips)): ?><p class="normal_tips"><b class="fa fa-info-circle"></b> <?php echo ($normal_tips); ?></p><?php endif; ?>
            <div class="table-bar">
                <!-- 多维过滤 -->
                <form class="muti_search cf" style="text-align: right " method="post"
                      action="<?php echo addons_url('Shop://Order/lists');?>">
                    <div class="" style="line-height: 30px;">
                        <span>订单日期</span>
                        <input type="datetime" name="search_date"
                               class="search-input date input-small" value="<?php echo ($search_date); ?>"
                               placeholder="2015-12-11">
                        <span>客户信息</span>
                        <input type="text" name="search_keyword"
                               class="search-input input-small" value="<?php echo ($search_keyword); ?>"
                               placeholder="请输入客户手机号码 或者 姓名" style="width: 12rem">
                        <!-- <a class="sort " href="#" title="排序">排序:高->低</a> -->
                        <button type="submit" class="sch-btn btn" id="searchBtn"
                                style="width: 5rem">搜索
                        </button>
                    </div>
                </form>
            </div>

            <!-- 数据列表 -->
            <div class="data-table">
                <div class="table-striped">
                    <table cellspacing="1">
                        <!-- 表头 -->
                        <thead>
                        <tr>
                            <?php if(is_array($title_lists)): $i = 0; $__LIST__ = $title_lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i;?><!--<?php if(empty($field["width"])): ?><th><?php echo ($field["title"]); ?></th>
                                <?php else: ?>
                                  <th width="<?php echo ($field["width"]); ?>%"><?php echo ($field["title"]); ?></th><?php endif; ?>-->
                                <th><?php echo ($field); ?></th><?php endforeach; endif; else: echo "" ;endif; ?>
                        </tr>
                        </thead>

                        <!-- 列表 -->
                        <tbody>
                        <?php if(is_array($order_lists)): $i = 0; $__LIST__ = $order_lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><tr>
                                <td><?php echo ($data["order_number"]); ?></td>
                                <td><?php echo ($data["goods"]); ?></td>
                                <td><?php echo ($data["uid"]); ?></td>
                                <td><?php echo ($data["total_price"]); ?></td>
                                <td><?php echo (time_format($data["cTime"])); ?></td>
                                <td><?php echo (getNamebyPayStatus($data["pay_type"])); ?></td>
                                <td><?php echo (getNamebyOrderStatus($data["status_code"])); ?></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="page"> <?php echo ((isset($_page) && ($_page !== ""))?($_page):''); ?></div>
        </section>
    </div>

    </div>
</div>

	<!-- /主体 -->

	<!-- 底部 -->
	<div class="wrap bottom">
    <!-- <p class="copyright">本系统由<a href="http://weiphp.cn" target="_blank">WeiPHP</a>强力驱动</p>-->
    <p class="copyright">&copy;本系统由好之鲜水果商务有限公司版权所有 由七玥天使智慧科技公司技术制作</p>
</div>

<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "", //当前网站地址
		"APP"    : "/index.php?s=", //当前项目地址
		"PUBLIC" : "/Public", //项目公共目录地址
		"DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
		"VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
	}
})();
</script>

    <link href="/Public/static/datetimepicker/css/datetimepicker.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
    <?php if(C('COLOR_STYLE')=='blue_color') echo '
        <link href="/Public/static/datetimepicker/css/datetimepicker_blue.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
        '; ?>
    <link href="/Public/static/datetimepicker/css/dropdown.css?v=<?php echo SITE_VERSION;?>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/Public/static/datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/Public/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js?v=<?php echo SITE_VERSION;?>" charset="UTF-8"></script>
    <script type="text/javascript">
        $(function(){
            $('.date').datetimepicker({
                format: 'yyyy-mm-dd',
                language:"zh-CN",
                minView:2,
                autoclose:true
            });
        });
    </script>
 <!-- 用于加载js代码 -->
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
<?php echo ($tongji_code); ?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
    
</div>

	<!-- /底部 -->
</body>
</html>