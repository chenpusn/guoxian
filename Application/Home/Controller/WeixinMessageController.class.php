<?php

namespace Home\Controller;

/**
 * 前台首页控制器
 */
class WeixinMessageController extends HomeController {
	function _initialize() {
		parent::_initialize ();
		
		$act = strtolower ( ACTION_NAME );
		
		$res ['title'] = '消息列表';
		$res ['url'] = U ( 'lists' );
		$res ['class'] = $act == 'lists' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '收藏列表';
		$res ['url'] = U ( 'collect' );
		$res ['class'] = $act == 'collect' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '待处理列表';
		$res ['url'] = U ( 'deal' );
		$res ['class'] = $act == 'deal' ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
	}
	public function collect() {
		$map ['collect'] = 1;
		$map ['type'] = 0;
		$map ['ToUserName'] = get_token ();
		$list = M ( 'weixin_message' )->where ( $map )->order ( 'id desc' )->selectPage ();
		
		$dao = D ( 'Common/User' );
		foreach ( $list ['list_data'] as &$v ) {
			$user = $dao->getUserInfoByOpenid ( $v ['FromUserName'] );
			if ($user) {
				$v ['user'] = $user;
			}
			$v ['Content'] = $this->_deal_content ( $v );
		}
		
		$this->assign ( $list );
		$this->display ( 'collect' );
	}
	public function deal() {
		$map ['deal'] = 1;
		$map ['type'] = 0;
		$map ['ToUserName'] = get_token ();
		$list = M ( 'weixin_message' )->where ( $map )->order ( 'id desc' )->selectPage ();
		
		$dao = D ( 'Common/User' );
		foreach ( $list ['list_data'] as &$v ) {
			$user = $dao->getUserInfoByOpenid ( $v ['FromUserName'] );
			if ($user) {
				$v ['user'] = $user;
			}
			$v ['Content'] = $this->_deal_content ( $v );
		}
		
		$this->assign ( $list );
		$this->display ( 'collect' );
	}
	public function lists() {
		$page = I ( 'p', 1, 'intval' );
		$row = 20;
		$limit = (($page - 1) * $row) . ',' . ($page * $row);
		
		/* 查询记录总数 */
		$count = M ()->query ( "SELECT count(DISTINCT FromUserName) as num FROM `wp_weixin_message`" );
		$count = intval ( $count [0] ['num'] );
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$token = get_token ();
		$sql = "SELECT * FROM (SELECT * FROM wp_weixin_message WHERE type=0 AND `ToUserName` = '{$token}' ORDER BY is_read ASC, id DESC) temp GROUP BY FromUserName ORDER BY is_read ASC,id DESC LIMIT " . $limit;
		$list ['list_data'] = M ()->query ( $sql );
		
		$dao = D ( 'Common/User' );
		foreach ( $list ['list_data'] as &$v ) {
			$user = $dao->getUserInfoByOpenid ( $v ['FromUserName'] );
			$v ['openid'] = $v ['FromUserName'];
			if ($user) {
				$v ['user'] = $user;
			}
			$v ['Content'] = $this->_deal_content ( $v );
		}
		
		$this->assign ( $list );
		$this->display ( 'lists' );
	}
	function person() {
		$this->assign ( 'nav', array () );
		$map ['FromUserName'] = I ( 'openid' );
		$map ['ToUserName'] = get_token ();
		$list = M ( 'weixin_message' )->where ( $map )->order ( 'id desc' )->selectPage ();
		
		$dao = D ( 'Common/User' );
		foreach ( $list ['list_data'] as &$v ) {
			if ($v ['type'] == 1) {
				$user = $dao->getUserInfo ( $v ['MsgId'] );
			} else {
				$user = $dao->getUserInfoByOpenid ( $v ['FromUserName'] );
				$toUser = $user;
			}
			if ($user) {
				$v ['user'] = $user;
			}
			
			$v ['Content'] = $this->_deal_content ( $v );
		}
		$this->assign ( 'toUser', $toUser );
		$this->assign ( $list );
		$this->assign ( 'noraml_tips', '当用户发消息给认证公众号时，管理员可以在48小时内给用户回复信息' );
		
		$this->display ();
	}
	function _deal_content($data) {
		switch ($data ['MsgType']) {
			case 'image' :
				$data ['Content'] = '<a target="_blank" href="' . $data ['PicUrl'] . '"><img width="100" src="' . $data ['PicUrl'] . '"></a>';
				break;
			case 'voice' :
				$data ['Content'] = 'voice'; // TODO
				break;
			case 'video' :
				$data ['Content'] = 'video'; // TODO
				break;
			case 'shortvideo' :
				$data ['Content'] = 'shortvideo'; // TODO
				break;
			case 'location' :
				$data ['Content'] = 'location'; // TODO
				break;
			case 'link' :
				$data ['Content'] = '<a herf="' . $data ['Url'] . '"<h3>' . $data ['Title'] . '</h3><br>' . $data ['Description'] . '</a>';
				break;
		}
		return $data ['Content'];
	}
	// 设置消息状态
	function set_status() {
		$map ['id'] = I ( 'id' );
		$field = I ( 'field' );
		$val = I ( 'val' );
		$res = M ( 'weixin_message' )->where ( $map )->setField ( $field, $val );
		echo $res;
	}
	
	// 使用客户接口回复用户信息 TODO 目前只支持发文本
	function reply() {
	    //回复类型：text：文本  appmsg：图文消息   image：图片消息
		$msg_type = I ( 'msg_type' );
		switch ($msg_type){
		    case 'text':
		        $param ['touser'] = I ( 'openid' );
		        $param ['msgtype'] = 'text';
		        $param ['text'] ['content'] = I ( 'content' );
		        break;
		    case 'appmsg':
		        $param['touser']=I('openid');
		        $param ['msgtype'] = 'news';
		        
		        $appmsgId=I('appmsg_id');
		        $map['group_id']=$appmsgId;
		        $appMsgData=M('material_news')->where($map)->select();
		        foreach ($appMsgData as $vo){
		            //文章内容
		            $art ['title'] = $vo['title'];
		            $art ['description'] = $vo['intro'];
		            $art ['url'] =  U ( 'Material/news_detail', array ('id' => $vo['id'] ) );
		            //获取封面图片URL
		            $coverId=$vo['cover_id'];
		            $art['picurl']=get_cover_url($coverId);
		            $articles[]=$art;
		        }
		        $param['news']['articles']=$articles;
		        break;
		    case 'image':
		        //新增图片素材
		        $coverId=I('image');
		        $mediaId=$this->get_image_media_id($coverId);
		        $param ['touser'] = I ( 'openid' );
		        $param ['msgtype'] = 'image';
		        $param ['image'] ['media_id'] = $mediaId;
		        break;
		    default:
		        $param=array();
		            break;
		}
		$url = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=' . get_access_token ();
		
// 		dump($param);
// 		die;
		
		$res = post_data ( $url, $param );
		if ($res ['errcode'] != 0) {
			$this->error ( error_msg ( $res ) );
		} else {
			$data ['ToUserName'] = get_token ();
			$data ['FromUserName'] = $param ['touser'];
			$data ['CreateTime'] = NOW_TIME;
			$data ['Content'] = $param ['text'] ['content'];
			$data ['MsgId'] = $this->mid; // 该字段保存管理员ID
			$data ['type'] = 1;
			$data ['is_read'] = 1;
			M ( 'weixin_message' )->add ( $data );
			
			$this->success ( '回复成功' );
		}
		// dump ( $res );
	}
	//新增临时图片素材
	function get_image_media_id($cover_id) {
	    $cover = get_cover ( $cover_id );
	    $driver = C ( 'PICTURE_UPLOAD_DRIVER' );
	    if ($driver != 'Local' && ! file_exists ( SITE_PATH . $cover ['path'] )) { // 先把图片下载到本地
	        	
	        $pathinfo = pathinfo ( SITE_PATH . $cover ['path'] );
	        mkdirs ( $pathinfo ['dirname'] );
	        	
	        $content = wp_file_get_contents ( $cover ['url'] );
	        $res = file_put_contents ( SITE_PATH . $cover ['path'], $content );
	        if (!$res) {
	            $this->error ( '远程图片下载失败' );
	        }
	    }
	
	    $path = $cover ['path'];
	    if (! $path) {
	        $this->error ( '获取图片素材失败' );
	    }
	    $param ['type'] = 'image';
	    $param ['media'] = '@' . realpath ( SITE_PATH . $path );
	    $url = 'https://api.weixin.qq.com/cgi-bin/media/upload?access_token=' . get_access_token ();
	    $res = post_data ( $url, $param, true );
	    if (isset ( $res ['errcode'] ) && $res ['errcode'] != 0) {
	        $this->error ( error_msg ( $res, '封面图上传' ) );
	    }
	
	    return $res ['media_id'];
	}
}