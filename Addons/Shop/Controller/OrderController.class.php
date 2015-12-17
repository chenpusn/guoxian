<?php

namespace Addons\Shop\Controller;

use Think\Exception;

class OrderController extends BaseController {
	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'shop_order' );
		parent::_initialize ();
	}
	// 通用插件的列表模型
	public function lists() {
		try{
			/*D ( 'Addons://Shop/Order' )->autoSetFinish ();*/
			$orderDao = D ( 'Addons://Shop/Order' );
			if(IS_POST){
				/*$searchDate = empty(I('search_date'))? date('Y-n-d'): I('search_date');
				$searchKeyword = empty(I('search_keyword'))?'':'&search_keyword='.I('search_keyword');


				redirect('index.php/addon/Shop/Order/lists.html?'.'search_date='.$searchDate.$searchKeyword);*/
			}
			else{
				//$searchDate = empty(I('search_date'))? date('Y-n-d'): I('search_date');
				$searchKeyword = I('search_keyword');
				/*$user_ids_arrary = '';
				if(!empty($searchKeyword)){
					$fileter['true_name'] = array('like', '%' . htmlspecialchars ( $searchKeyword ) . '%');
					$fileter['mobile'] = array('like', '%' . htmlspecialchars ( $searchKeyword ) . '%');
					$fileter['_logic'] = 'OR';
					$user_ids_arrary = D ( 'Common/shop_address' )->where ( $fileter )->getFields ( 'id' );
					$this->assign('search_keyword', $searchKeyword);
				}
				if(!empty($user_ids_arrary)){
					$filter_order['uid'] = array('IN', $user_ids_arrary);
				}

				if(!empty($searchDate)){
					$search_date_timestamp = strtotime($searchDate);
					$search_date_add_day_timestamp = strtotime('+1 day', $search_date_timestamp);
					$filter_order['cTime'] = array('between', array($search_date_timestamp, $search_date_add_day_timestamp));
					$this->assign('search_date', $searchDate);
				}

				if(!empty($searchKeyword) && empty($user_ids_arrary)){					// 按关键字查询无结果

				}else{
					$order_lists = $orderDao->where($filter_order)->select();
				}*/
			}

			/*foreach ( $order_lists as &$vo ) {
				$param ['id'] = $vo ['id'];

				$order = $orderDao->getInfo ( $vo ['id'] );
				// dump($order);
				$vo = array_merge ( $vo, $order );
				$follow = get_followinfo ( $vo ['uid'] );
				$param2 ['uid'] = $follow ['uid'];

				//$vo ['cate_id'] = intval ( $vo ['cate_id'] );
				//$vo ['cate_id'] = $cate [$vo ['cate_id']];

				$goods = json_decode ( $order ['goods_datas'], true );
				foreach ( $goods as $vv ) {
					//$vo ['goods'] .= '<img width="50" style="vertical-align:middle;margin:0 10px 0 0" src="' . get_cover_url ( $vv ['cover'] ) . '"/>' . $vv ['title'] . '<br><br>';
					$vo ['goods'] .= $vv ['title']. '数量:' .$vv ['num']. '<br/>';
				}
				$vo ['goods'] = rtrim ( $vo ['goods'], '<br><br>' );

				$vo ['order_number'] = '<a href="' . addons_url ( 'Shop://Order/detail', $param ) . '">' . $vo ['order_number'] . '</a>';

				$vo ['action'] = '<a href="' . addons_url ( 'Shop://Order/detail', $param ) . '">详情</a>';
				if ($vo ['status_code'] == 1) {
					$vo ['action'] .= '<br><br><a href="' . addons_url ( 'Shop://Order/set_confirm', $param ) . '">商家确认</a>';
				}
				$addressInfo = D ( 'Addons://Shop/Address' )->getInfo ( $order['uid'] );
				//$vo ['uid'] = '<a target="_blank" href="' . addons_url ( 'UserCenter://UserCenter/detail', $param2 ) . '">' . $follow ['nickname'] . '</a>';
				$vo ['uid'] =  $addressInfo['truename'].'<br/>'.$addressInfo['mobile'];
			}*/
			// dump($list_data ['list_data'] );

			$title_list = array('订单编号','下单商品','下单人','总价','下单时间','支付类型','订单跟踪');

			$this->assign ( 'title_lists',$title_list );
/*			$this->assign ( 'order_lists',$order_lists );*/

			//$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
			$this->display ();
		}
		catch(Exception $e)
		{
			echo $e->getMessage();
		}
	}

	// 通用插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
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
	
	// 通用插件的增加模型
	public function add() {
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		
		if (IS_POST) {
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'custom_reply_news' );
				
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}
			
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];
			
			$this->display ();
		}
	}
	
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
	
	// 获取所属分类
	function getCateData() {
		$map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$list = M ( 'weisite_category' )->where ( $map )->select ();
		$extra = '';
		foreach ( $list as $v ) {
			$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
		}
		return $extra;
	}
	function set_show() {
		$save ['is_show'] = 1 - I ( 'is_show' );
		$map ['id'] = I ( 'id' );
		$res = M ( 'shop_goods' )->where ( $map )->save ( $save );
		$this->success ( '操作成功' );
	}
	function detail() {
		$id = I ( 'id' );
		$orderDao = D ( 'Addons://Shop/Order' );
		$orderInfo = $orderDao->getInfo ( $id );
		$address_id = $orderInfo ['address_id'];
		$addressInfo = D ( 'Addons://Shop/Address' )->getInfo ( $address_id );
		
		$orderInfo ['goods'] = json_decode ( $orderInfo ['goods_datas'], true );
		// dump ( $orderInfo );
		$this->assign ( 'info', $orderInfo );
		$this->assign ( 'addressInfo', $addressInfo );
		$this->display ();
	}
	function do_send() {
		$map ['id'] = I ( 'order_id' );
		
		$save ['send_code'] = I ( 'send_code' );
		if (empty ( $save ['send_code'] )) {
			$this->error ( '请选择物流公司' );
		}
		
		$save ['send_number'] = I ( 'send_number' );
		if (empty ( $save ['send_number'] )) {
			$this->error ( '请填写快递号' );
		}
		
		$save ['is_send'] = 2;
		
		$orderDao = D ( 'Addons://Shop/Order' );
		$res = $orderDao->where ( $map )->save ( $save );
		if ($res) {
			$orderDao->setStatusCode ( $map ['id'], 3 );
			
			$this->success ( '发货成功' );
		} else {
			$this->success ( '发货失败' );
		}
	}
	function get_send_info() {
		$id = I ( 'id' );
		$res = D ( 'Addons://Shop/Order' )->getSendInfo ( $id );
		
		$html = '';
		if ($res ['resultcode'] != 200) {
			$html = '<p>' . $res ['reason'] . '</p>';
		} else {
			foreach ( $res ['result'] ['list'] as $vo ) {
				$html .= '<p>' . $vo ['datetime'] . ' ' . $vo ['zone'] . ' ' . $vo ['remark'] . '</p>';
			}
		}
		echo $html;
	}


	function set_pay_status() {
		$id = I ( 'id' );
		$save ['pay_status'] = 1;
		$res = D ( 'Addons://Shop/Order' )->update ( $id, $save );
		D ( 'Addons://Shop/Order' )->setStatusCode ( $id, 5 );
		
		echo 1;
	}

	//https://support.qfpay.com/qiantai/H5/H5.html
	function qianfang_payfeedback(){
		$orderNumber = I ( 'out_sn' );
		// Qian Fang: 1 未支付 2 完成(已支付) 3 关闭
		switch(I( 'status' )){
			case 1:
				$save ['pay_status'] = 3;
				break;
			case 2:
				$save ['pay_status'] = 1;
				break;
			case 3:
				$save ['pay_status'] = 2;
				break;
		}

		$orderInfo = D ( 'Addons://Shop/Order' )->getInfoByOrderNumber($orderNumber);

		$res = D ( 'Addons://Shop/Order' )->update ( $orderInfo[0]["id"], $save );
		D ( 'Addons://Shop/Order' )->setStatusCode ( $orderInfo[0]["id"], 5 );

		echo '付款成功, 请到XXX取货';
	}


	function set_confirm() {
		$id = I ( 'id' );
		$res = D ( 'Addons://Shop/Order' )->setStatusCode ( $id, 2 );
		if ($res) {
			$this->success ( '设置成功' );
		} else {
			$this->success ( '设置失败' );
		}
	}
}