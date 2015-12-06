<?php

namespace Common\Model;

use Think\Model;

/**
 * 粉丝操作
 */
class FollowModel extends Model {
	protected $tableName = 'user';
	function init_follow($openid, $token = '') {
		empty ( $token ) && $token = get_token ();
		
		if (empty ( $openid ) || $openid == - 1 || empty ( $token ) || $token == - 1)
			return false;
		
		$data ['token'] = $token;
		$data ['openid'] = $openid;
		$datas = $data;
		$uid = M ( 'public_follow' )->where ( $data )->getField ( 'uid' );
		
		if ($uid) {
			return $uid;
		}
		
		// 自动注册
		$config = getAddonConfig ( 'UserCenter' );
		
		$user = array (
				'experience' => intval ( $config ['experience'] ),
				'score' => intval ( $config ['score'] ),
				
				'reg_ip' => get_client_ip ( 1 ),
				'reg_time' => NOW_TIME,
				'last_login_ip' => get_client_ip ( 1 ),
				'last_login_time' => NOW_TIME,
				
				'status' => 1,
				'is_init' => 1,
				'is_audit' => 1,
				'come_from' => 1 
		);
		$data ['uid'] = $uid = D ( 'Common/User' )->add ( $user );
		
		M ( 'public_follow' )->add ( $data );
		
		return $uid;
	}
	
	/**
	 * 兼容旧的写法
	 */
	public function getFollowInfo($id, $update = false) {
		return D ( 'Common/User' )->getUserInfo ( $id, $update );
	}
	function update($id, $data) {
		return D ( 'Common/User' )->updateInfo ( $id, $data );
	}
	function updateByMap($map, $data) {
		return false; // 已停用该方法
	}
	function updateField($id, $field, $val) {
		return D ( 'Common/User' )->updateInfo ( $id, array (
				$field => $val 
		) );
	}
}
?>
