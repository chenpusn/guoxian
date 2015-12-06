<?php

namespace Addons\CustomMenu\Controller;

use Home\Controller\AddonsController;

class CustomMenuController extends AddonsController {
	var $model_name = 'custom_menu';
	public function lists($model = null, $page = 0) {
		$this->assign ( 'normal_tips', '为了方便移植,可以用以下特殊字符代替常用地址参数：<br>
				[website]: ' . SITE_URL . '<br>[publicid]: ' . get_token_appinfo ( '', 'id' ) . '<br>[token]: ' . get_token () . '<br>
				用法例如：微网站：[website]/?s=/addon/WeiSite/WeiSite/index/publicid/[publicid]' );
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );
		
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$fields = $list_data ['fields'];
		
		// 搜索条件
		$map = $this->_search_map ( $model, $fields );
		
		$list_data ['list_data'] = $this->get_data ( $map );
		$this->assign ( $list_data );
		
		$this->display ();
	}
	function get_data($map) {
		$map ['token'] = get_token ();
		$list = M ( 'custom_menu' )->where ( $map )->order ( 'pid asc, sort asc' )->select ();
		
		// 取一级菜单
		foreach ( $list as $k => $vo ) {
			if ($vo ['pid'] != 0)
				continue;
			
			$one_arr [$vo ['id']] = $vo;
			unset ( $list [$k] );
		}
		
		foreach ( $one_arr as $p ) {
			$data [] = $p;
			
			$two_arr = array ();
			foreach ( $list as $key => $l ) {
				if ($l ['pid'] != $p ['id'])
					continue;
				
				$l ['title'] = '├──' . $l ['title'];
				$two_arr [] = $l;
				unset ( $list [$key] );
			}
			
			$data = array_merge ( $data, $two_arr );
		}
		
		return $data;
	}
	function _deal_data($d) {
		$res ['name'] = str_replace ( '├──', '', $d ['title'] );
		
		if ($d ['type'] == 'view') {
			$search = array (
					'[website]',
					'[publicid]',
					'[token]' 
			);
			$replace = array (
					SITE_URL,
					get_token_appinfo ( $map ['token'], 'id' ),
					$map ['token'] 
			);
			
			$res ['type'] = 'view';
			$res ['url'] = str_replace ( $search, $replace, trim ( $d ['url'] ) );
		} elseif ($d ['type'] != 'none') {
			$res ['type'] = trim ( $d ['type'] );
			$res ['key'] = trim ( $d ['keyword'] );
		}
		
		return $res;
	}
	function json_encode_cn($data) {
		$data = json_encode ( $data );
		return preg_replace ( "/\\\u([0-9a-f]{4})/ie", "iconv('UCS-2BE', 'UTF-8', pack('H*', '$1'));", $data );
	}
	// 发送菜单到微信
	function send_menu() {
		$data = $this->get_data ();
		foreach ( $data as $k => $d ) {
			if ($d ['pid'] != 0)
				continue;
			$tree ['button'] [$d ['id']] = $this->_deal_data ( $d );
			unset ( $data [$k] );
		}
		foreach ( $data as $k => $d ) {
			$tree ['button'] [$d ['pid']] ['sub_button'] [] = $this->_deal_data ( $d );
			unset ( $data [$k] );
		}
		$tree2 = array ();
		$tree2 ['button'] = array ();
		
		foreach ( $tree ['button'] as $k => $d ) {
			$tree2 ['button'] [] = $d;
		}

		$tree = $this->json_encode_cn ( $tree2 );
		$access_token = get_access_token ();
		
		file_get_contents ( 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=' . $access_token );
		
		$url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token=' . $access_token;
		$header [] = "content-type: application/x-www-form-urlencoded; charset=UTF-8";
		
		$ch = curl_init ();
		curl_setopt ( $ch, CURLOPT_URL, $url );
		curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, FALSE );
		curl_setopt ( $ch, CURLOPT_HTTPHEADER, $header );
		curl_setopt ( $ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)' );
		curl_setopt ( $ch, CURLOPT_FOLLOWLOCATION, 1 );
		curl_setopt ( $ch, CURLOPT_AUTOREFERER, 1 );
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $tree );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
		$res = curl_exec ( $ch );
		curl_close ( $ch );
		$res = json_decode ( $res, true );
		if ($res ['errcode'] == 0) {
			$this->success ( '发送菜单成功' );
		} else {
			$this->error ( error_msg ( $res ) );
		}
	}
	public function edit($model = null, $id = 0) {
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$id || $id = I ( 'id' );
		
		if (IS_POST) {
			$_POST = $this->_deal_post ( $_POST );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			// 获取一级菜单
			$map ['token'] = get_token ();
			$map ['pid'] = 0;
			$map ['id'] = array (
					'not in',
					$id 
			);
			$list = $Model->where ( $map )->select ();
			foreach ( $list as $v ) {
				$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
			}
			
			$fields = get_model_attribute ( $model ['id'] );
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'pid') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			
			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}
			
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $model ['title'];
			
			$this->display ();
		}
	}
	public function add($model = null) {
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		
		if (IS_POST) {
			$_POST = $this->_deal_post ( $_POST );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			// 要先填写appid
			$map ['token'] = get_token ();
			$info = get_token_appinfo ( $map ['token'] );
			
			if (empty ( $info ['appid'] ) || empty ( $info ['secret'] )) {
				$this->error ( '请先配置appid和secret', U ( 'home/Public/edit', 'id=' . $info ['id'] ) );
			}
			// 获取一级菜单
			$map ['pid'] = 0;
			$list = $Model->where ( $map )->select ();
			foreach ( $list as $v ) {
				$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
			}
			
			$fields = get_model_attribute ( $model ['id'] );
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'pid') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];
			
			$this->display ();
		}
	}
	function _deal_post($data) {
		// click:点击推事件 |keyword@show,url@hide
		// scancode_push:扫码推事件 |keyword@show,url@hide
		// scancode_waitmsg:扫码带提示 |keyword@show,url@hide
		// pic_sysphoto:弹出系统拍照发图 |keyword@show,url@hide
		// pic_photo_or_album:弹出拍照或者相册发图|keyword@show,url@hide
		// pic_weixin:弹出微信相册发图器 |keyword@show,url@hide
		// location_select:弹出地理位置选择器|keyword@show,url@hide
		
		// view:跳转URL|keyword@hide,url@show
		
		// none:无事件的一级菜单|keyword@hide,url@hide
		if ($data ['type'] == 'none') {
			$data ['keyword'] = '';
			$data ['url'] = '';
		} elseif ($data ['type'] == 'view') {
			$data ['keyword'] = '';
		} else {
			$data ['url'] = '';
		}
		return $data;
	}
	public function del() {
		$model = $this->getModel ( $this->model_name );
		parent::common_del ( $model );
	}
	function get_menu() {
		$url = 'https://api.weixin.qq.com/cgi-bin/menu/get?access_token=' . get_access_token ();
		$content = file_get_contents ( $url );
	}
}
