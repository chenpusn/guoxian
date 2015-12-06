<?php

namespace Addons\Wecome\Model;

use Home\Model\WeixinModel;

/**
 * Vote模型
 */
class WeixinAddonModel extends WeixinModel {
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig ( 'Wecome' ); // 获取后台插件的配置参数
		
		if ($dataArr ['Content'] == 'subscribe') {
			$info = D ( 'Common/Follow' )->init_follow ( $dataArr ['FromUserName'] );
			
			// 增加积分
			session ( 'mid', $info ['id'] );
			add_credit ( 'subscribe' );
			
			// 其中token和openid这两个参数一定要传，否则程序不知道是哪个微信用户进入了系统
			$param ['token'] = get_token ();
			$param ['openid'] = get_openid ();
			
			$sreach = array (
					'[follow]',
					'[website]',
					'[token]',
					'[openid]' 
			);
			$replace = array (
					addons_url ( 'UserCenter://Wap/bind', $param ),
					addons_url ( 'WeiSite://WeiSite/index', $param ),
					$param ['token'],
					$param ['openid'] 
			);
			$config ['description'] = str_replace ( $sreach, $replace, $config ['description'] );
			
			switch ($config ['type']) {
				case '3' :
					$articles [0] = array (
							'Title' => $config ['title'],
							'Description' => $config ['description'],
							'PicUrl' => get_cover_url($config ['pic_url']),
							'Url' => str_replace ( $sreach, $replace, $config ['url'] ) 
					);
					$res = $this->replyNews ( $articles );
					break;
				case '2' :
					return false;
					break;
				default :
					$res = $this->replyText ( $config ['description'] );
			}
		} elseif ($dataArr ['Content'] == 'unsubscribe') {
			// 增加积分
			add_credit ( 'unsubscribe' );
		} elseif ($dataArr ['Content'] == 'scan') {
			$map ['scene_id'] = $dataArr ['EventKey'];
			$map ['token'] = get_token ();
			$qr = M ( 'qr_code' )->where ( $map )->find ();
			
			if ($qr ['addon'] == 'UserCenter') { // 设置用户分组
				$group = D ( 'Home/AuthGroup' )->move_group ( $GLOBALS ['mid'], $qr ['aim_id'] );
				
				$this->replyText ( '您已加入' . $group ['title'] );
			}
		} 
	}
}
