<?php

namespace Common\Model;

use Think\Model;

/**
 * 公众号配置操作集成
 */
class PublicModel extends Model {
	protected $tableName = 'public';
	function getInfo($id, $filed = '', $update = false, $data = array()) {
		$key = 'Common_Public_getInfo_' . $id;
		$info = S ( $key );
		if ($info === false || $update) {
			$info = empty ( $data ) ? $this->find ( $id ) : $data;
			S ( $key, $info );
		}
		
		return empty ( $filed ) ? $info : $info [$filed];
	}
	function getInfoByToken($token, $filed = '', $update = false, $data = array()) {
		if ($token == - 1)
			return false;
		
		$key = 'Common_Public_getInfo_' . $token;
		$info = S ( $key );
		if ($info === false || $update) {
			$map ['token'] = $token;
			$info = empty ( $data ) ? $this->where ( $map )->find () : $data;
			// lastsql();
			S ( $key, $info );
		}
		
		return empty ( $filed ) ? $info : $info [$filed];
	}
	function clear($id, $type = '', $uid = '') {
		$info = $this->getInfo ( $id, '', true );
		$this->getInfoByToken ( $info ['token'], '', true, $info );
	}
}
?>
