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
 * 公众号管理
 */
class PublicController extends HomeController {
	protected $addon, $model;
	public function _initialize() {
		parent::_initialize ();
		
		$this->assign ( 'check_all', false );
		$this->assign ( 'search_url', U ( 'lists' ) );
		
		define ( 'ADDON_PUBLIC_PATH', '' );
		defined ( '_ADDONS' ) or define ( '_ADDONS', MODULE_NAME );
		defined ( '_CONTROLLER' ) or define ( '_CONTROLLER', CONTROLLER_NAME );
		defined ( '_ACTION' ) or define ( '_ACTION', ACTION_NAME );
		
		$this->model = M ( 'model' )->getByName ( 'public' );
		$this->assign ( 'model', $this->model );
		// dump ( $this->model );
		
		$res ['title'] = $this->model ['title'];
		$res ['url'] = U ( 'lists' );
		$res ['class'] = ACTION_NAME != 'help' ? 'current' : '';
		$nav [] = $res;
		
		// $res ['title'] = '管理员配置';
		// $res ['url'] = U ( 'Home/Admin/lists' );
		// $res ['class'] = '';
		// $nav [] = $res;
		
		if (ACTION_NAME == 'help') {
			$res ['title'] = '接口配置帮助';
			$res ['url'] = U ( 'help', array (
					'public_id' => $_GET ['public_id'] 
			) );
			$res ['class'] = 'current';
			$nav [] = $res;
		}
		
		$this->assign ( 'nav', $nav );
	}
	protected function _display() {
		$this->view->display ( 'Addons:' . ACTION_NAME );
	}
	function help() {
		if (empty ( $_GET ['public_id'] )) {
			$this->error ( '公众号参数非法' );
		}
		$this->display ( 'Index/help' );
	}
	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		// echo is_administrator ( $this->mid )."<br>";
		// echo $this->mid;die;
		// if (! is_administrator ( $this->mid )) {
		// 	redirect ( addons_url ( 'UserCenter://UserCenter/lists' ) );
		// }
		// 获取模型信息
		$model = $this->model;



		$this->assign('add_url',U('step_0'));
		
		$page = I ( 'p', 1, 'intval' );
		// 解析列表规则
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['list_grid'] ) );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复字段信息
		$fields = array_unique ( $fields );
		
		// 关键字搜索
		$list = M ( 'public_link' )->where ( "uid='{$this->mid}'" )->field ( 'mp_id,is_use' )->select ();
		foreach ( $list as $vo ) {
			$mp_ids [] = $vo ['mp_id'];
			$is_use [$vo ['mp_id']] = $vo ['is_use'];
		}
		$mp_ids = getSubByKey ( $list, 'mp_id' );
		
		$map ['id'] = 0;
		if (! empty ( $mp_ids )) {
			$map ['id'] = array (
					'in',
					$mp_ids 
			);
		}
		$key = $model ['search_key'] ? $model ['search_key'] : 'title';
		if (isset ( $_REQUEST [$key] )) {
			$map [$key] = array (
					'like',
					'%' . I ( $key ) . '%' 
			);
			unset ( $_REQUEST [$key] );
		}
		// 条件搜索
		foreach ( $_REQUEST as $name => $val ) {
			if (in_array ( $name, $fields )) {
				$map [$name] = $val;
			}
		}
		$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		// 读取模型数据列表
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		$name = parse_name ( get_table_name ( $model ['id'] ), true );
		$data = M ( $name )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		
		foreach ( $data as &$vo ) {
			$vo ['is_use'] = $is_use [$vo ['id']];
			if (! empty ( $vo ['headface_url'] ))
				$vo ['headface_url'] = '<img src="' . get_cover_url ( $vo ['headface_url'] ) . '" width="50" height="50" />';
		}
		
		foreach ( $grids as $k => &$g ) {
			if ($g ['field'] [0] == 'uid') {
				unset ( $grids [$k] );
			}
		}
		
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$_page = $page->show ();
			$this->assign ( '_page', $_page );
		}

		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$list_data ['list_data'] = $data;
		
		//$this->assign ( 'list_grids', $grids );
		$this->assign ( $list_data );
		
		$this->meta_title = $model ['title'] . '列表';
		
		// 使用提示
		$normal_tips = '您目前最多可自己创建' . getPublicMax ( $this->mid ) . '个公众号（不包括管理员分配的公众号）。如需要更多名额请需要管理员在后台设置';
		$this->assign ( 'normal_tips', $normal_tips );
		
		$this->display ('Publics/lists');
	}
	public function del($model = null, $ids = null) {
		$model = $this->model;
		
		if (empty ( $ids )) {
			$ids = I ( 'id' );
		}
		if (empty ( $ids )) {
			$ids = array_unique ( ( array ) I ( 'ids', 0 ) );
		}
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		
		$Model = M ( get_table_name ( $model ['id'] ) );
		$map ['id'] = array (
				'in',
				$ids 
		);
		if ($Model->where ( $map )->delete ()) {
			$map_link ['mp_id'] = array (
					'in',
					$ids 
			);
			M ( 'public_link' )->where ( $map_link )->delete ();
			
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	public function edit($model = null, $id = 0) {
		$id || $id = I ( 'id' );
		redirect ( U ( 'add', array (
				'id' => $id 
		) ) );
	}
	public function add($model = null) {
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$map ['uid'] = $this->mid;
			if (M ( 'manager' )->where ( $map )->find ()) {
				M ( 'manager' )->where ( $map )->save ( $_POST );
			} else {
				$_POST ['uid'] = $this->mid;
				M ( 'manager' )->add ( $_POST );
			}
			
			$data ['is_init'] = 1;
			$res = D ( 'Common/User' )->updateInfo ( $this->mid, $data );
			
			$is_open = C ( 'PUBLIC_BIND' );
			$next_url = empty ( $is_open ) ? U ( 'step_0' ) : addons_url ( 'PublicBind://PublicBind/auto_bind' );
			// $url = $_POST ['has_public'] ? $next_url : U ( 'Home/Index/index' );
			$url = $next_url;
			
			if ($res) {
				$this->success ( '保存基本信息成功！', $url );
			} elseif ($res === 0) {
				$this->success ( ' ', $url );
			} else {
				$this->error ( '保存失败' );
			}
		} else {
			$manager = ( array ) M ( 'manager' )->find ( $this->mid );
			$data = D ( 'Common/User' )->find ( $this->mid );
			
			$data = array_merge ( $data, $manager );
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/add' );
		}
	}
	function step_0() {
		//$map ['uid'] = $this->mid;
		//$data = D ( 'Common/Public' )->where ( $map )->find ();
		//var_dump($data);
		$id = I('id');
		$this->assign ( 'id', $id );
		
		$model = $this->model;
		//var_dump($model);
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			// 检查专属域名是否已被占用
			if (C ( 'DIV_DOMAIN' )) {
				$map2 ['domain'] = $domain = $_POST ['domain'];
				if (empty ( $domain )) {
					$this->error ( '专属域名不能为空' );
					exit ();
				}
				if (is_numeric ( $domain )) {
					$this->error ( '专属域名不能为纯数字' );
					exit ();
				}
				$plen = strlen ( $domain );
				// ! preg_match ( "/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i", $domain ) ||
				if ($plen < 3 || $plen > 10) {
					$this->error ( '专属域名必须为3-10位的字母和数字的组合' );
					exit ();
				}
				
				empty ( $id ) || $map2 ['id'] = array (
						'exp',
						'!=' . $id 
				);
				$arr = array (
						'www' => 1
				); 
				
				if (isset ( $arr [$domain] ) || D ( 'Common/Public' )->where ( $map2 )->getField ( 'id' )) {
					$this->error ( '该专属域名已经存在，请换别的再试' );
					exit ();
				}
			}
			
			$_POST ['token'] = $_POST ['public_id'];
			$_POST ['group_id'] = intval ( C ( 'DEFAULT_PUBLIC_GROUP_ID' ) );
			$_POST ['uid'] = $this->mid;
			$_POST ['has_public'] = 1;
			
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			session ( 'token', $_POST ['token'] );
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if (empty ( $id )) {
				if ($Model->create () && $id = $Model->add ()) {
					// 增加公众号与用户的关联关系
					$data ['uid'] = $this->mid;
					$data ['mp_id'] = $id;
					$data ['is_creator'] = 1;
					M ( 'public_link' )->add ( $data );
					
					$url = U ( 'lists' );
					$url = chang_domain ( $url, $_POST ['domain'] );
					
					$this->success ( '添加基本信息成功！', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			} else {
				$_POST ['id'] = $id;
				$url = U ( 'lists' );
				$url = chang_domain ( $url, $_POST ['domain'] );
				$Model->create () && $res = $Model->save ();
				if ($res) {
					$this->success ( '保存基本信息成功！', $url );
				} elseif ($res === 0) {
					$this->success ( ' ', $url );
				} else {
					$this->error ( $Model->getError () );
				}
			}
		} else {

			if (empty ( $id )) {
				$allow_add_count = getPublicMax ( $this->mid );
				$has_add_count = M ( 'public_link' )->where ( "uid='{$this->mid}'" )->getField ( 'sum(is_creator)' );
				if ($allow_add_count <= $has_add_count) {
					$this->error ( '您最多只能创建 ' . $allow_add_count . ' 个公众号！' );
					exit ();
				}
			} else {
				$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			}
			$data ['type'] = intval ( $data ['type'] );
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/step_0' );

		}
	}
	function step_1() {
		$id = I ( 'id' );
		$this->assign ( 'id', $id );
		
		$this->display ( 'Publics/step_1' );
	}
	function step_2() {
		$model = $this->model;
		$id = I ( 'get.id' );
		$this->assign ( 'id', $id );
		
		$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
		$is_audit = $data ['is_audit'];
		$this->assign ( 'is_audit', $is_audit );
		if (IS_POST) {
			// 更新缓存
			D ( 'Common/Public' )->clear ( $id );
			
			$_POST ['id'] = $id;
			
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			
			if ($Model->create () && false !== $Model->save ()) {
				D ( 'Common/Public' )->clear ( $data ['id'] );
				
				if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
					$this->success ( '提交成功！', U ( 'waitAudit', array (
							'id' => $id 
					) ) );
				} else {
					$this->success ( '保存成功！', U ( 'Home/Index/main' ) );
				}
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$data || $this->error ( '数据不存在！' );
			
			$this->assign ( 'info', $data );
			
			$this->display ( 'Publics/step_2' );
		}
	}
	protected function checkAttr($Model, $model_id) {
		$fields = get_model_attribute ( $model_id );
		$validate = $auto = array ();
		foreach ( $fields as $key => $attr ) {
			if ($attr ['is_must']) { // 必填字段
				$validate [] = array (
						$attr ['name'],
						'require',
						$attr ['title'] . '必须!' 
				);
			}
			// 自动验证规则
			if (! empty ( $attr ['validate_rule'] ) || $attr ['validate_type'] == 'unique') {
				$validate [] = array (
						$attr ['name'],
						$attr ['validate_rule'],
						$attr ['error_info'] ? $attr ['error_info'] : $attr ['title'] . '验证错误',
						0,
						$attr ['validate_type'],
						$attr ['validate_time'] 
				);
			}
			// 自动完成规则
			if (! empty ( $attr ['auto_rule'] )) {
				$auto [] = array (
						$attr ['name'],
						$attr ['auto_rule'],
						$attr ['auto_time'],
						$attr ['auto_type'] 
				);
			} elseif ('checkbox' == $attr ['type']) { // 多选型
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			} elseif ('datetime' == $attr ['type']) { // 日期型
				$auto [] = array (
						$attr ['name'],
						'strtotime',
						3,
						'function' 
				);
			}
		}
		return $Model->validate ( $validate )->auto ( $auto );
	}
	function changPublic() {
		$map ['id'] = I ( 'id', 0, 'intval' );
		$info = M ( 'public' )->where ( $map )->find ();
		
		unset ( $map );
		$map ['uid'] = session ( 'mid' );
		M ( 'public_link' )->where ( $map )->setField ( 'is_use', 0 );
		
		$map ['mp_id'] = $info ['id'];
		M ( 'public_link' )->where ( $map )->setField ( 'is_use', 1 );
		
		get_token ( $info ['public_id'] );
		
		redirect ( U ( 'lists' ) );
	}
	
	// 等待审核页面
	function waitAudit() {
		$data = D ( 'Common/User' )->find ( $this->mid );
		$is_audit = $data ['is_audit'];
		if ($is_audit == 0 && ! C ( 'REG_AUDIT' )) {
			$this->display ( 'Publics/waitAudit' );
		} else {
			redirect ( U ( 'home/index/index' ) );
		}
	}
}