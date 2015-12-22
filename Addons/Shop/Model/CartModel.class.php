<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class CartModel extends Model {
	protected $tableName = 'shop_cart';

	function getMyCart($uid, $update = false) {
		$key = 'Cart_getMyCart_' . $uid;
		$info = S ( $key );
		if ($info === false || $update) {
			$map ['uid'] = $uid;
			$info = $this->where ( $map )->select ();
			$goodsDao = D ( 'Addons://Shop/Goods' );
			$shopDao = D ( 'Addons://Shop/Shop' );
			foreach ( $info as &$v ) {
				// $res [$v ['goods_id']] = $v;
				$v ['goods'] = $goodsDao->getInfo ( $v ['goods_id'] );
				$v ['shop'] = $shopDao->getInfo ( $v ['shop_id'] );
				$v ['goods_name'] = $v ['goods'] ['title'];
				$v ['shop_name'] = $v ['shop'] ['title'];
			}
			S ( $key, $info );
		}
		
		return $info;
	}

	// 2015-12-22 CHEN PU： bug fix, 重复添加多个商品购物车未合并同类项
	function addToCart($goods) {
		$myList = $this->getMyCart ( $goods ['uid'] );
		$exits = false;
		foreach($myList as $list) {
			if($list['goods_id'] == $goods['goods_id']){
				$num = $list['num'] + $goods ['num'];
				$map ['id'] = $list['id'];
				$this->where ( $map )->setField ( 'num', $num );
				$exits = true;
				break;
			}
		}
		if(!$exits){
			$goods ['openid'] = get_openid ();
			$this->add ( $goods );
		}

		$this->getMyCart ( $goods ['uid'], true );
		return $this->getMyCartCount($goods ['uid']);
	}
	function delCart($ids) {
		$ids = array_filter ( explode ( ',', $ids ) );
		if (empty ( $ids ))
			return 0;
		
		$map ['id'] = array (
				'in',
				$ids 
		);
		return $this->where ( $map )->delete ();
	}
	function delUserCart($uid, $goods_ids) {
		$map ['goods_id'] = array (
				'in',
				$goods_ids 
		);
		$map ['uid'] = $uid;
		$res = $this->where ( $map )->delete ();
		
		$this->getMyCart ( $map ['uid'], true );
		return $res;
	}

	function getMyCartCount($uid){
		$map['uid'] = $uid;
		return $this->where($map)->sum('num');
	}
}
