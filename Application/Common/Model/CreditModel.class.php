<?php

namespace Common\Model;

use Think\Model;

/**
 * 积分操作
 */
class CreditModel extends Model {
	protected $tableName = 'credit_data';
	// 增加积分
	function addCredit($data) {
		if (empty ( $data ) || empty ( $data ['credit_name'] ))
			return false;
		
		$credit = $this->getCreditByName ( $data ['credit_name'] );
		// if (! $credit)
		// return false;
		
		empty ( $data ['uid'] ) && $data ['uid'] = session ( 'follow_id' );
		empty ( $data ['cTime'] ) && $data ['cTime'] = time ();
		$data ['token'] = get_token ();
		
		isset ( $data ['experience'] ) || $data ['experience'] = $credit ['experience'];
		isset ( $data ['score'] ) || $data ['score'] = $credit ['score'];
		
		$res = $this->add ( $data );
		if ($res) {
			$info = get_followinfo ( $data ['uid'] );
			$save ['score'] = $info ['score'] + $data ['score'];
			$save ['experience'] = $info ['experience'] + $data ['experience'];
			
			D ( 'Common/Follow' )->update ( $data ['uid'], $save );
			
			// $this->updateFollowTotalCredit ( $data ['uid'] );
		}
		
		return $res;
	}
	// 通过积分标识获取积分配置值
	function getCreditByName($credit_name = null) {
		$token = get_token ();
		
		$key = 'Common_Credit_getCreditByName';
		$config = S ( $key );
		if ($config === false || ! $config [$token]) {
			$list = M ( 'credit_config' )->where ( 'token="0" or token="' . $token . '"' )->select ();
			
			$admin_config = $public_config = array ();
			foreach ( $list as $vo ) {
				if ($vo ['token'] == 0) {
					$admin_config [$vo ['name']] = $vo; // 后台的配置
				} else {
					$public_config [$vo ['name']] = $vo; // 公众号的配置
				}
			}
			$config [$token] = array_merge ( $admin_config, $public_config ); // 公众号的配置优化于后台的配置
			S ( $key, $config );
		}
		
		return empty ( $credit_name ) ? $config [$token] : $config [$token] [$credit_name];
	}
	// 更新个人总积分
	function updateFollowTotalCredit($uid) {
		$map ['uid'] = $map2 ['id'] = $uid;
		$map ['token'] = get_token ();
		$info = $this->where ( $map )->field ( 'sum(score) as score, sum(experience) as experience' )->find ();
		
		D ( 'Common/Follow' )->update ( $uid, $info );
	}
	function clear() {
		$key = 'Common_Credit_getCreditByName';
		S ( $key, NULL );
	}
}
?>
