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
  .public_title{
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
                    		<?php if(is_array($core_top_menu)): $i = 0; $__LIST__ = $core_top_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ca): $mod = ($i % 2 );++$i;?><li data-id="<?php echo ($ca["id"]); ?>" class="<?php echo ($ca["class"]); ?>"><a href="<?php echo ($ca["url"]); ?>" target="_blank"><?php echo ($ca["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
                    	
                    	
                        
                        <li class="dropdown admin_nav">
                            <a href="#" class="dropdown-toggle login-nav" data-toggle="dropdown" style="">
                                <?php if(!empty($userInfo[headface_url])): ?><img class="admin_head" src="<?php echo (get_cover_url($userInfo["headface_url"])); ?>"/>
                                <?php else: ?>
                                    <img class="admin_head" src="/Public/Home/images/default.png"/><?php endif; ?>
                                <?php echo (getShort(get_username($mid),4)); ?><b class="pl_5 fa fa-sort-down"></b>
                            </a>
                            <ul class="dropdown-menu" style="display:none">
                            	<li><a href="<?php echo U ('Home/Public/add',array('id'=>$publicInfo[id]));?>">账号配置</a></li>
                                <li><a href="<?php echo U ('Home/Public/lists');?>">公众号配置</a></li>
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
  $(function(){
    $("a[href='http://demo.idouly.com/weiphp3.0/index.php?s=/home/index/main.html&mdm=172']").attr("target","_self");
   
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
            
              <li class="" data-id=""> <a href="<?php echo U('Home/Public/lists');?>">公众号管理</a><b class="active_arrow"></b></li>
              <li class="" data-id=""> <a href="<?php echo U('Home/WeixinMessage/lists');?>">消息管理</a><b class="active_arrow"></b></li>
              <li class="" data-id=""> <a href="<?php echo addons_url('UserCenter://UserCenter/lists'); ?>">用户管理</a><b class="active_arrow"></b></li>
              <li class="" data-id=""> <a href="<?php echo U('Home/Material/material_lists');?>">素材管理</a><b class="active_arrow"></b></li>
              <li class="" data-id=""> <a href="<?php echo U('Home/Message/add');?>">群发管理</a><b class="active_arrow"></b></li>
            
          </ul>
        </li>  
        
        <?php if(is_array($categorys)): $i = 0; $__LIST__ = $categorys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ca): $mod = ($i % 2 );++$i; if($ca['addons'] != ''): ?><li>
          <a class="sidenav_parent" href="javascript:;"> 
            <img src="https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_function.png"/>
            <?php echo ($ca["title"]); ?></a>
          <ul class="sidenav_sub">
            <?php if(is_array($ca["addons"])): $i = 0; $__LIST__ = $ca["addons"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php echo ($vo["class"]); ?>" data-id="<?php echo ($vo["id"]); ?>"> <a href="<?php echo ($vo[addons_url]); ?>"><?php echo ($vo["title"]); ?></a><b class="active_arrow"></b></li><?php endforeach; endif; else: echo "" ;endif; ?>
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
    <section id="contents"> 
      <ul class="tab-nav nav">
  <?php if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php echo ($vo["class"]); ?>"><a href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?><span class="arrow fa fa-sort-up"></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<?php if(!empty($sub_nav)): ?><div class="sub-tab-nav">
       <ul class="sub_tab">
       <?php if(is_array($sub_nav)): $i = 0; $__LIST__ = $sub_nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a class="<?php echo ($vo["class"]); ?>" href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?><span class="arrow fa fa-sort-up"></span></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
<!--          <li><a class="cur" href="<?php echo addons_url('WeiSite://footer/lists');?>">底部菜单配置</a></li>
          <li><a href="<?php echo addons_url('WeiSite://footer/template');?>">底部菜单模板</a></li>-->
      </ul>
</div><?php endif; ?>
<?php if(!empty($normal_tips)): ?><p class="normal_tips"><b class="fa fa-info-circle"></b> <?php echo ($normal_tips); ?></p><?php endif; ?> 
      <?php if($add_button || $del_button || $search_button || !empty($top_more_button)): ?><div class="table-bar">
        <div class="fl">
          <?php if(empty($model["extend"])): ?><div class="tools">
        <?php if($add_button): $add_url || $add_url = U('add?model='.$model['id'], $get_param); ?><a class="btn" href="<?php echo ($add_url); ?>">新 增</a><?php endif; ?>
        <?php if($del_button): $del_url || $del_url = U('del?model='.$model['id'], $get_param); ?><button class="btn ajax-post confirm" target-form="ids" url="<?php echo ($del_url); ?>">删 除</button><?php endif; ?>    
                <?php if(is_array($top_more_button)): $i = 0; $__LIST__ = $top_more_button;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($vo[is_buttion]): ?><button class="btn <?php echo ($vo["class"]); ?>" target-form="ids" url="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?></button>
                <?php else: ?>
                <a class="btn" href="<?php echo ($vo["url"]); ?>"><?php echo ($vo["title"]); ?></a><?php endif; ?>
                &nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>            
      </div><?php endif; ?>
        </div>
        <!-- 高级搜索 -->
        <?php if($search_button): ?><div class="search-form fr cf">
          <div class="sleft">
            <?php $get_param[model]=$model['name']; $search_url || $search_url = addons_url($_REQUEST ['_addons'].'://'.$_REQUEST ['_controller'].'/lists', $get_param); ?>
            <?php empty($search_key) && $search_key=$model['search_key'];empty($search_key) && $search_key='title'; ?>
            <input type="text" name="<?php echo ($search_key); ?>" class="search-input" value="<?php echo I($search_key);?>" placeholder="<?php echo ($placeholder); ?>">
            <a class="sch-btn" href="javascript:;" id="search" url="<?php echo ($search_url); ?>"><i class="btn-search"></i></a> </div>
        </div><?php endif; ?>
        <!-- 多维过滤 -->
        <?php if(!empty($muti_search)): ?><form class="muti_search cf">
          <div class="" style="line-height: 30px;">
          <?php if(is_array($muti_search)): $i = 0; $__LIST__ = $muti_search;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; switch($vo["type"]): case "select": ?><span><?php echo ($vo["title"]); ?>：</span>
                    <select name="<?php echo ($vo["name"]); ?>" class="search-input input-small">
                    <?php if(is_array($vo["options"])): $i = 0; $__LIST__ = $vo["options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$option): $mod = ($i % 2 );++$i;?><option value="<?php echo ($option["value"]); ?>" <?php if(($option["default_value"]) == "option.value"): ?>selected<?php endif; ?> ><?php echo ($option["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>                    
                    </select><?php break;?>
                <?php case "datetime": ?><span><?php echo ($vo["title"]); ?>：</span>
             <input type="datetime" name="start_time" class="search-input date input-small" value="<?php echo ($vo["start_time"]); ?>" placeholder="请选择时间">
             <span>至</span>
             <input type="datetime" name="end_time" class="search-input date input-small" value="<?php echo ($vo["end_time"]); ?>" placeholder="请选择时间"><?php break;?>
                <?php case "checkbox": ?><span><?php echo ($vo["title"]); ?>：</span>
                    <?php if(is_array($vo["options"])): $i = 0; $__LIST__ = $vo["options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$option): $mod = ($i % 2 );++$i;?><input type="checkbox" name="<?php echo ($option["name"]); ?>" class="" value="<?php echo ($option["value"]); ?>" <?php if(($option["default_value"]) == "option.value"): ?>checked<?php endif; ?> ><?php echo ($option["title"]); endforeach; endif; else: echo "" ;endif; break;?>
                <?php case "radio": ?><span><?php echo ($vo["title"]); ?>：</span>
                    <?php if(is_array($vo["options"])): $i = 0; $__LIST__ = $vo["options"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$option): $mod = ($i % 2 );++$i;?><input type="radio" name="<?php echo ($option["name"]); ?>" class="" value="<?php echo ($option["value"]); ?>" <?php if(($option["default_value"]) == "option.value"): ?>checked<?php endif; ?> ><?php echo ($option["title"]); endforeach; endif; else: echo "" ;endif; break; endswitch; endforeach; endif; else: echo "" ;endif; ?>
             
             <!-- <a class="sort " href="#" title="排序">排序:高->低</a> -->
             <button type="button" class="sch-btn btn" href="javascript:;" id="search">搜索</button> </div>
        </form><?php endif; ?>
      </div><?php endif; ?>
      <!-- 数据列表 -->
      <div class="data-table">
        <div class="table-striped">
          <table cellspacing="1">
            <!-- 表头 -->
            <thead>
              <tr>
                <?php if($check_all): ?><th class="row-selected row-selected"> <input type="checkbox" id="checkAll" class="check-all regular-checkbox"><label for="checkAll"></label></th><?php endif; ?>
                <?php if(is_array($list_grids)): $i = 0; $__LIST__ = $list_grids;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i;?><th <?php if(!empty($field["width"])): ?>width="<?php echo ($field["width"]); ?>%"<?php endif; ?> ><?php echo ($field["title"]); ?></th><?php endforeach; endif; else: echo "" ;endif; ?>
              </tr>
            </thead>
            
            <!-- 列表 -->
            <tbody>
              <?php if(is_array($list_data)): $i = 0; $__LIST__ = $list_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><tr>
                  <?php if($check_all): ?><td><input class="ids regular-checkbox" type="checkbox" value="<?php echo ($data['id']); ?>" name="ids[]" id="check_<?php echo ($data['id']); ?>"><label for="check_<?php echo ($data['id']); ?>"></label></td><?php endif; ?>
                  <?php if(is_array($list_grids)): $i = 0; $__LIST__ = $list_grids;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$grid): $mod = ($i % 2 );++$i;?><td><?php echo get_list_field($data,$grid,$model);?></td><?php endforeach; endif; else: echo "" ;endif; ?>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="page"> <?php echo ((isset($_page) && ($_page !== ""))?($_page):''); ?> </div>
    </section>
  </div>

  </div>
</div>

<script type="text/javascript">
    $(function(){
       
      $("ul.nav li[class='active'] a").attr("target","_self");
       
      var now_url = "<?php echo GetCurUrl(); ?>";  // 获取当前浏览地址
      // alert(now_url);
      $(".sidenav_sub a[href='"+now_url+"']").parent().addClass("active");
       
    })
</script>

	<!-- /主体 -->

	<!-- 底部 -->
	<div class="wrap bottom" style="background:#fff; border-top:#ddd;">
    <p class="copyright">本系统由<a href="http://weiphp.cn" target="_blank">WeiPHP</a>强力驱动</p>
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
  //搜索功能
  $("#search").click(function(){
    var url = $(this).attr('url');
        var query  = $('.search-form').find('input').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
        query = query.replace(/^&/g,'');
        if( url.indexOf('?')>0 ){
            url += '&' + query;
        }else{
            url += '?' + query;
        }
        if(query == '' ){
          var addon="<?php echo ($_REQUEST ['_addons']); ?>";
          if(addon){
            url="<?php echo addons_url($_REQUEST ['_addons'].'://'.$_REQUEST ['_controller'].'/lists');?>";
          }
        }
    window.location.href = url;
  });

    //回车自动提交
    $('.search-form').find('input').keyup(function(event){
        if(event.keyCode===13){
            $("#search").click();
        }
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