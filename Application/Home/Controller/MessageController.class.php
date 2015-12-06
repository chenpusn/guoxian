<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class MessageController extends HomeController {
	public function lists() {
		$this->display ( 'Addons/lists' );
	}
	public function add() {
		$model = $this->getModel ( 'Message' );
		if (IS_POST) {
			if (! C ( 'SEND_GROUP_MSG' )) {
				$this->error ( '抱歉，您的公众号没有群发消息的权限' );
			}
			$send_type = I ( 'send_type', 0, 'intval' );
			$group_id = I ( 'group_id', 0, 'intval' );
			$send_openids = I ( 'send_openids' );
			
			if ($send_type == 0) {
				$_POST ['msg_id'] = $this->_send_by_group ( $group_id );
			} else {
				$_POST ['msg_id'] = $this->_send_by_openid ( $send_openids );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$this->_saveKeyword ( $model, $id );
				
				// 清空缓存
				method_exists ( $Model, 'clear' ) && $Model->clear ( $id, 'edit' );
				
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'add' ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'], $model ['field_sort'] );
			
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];
			
			! C ( 'SEND_GROUP_MSG' ) && $this->assign ( 'normal_tips', '温馨提示：目前微信仅开放认证公众号的群发消息权限，未认证公众号无法使用此功能' );
			
			$map ['token'] = get_token ();
			$map ['manager_id'] = $this->mid;
			$map ['is_del'] = 0;
			$group_list = M ( 'auth_group' )->where ( $map )->select ();
			$this->assign ( 'group_list', $group_list );
			
			$this->display ();
		}
	}
	function del() {
		$model = $this->getModel ( 'Message' );
		parent::common_del ( $model );
	}
	// 预览群发的信息
	function preview() {
		if (! C ( 'SEND_GROUP_MSG' )) {
			$this->error ( '抱歉，您的公众号没有群发消息的权限' );
		}
		$openids = wp_explode ( I ( 'preview_openids' ) );
		if (empty ( $openids )) {
			$this->error ( '预览OpenID不能为空' );
		}
		
		$info = $this->_sucai_media_info ();
		if ($info ['msgtype'] == 'text') {
			$param ['text'] ['content'] = $info ['media_id'];
		} else {
			$param ['mpnews'] ['media_id'] = $info ['media_id'];
		}
		$param ['msgtype'] = $info ['msgtype'];
		
		$url = 'https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token=' . get_access_token ();
		foreach ( $openids as $openid ) {
			$param ['touser'] = $openid;
			
			$res = post_data ( $url, $param );
		}
		$this->success ( '发送成功~' );
	}
	// 按用户组发送
	function _send_by_group($group_id) {
		if ($group_id) { // 本地分组ID换取微信端的分组ID
			$map ['id'] = $group_id;
			$groupid = M ( 'auth_group' )->where ( $map )->getField ( 'wechat_group_id' );
		}
		
		$url = 'https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=' . get_access_token ();
		
		$paramStr='';
		if ($group_id) {
// 			$param ['filter'] ['is_to_all'] = "false";
// 			$param ['filter'] ['group_id'] = $groupid;
			$paramStr.='{"filter":{"is_to_all":false,"group_id":"'.$groupid.'"},';
		} else {
// 			$param ['filter'] ['is_to_all'] = "true";
		    $paramStr.='{"filter":{"is_to_all":true},';
		}
		$info = $this->_sucai_media_info ();
		
		if ($info ['msgtype'] == 'text') {
// 			$param ['text'] ['content'] = $info ['media_id'];
			$paramStr.='"text":{"content":"'.$info['media_id'].'"},"msgtype":"text"}';
		} else {
// 			$param ['mpnews'] ['media_id'] = $info ['media_id'];
		    $paramStr.='"mpnews":{"media_id":"'.$info['media_id'].'"},"msgtype":"mpnews"}';
		}
// 		$param ['msgtype'] = $info ['msgtype'];
		// $param ['msgtype'] = 'news';
// 		dump($paramStr);

		$res = post_data ( $url, $paramStr );
		if ($res ['errcode'] != 0) {
			$this->error ( error_msg ( $res ) );
		} else {
			return $res ['msg_id'];
		}
	}
	// 按用户组发送 订阅号不可用，服务号认证后可用
	function _send_by_openid($openids) {
		$openids = wp_explode ( $openids );
		if (empty ( $openids )) {
			$this->error ( '要发送的OpenID值不能为空' );
		}
		if (count ( $openids ) < 2) {
			$this->error ( 'OpenID至少需要2个或者2个以上' );
		}
		
		$url = 'https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=' . get_access_token ();
		
		$info = $this->_sucai_media_info ();
		
		$param ['touser'] = $openids;
		if ($info ['msgtype'] == 'text') {
			$param ['text'] ['content'] = $info ['media_id'];
		} else {
			$param ['mpnews'] ['media_id'] = $info ['media_id'];
		}
		$param ['msgtype'] = $info ['msgtype'];
		
		$param = JSON ( $param );
		$res = post_data ( $url, $param );
		if ($res ['errcode'] != 0) {
			$this->error ( error_msg ( $res ) );
		} else {
			return $res ['msg_id'];
		}
	}
	// 获取素材的media_id
	function _sucai_media_info() {
		$type = I ( 'msg_type' );
		$content = I ( 'content' );
		$appmsg_id = I('appmsg_id');
		// $image = I ( 'image' );
		
		if ($type == 'text') {
			if (empty ( $content ))
				$this->error ( '文本内容不能为空' );
			
			$res ['media_id'] = $content;
			$res ['msgtype'] = 'text';
			$_POST['content']=$content;
		} else if ($type == 'appmsg') {
			if (empty ( $appmsg_id ))
				$this->error ( '图文素材不能为空' );
			
			$res ['media_id'] = D ( 'Home/Material' )->getMediaIdByGroupId ( $appmsg_id );
			$_POST['media_id']=$res['media_id'];
			$res ['msgtype'] = 'mpnews';
		}
		
		return $res;
	}
}