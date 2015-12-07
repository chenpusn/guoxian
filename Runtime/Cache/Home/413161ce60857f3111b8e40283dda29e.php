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
                                                                          target="_blank"><?php echo ($ca["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
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
	
<!-- <?php  if(!is_login()){ Cookie ( '__forward__', $_SERVER ['REQUEST_URI'] ); redirect(U('home/user/login',array('from'=>4))); } ?>
 -->
<?php $m = strtolower(MODULE_NAME); $c = strtolower(CONTROLLER_NAME); $a = strtolower(ACTION_NAME); if(!is_login()){ redirect(U('home/user/login')); } $ad = ucfirst ( parse_name ( $_REQUEST['_addons'], 1 ) ); $navClass[$ad] = 'active'; $navClass[$m.'_'.$c.'_'.$a] = 'active'; $addonList = D ( 'Addons' )->getWeixinList (false, array(), true); $categorys = M ( 'addon_category' )->order ( 'sort asc, id desc' )->select (); foreach($categorys as &$cate){ foreach($addonList as $k=>$a){ if($cate['id']==intval($a['cate_id'])){ $cate['addons'][] = $a; unset($addonList[$k]); } } } ?>
<div id="main-container" class="admin_container">

    <div class="sidebar">


        <ul class="sidenav">

            <li>
                <a class="sidenav_parent" href="javascript:;">
                    <img src="https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_function.png"/>
                    管理</a>
                <ul class="sidenav_sub">

                    <li class="" data-id=""><a href="<?php echo U('Home/Public/lists');?>">公众号管理</a><b class="active_arrow"></b>
                    </li>
                    <li class="" data-id=""><a href="<?php echo U('Home/WeixinMessage/lists');?>">消息管理</a><b
                            class="active_arrow"></b></li>
                    <li class="" data-id=""><a
                            href="<?php echo addons_url('UserCenter://UserCenter/lists'); ?>">用户管理</a><b
                            class="active_arrow"></b></li>
                    <li class="" data-id=""><a href="<?php echo U('Home/Material/material_lists');?>">素材管理</a><b
                            class="active_arrow"></b></li>
                    <li class="" data-id=""><a href="<?php echo U('Home/Message/add');?>">群发管理</a><b class="active_arrow"></b></li>

                </ul>
            </li>

            <?php if(is_array($categorys)): $i = 0; $__LIST__ = $categorys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ca): $mod = ($i % 2 );++$i; if($ca['addons'] != ''): ?><li>
                        <a class="sidenav_parent" href="javascript:;">
                            <img src="https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_function.png"/>
                            <?php echo ($ca["title"]); ?></a>
                        <ul class="sidenav_sub">
                            <?php if(is_array($ca["addons"])): $i = 0; $__LIST__ = $ca["addons"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php echo ($vo["class"]); ?>" data-id="<?php echo ($vo["id"]); ?>"><a href="<?php echo ($vo[addons_url]); ?>"><?php echo ($vo["title"]); ?></a><b
                                        class="active_arrow"></b></li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>

            <!-- <li>
              <?php if(!empty($now_top_menu_name)): ?><a class="sidenav_parent" href="javascript:;">
                <img src="https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_function.png"/>
                <?php echo ($now_top_menu_name); ?></a><?php endif; ?>
              <ul class="sidenav_sub">
                <?php if(is_array($core_side_menu)): $i = 0; $__LIST__ = $core_side_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php echo ($vo["class"]); ?>" data-id="<?php echo ($vo["id"]); ?>"> <a href="<?php echo ($vo["url"]); ?>"> <?php echo ($vo["title"]); ?> </a><b class="active_arrow"></b></li><?php endforeach; endif; else: echo "" ;endif; ?>
              </ul>
            </li> -->

        </ul>
    </div>

    <div class="main_body">
        
  <div class="span9 page_message">
    <section id="contents" class="tab-content">
      <div class="table-bar">
        <div class="main_data">
        	<div class="left">
        	<a class="data_item" href="<?php echo addons_url('UserCenter://UserCenter/lists');?>">
            	<span><?php echo (intval($count["today"])); ?></span><br/>今日新增用户
            </a>
            <a class="data_item" href="<?php echo addons_url('UserCenter://UserCenter/lists');?>">
            	<span><?php echo (intval($count["yestoday"])); ?></span><br/>昨日新增用户
            </a>
            </div>
            <a class="data_item" href="<?php echo addons_url('UserCenter://UserCenter/lists');?>">
            	<span><?php echo (intval($count["total"])); ?></span><br/>总用户数
            </a>
            
        </div>
        <?php if(!empty($notices)): ?><h6 class="main_h6">官网公告</h6>
        <div class="main_notice">
        <?php if(is_array($notices)): $i = 0; $__LIST__ = $notices;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nt): $mod = ($i % 2 );++$i;?><p><a href="<?php echo ($nt["url"]); ?>" target="_blank">◆ <?php echo ($nt["title"]); ?></a></p><?php endforeach; endif; else: echo "" ;endif; ?>
        </div><?php endif; ?>
        <h6 class="main_h6">功能模块</h6>
     
       
      <div class="main_apps">
      	<ul>
            <?php if(is_array($list_data)): $i = 0; $__LIST__ = $list_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><li>
                	<div class="img">
                		<a href="<?php echo ($data["addons_url"]); ?>"><img src="<?php echo ($data["app_icon"]); ?>"/></a>
                    	
                    </div>
                	<div class="desc">
                          <p class="name"><?php echo ($data["title"]); ?></p>
                          <p class="intro"><?php echo ($data["description"]); ?></p>
                          <!--<p><a class="use_btn" href="<?php echo U('setStatus','addon='.$data['name'].'&status='.$data['status']);?>"><?php echo ($data["action"]); ?></a></p>-->
                    </div>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </div>
      <!--<div class="mt_10"><center><a class="btn btn-large" href="http://idouly.com/?cat=2" target="_blank">获取更多应用</a></center></div>-->
      </div>

    </section>
  </div>

    </div>
</div>

<script type="text/javascript">
    $(function () {

        $("ul.nav li[class='active'] a").attr("target", "_self");

        var now_url = "<?php echo GetCurUrl(); ?>";  // 获取当前浏览地址
        // alert(now_url);
        $(".sidenav_sub a[href='" + now_url + "']").parent().addClass("active");

    })
</script>

	<!-- /主体 -->

	<!-- 底部 -->
	<div class="wrap bottom" style="background:#fff; border-top:#ddd;">
    <!-- <p class="copyright">本系统由<a href="http://weiphp.cn" target="_blank">WeiPHP</a>强力驱动</p>-->
    <p class="copyright">之味果鲜版权所有 七玥天使技术制作</p>
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
 
  <script type="text/javascript">
$(function(){
	//ajax 提交启用
	$('.use_btn').click(function(){
		var href = $(this).attr('href');
		var _this =$(this);
		if(href.indexOf("1.html")!=-1){
			//禁用
			$.get(href,function(){
				updateAlert("更新成功!","alert-success");
				_this.attr('href',href.replace("1.html","0.html"));
				_this.text("启用");
				_this.parents('tr').attr('style','color:#ccc');
				_this.parents('tr').find('.use_status').text("已禁用");;
			});
		}else{
				//启用
				$.get(href,function(){
					updateAlert("更新成功!","alert-success");
					_this.attr('href',href.replace("0.html","1.html"));
					_this.text("禁用");
					_this.parents('tr').removeAttr('style');
					_this.parents('tr').find('.use_status').text("已启用");
				});
				}
		setTimeout(function(){
			$('#top-alert').find('.close').click();
			},3000);		
		return false;
		
		});

})
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