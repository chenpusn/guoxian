<?php

namespace Home\Controller;

/**
 * 素材管理控制器
 */
class MaterialController extends HomeController {
	public function lists() {
		$this->display ( 'Addons/lists' );
	}
	public function doAdd() {
		$textArr = array (
				1 => '一',
				2 => '二',
				3 => '三',
				4 => '四',
				5 => '五',
				6 => '六',
				7 => '七',
				8 => '八',
				9 => '九',
				10 => '十' 
		);
		$data = json_decode ( $_POST ['dataStr'], true );
		// dump ( $_POST );
		// dump ( $data );
		// exit ();
		$ids = array ();
		foreach ( $data as $key => $vo ) {
			$save = array ();
			foreach ( $vo as $k => $v ) {
				$save [$v ['name']] = safe ( $v ['value'] );
			}
			if (empty ( $save ['title'] )) {
				$this->error ( '请填写第' . $textArr [$key + 1] . '篇文章的标题' );
			}
			if (empty ( $save ['cover_id'] )) {
				$this->error ( '请上传第' . $textArr [$key + 1] . '篇文章的封面图片' );
			}
			if (empty ( $save ['content'] )) {
				$this->error ( '请填写第' . $textArr [$key + 1] . '篇文章的正文内容' );
			}
			if (! empty ( $save ['id'] )) { // 更新数据
				$map2 ['id'] = $save ['id'];
				M ( 'material_news' )->where ( $map2 )->save ( $save );
			} else { // 新增加
				$save ['cTime'] = NOW_TIME;
				$save ['manager_id'] = $this->mid;
				$save ['token'] = get_token ();
				$id = M ( 'material_news' )->add ( $save );
				if ($id) {
					$ids [] = $id;
				} else {
					if (! empty ( $ids )) {
						$map ['id'] = array (
								'in',
								$ids 
						);
						M ( 'material_news' )->where ( $map )->delete ();
					}
					$this->error ( '增加第' . $textArr [$key + 1] . '篇文章失败，请检查数据后重试' );
				}
			}
		}
		if (! empty ( $ids )) {
			$map ['id'] = array (
					'in',
					$ids 
			);
			$group_id = I ( 'get.group_id', 0, 'intval' );
			empty ( $group_id ) && $group_id = $ids [0];
			M ( 'material_news' )->where ( $map )->setField ( 'group_id', $group_id );
		}
		
		$this->success ( '操作成功', U ( 'material_lists' ) );
	}
	function material_lists() {
		// $url = 'https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=' . get_access_token ();
		// $param ['media_id'] = 'M5N3qr_6sbC977JdLweB28xNoTLSQbweFeySKkCWUhk';
		// $data = post_data ( $url, $param, false, false );
		// dump ( $data );

		$res ['title'] = '图文素材';
		$res ['url'] = U ( 'Home/Material/material_lists' );
		$res ['class'] = 'current';
		$nav [] = $res;

		$res ['title'] = '图片素材';
		$res ['url'] = U ( 'Home/Material/picture_lists' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );

		$map ['manager_id'] = $this->mid;
		$map ['token'] = get_token ();
		$title = I ( 'title' );
		if (! empty ( $title )) {
			$map ['title'] = array (
					'like',
					"%$title%" 
			);
		}
		
		$field = 'id,title,cover_id,intro,group_id';
		$list = M ( 'material_news' )->where ( $map )->field ( $field . ',count(id) as count' )->group ( 'group_id' )->order ( 'group_id desc' )->selectPage ();
		
		foreach ( $list ['list_data'] as &$vo ) {
			if ($vo ['count'] == 1)
				continue;
			
			$map2 ['group_id'] = $vo ['group_id'];
			$map2 ['id'] = array (
					'exp',
					'!=' . $vo ['id'] 
			);
			
			$vo ['child'] = M ( 'material_news' )->field ( $field )->where ( $map2 )->select ();
		}
		$this->assign ( $list );
		$this->assign ( 'add_url', U ( 'add_material' ) );
		$this->display ();
	}
	function add_material() {
		$map ['group_id'] = I ( 'group_id', 0, 'intval' );
		if (! empty ( $map ['group_id'] )) {
			$list = M ( 'material_news' )->where ( $map )->order ( 'id asc' )->select ();
			$count = count ( $list );
			
			$main = $list [0];
			unset ( $list [0] );
			if (! empty ( $list )) {
				$others = $list;
			}
			
			$this->assign ( 'main', $main );
			$this->assign ( 'others', $others );
		}
		
		$this->assign ( 'post_url', U ( 'doAdd', $map ) );
		$this->display ();
	}
	function del_material_by_id() {
		$map ['id'] = I ( 'id' );
		echo M ( 'material_news' )->where ( $map )->delete ();
	}
	function del_material_by_groupid() {
		$map ['group_id'] = I ( 'group_id' );
		$res = M ( 'material_news' )->where ( $map )->delete ();
		if ($res) {
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败' );
		}
	}
	function picture_lists() {

		$res ['title'] = '图文素材';
		$res ['url'] = U ( 'Home/Material/material_lists' );
		$res ['class'] = '';
		$nav [] = $res;

		$res ['title'] = '图片素材';
		$res ['url'] = U ( 'Home/Material/picture_lists' );
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
		
		$this->assign ( 'normal_tips', '温馨提示：图片大小不超过5M,    格式: bmp, png, jpeg, jpg, gif' );
		
		$map ['manager_id'] = $this->mid;
		$map ['token'] = get_token ();
		$list = M ( 'material_image' )->where ( $map )->field ( 'id,cover_url' )->order ( 'id desc' )->selectPage ( 39 );
		$this->assign ( $list );
		$this->display ();
	}
	function add_picture() {
		$save ['cover_id'] = I ( 'cover_id' );
		$save ['cover_url'] = I ( 'src' );
		if (empty ( $save ['cover_id'] ) || empty ( $save ['cover_url'] )) {
			$this->error ( '图片参数出错' );
		}
		
		$save ['cTime'] = NOW_TIME;
		$save ['manager_id'] = $this->mid;
		$save ['token'] = get_token ();
		M ( 'material_image' )->add ( $save );
		$this->success ( '增加成功' );
	}
	function del_picture() {
		$map ['id'] = I ( 'id' );
		echo M ( 'material_image' )->where ( $map )->delete ();
	}
	function material_data() {
		$map ['manager_id'] = $this->mid;
		$map ['token'] = get_token ();
		
		$field = 'id,title,cover_id,intro,group_id';
		$list = M ( 'material_news' )->where ( $map )->field ( $field . ',count(id) as count' )->group ( 'group_id' )->order ( 'group_id desc' )->selectPage ();
		
		foreach ( $list ['list_data'] as &$vo ) {
			if ($vo ['count'] == 1)
				continue;
			
			$map2 ['group_id'] = $vo ['group_id'];
			$map2 ['id'] = array (
					'exp',
					'!=' . $vo ['id'] 
			);
			
			$vo ['child'] = M ( 'material_news' )->field ( $field )->where ( $map2 )->select ();
		}
		// dump ( $list );
		$this->assign ( $list );
		// 弹框数据
		$this->display ();
	}
	// 与微信同步
	function syc_news_to_wechat() {
		// 上传本地素材
		$map ['media_id'] = '0';
		$map ['manager_id'] = $this->mid;
		$map ['token'] = get_token ();
		
		$field = 'id,title,cover_id,intro,author,content,group_id,thumb_media_id';
		$list = M ( 'material_news' )->limit ( 10 )->where ( $map )->field ( $field . ',count(id) as count' )->group ( 'group_id' )->order ( 'group_id desc' )->select ();
// 		dump($list);
		if (empty ( $list )) {
			$this->success ( '上传素材完成', U ( 'material_lists' ) );
			exit ();
		}
		
		foreach ( $list as $vo ) {
			$ids [] = $vo ['id'];
			$gids [] = $vo ['group_id'];
		}
		$map2 ['id'] = array (
				'not in',
				$ids 
		);
		$map2 ['group_id'] = array (
				'in',
				$gids 
		);
		$child = M ( 'material_news' )->where ( $map2 )->field ( $field )->select ();
		empty ( $child ) || $list = array_merge ( $list, $child );
		foreach ( $list as $vo ) {
			$data ['title'] = $vo ['title'];
			$data ['thumb_media_id'] = empty ( $vo ['thumb_media_id'] ) ? $this->_thumb_media_id ( $vo ['cover_id'] ) : $vo ['thumb_media_id'];
			$data ['author'] = $vo ['author'];
			$data ['digest'] = $vo ['intro'];
			$data ['show_cover_pic'] = 1;
			$data ['content'] = str_replace('"', '\'', $vo ['content']);
			$data ['content_source_url'] = U ( 'news_detail', array (
					'id' => $vo ['id'] 
			) );
			
			$articles [$vo ['group_id']] [] = $data;
		}
// 		dump($articles);
		
		$url = 'https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=' . get_access_token ();
// 		dump($url);
		foreach ( $articles as $group_id => $art ) {
			$param ['articles'] = $art;
// 			dump($param);
// 			dump(JSON($param));
			$res = post_data ( $url, $param );
			if ($res ['errcode'] != 0) {
				$this->error ( error_msg ( $res ) );
			} else {
				$map3 ['group_id'] = $group_id;
				M ( 'material_news' )->where ( $map3 )->setField ( 'media_id', $res ['media_id'] );
			}
		}
// 		die;
		$url = U ( 'syc_news_to_wechat' );
		$this->success ( '上传本地素材到微信中，请勿关闭', $url );
	}
	function syc_news_from_wechat() {
		$url = 'https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=' . get_access_token ();
		$param ['type'] = 'news';
		$param ['offset'] = I ( 'offset', 0, 'intval' );
		$param ['count'] = 20;
		$list = post_data ( $url, $param );
		
		if (isset ( $list ['errcode'] ) && $list ['errcode'] != 0) {
		    $this->error ( error_msg ( $list) );
		}
		if (empty ( $list ['item'] )) {
			$this->success ( '下载素材完成', U ( 'material_lists' ) );
			exit ();
		}
		$map ['media_id'] = array (
				'in',
				getSubByKey ( $list ['item'], 'media_id' ) 
		);
		$has = M ( 'material_news' )->where ( $map )->getField ( 'DISTINCT media_id,id' );
		foreach ( $list ['item'] as $item ) {
			$media_id = $item ['media_id'];
			if (isset ( $has [$media_id] ))
				continue;
			
			$ids = array ();
			foreach ( $item ['content'] ['news_item'] as $vo ) {
				$data ['title'] = $vo ['title'];
				$data ['author'] = $vo ['author'];
				$data ['intro'] = $vo ['digest'];
				$data ['content'] = $vo ['content'];
				$data ['thumb_media_id'] = $vo ['thumb_media_id'];
				$data ['media_id'] = $media_id;
				$data ['cover_id'] = $this->_download_imgage ( $data ['thumb_media_id'] );
				
				$data ['cTime'] = NOW_TIME;
				$data ['manager_id'] = $this->mid;
				$data ['token'] = get_token ();
				$ids [] = M ( 'material_news' )->add ( $data );
			}
			
			if (! empty ( $ids )) {
				$map2 ['id'] = array (
						'in',
						$ids 
				);
				M ( 'material_news' )->where ( $map2 )->setField ( 'group_id', $ids [0] );
			}
		}
		$url = U ( 'syc_news_from_wechat', array (
				'offset' => $param ['offset'] + $list ['item_count'] 
		) );
		$this->success ( '下载微信素材中，请勿关闭', $url );
	}
	function _thumb_media_id($cover_id) {
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
			$this->error ( '获取文章封面失败，请确认是否增加封面' );
		}
		
		$param ['type'] = 'thumb';
		$param ['media'] = '@' . realpath ( SITE_PATH . $path );
		$url = 'https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=' . get_access_token ();
		$res = post_data ( $url, $param, true );
		
		if (isset ( $res ['errcode'] ) && $res ['errcode'] != 0) {
			$this->error ( error_msg ( $res, '封面图上传' ) );
		}
		
		$map ['cover_id'] = $cover_id;
		$map ['manager_id'] = $this->mid;
		M ( 'material_news' )->where ( $map )->setField ( 'thumb_media_id', $res ['media_id'] );
		
		return $res ['media_id'];
	}
	function _image_media_id($cover_id) {
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
// 		if (! $path) {
// 			$this->error ( '获取图片素材失败' );
// 			exit();
// 		}
		
		$param ['type'] = 'image';
		$param ['media'] = '@' . realpath ( SITE_PATH . $path );
		$url = 'https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=' . get_access_token ();
		$res = post_data ( $url, $param, true );
		if (isset ( $res ['errcode'] ) && $res ['errcode'] != 0) {
			$this->error ( error_msg ( $res, '图片上传' ) );
			exit();
		}
		return $res ['media_id'];
	}
	// 上传图片素材
	function syc_image_to_wechat() {
	    // 上传本地素材
	    $map ['media_id'] = '0';
	    $map ['manager_id'] = $this->mid;
	    $map ['token'] = get_token ();
	    $list = M ( 'material_image' )->limit ( 10 )->where ( $map )->field ( 'id,cover_id' )->order ( 'cTime desc' )->select ();
	    if (empty ( $list )) {
	        $this->success ( '上传素材完成', U ( 'picture_lists' ) );
	        exit();
	    }
	    foreach ( $list as $vo ) {

	        $mediaId=$this->_image_media_id($vo['cover_id']);
	        if ($mediaId){
	            $save['media_id']=$mediaId;
	            M('material_image')->where(array('id'=>$vo['id']))->save($save);
	        }
	    }
	    $url = U ( 'syc_image_to_wechat' );
	    $this->success ( '上传本地素材到微信中，请勿关闭', $url );
	}
	//下载图片
	function syc_image_from_wechat() {
	    $url = 'https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=' . get_access_token ();
	    $param ['type'] = 'image';
	    $param ['offset'] = I ( 'offset', 0, 'intval' );
	    $param ['count'] = 20;
	    $list = post_data ( $url, $param );
// 	    dump ( $list );
// 	    die;
	    if (isset ( $list ['errcode'] ) && $list ['errcode'] != 0) {
	        $this->error ( error_msg ( $list) );
	    }
	    if (empty ( $list ['item'] )) {
	        $this->success ( '下载素材完成', U ( 'picture_lists' ) );
	        exit ();
	    }
	
	    $map ['media_id'] = array (
	        'in',
	        getSubByKey ( $list ['item'], 'media_id' )
	    );
	    $has = M ( 'material_image' )->where ( $map )->getField ( 'DISTINCT media_id,id' );
// 	    dump($map);
// 	    dump($has);
	  
	    foreach ( $list ['item'] as $item ) {
	        $media_id = $item ['media_id'];
	        if (isset ( $has [$media_id] ))
	            continue;
	        if ($item['url']){
	            $ids = array ();
	            $data ['cover_id'] = $this->_download_imgage($media_id,$item['url']);
	            $data['cover_url']=get_cover_url($data['cover_id']);
	            $data['wechat_url']=$item['url'];
	            $data['media_id']=$media_id;
	            $data['cTime']=NOW_TIME;
	            $data['manager_id']=$this->mid;
	            $data['token']=get_token();
	            $ids[]=M('material_image')->add($data);
	        }
	    }	
	    $url = U ( 'syc_image_from_wechat', array (
	        'offset' => $param ['offset'] + $list ['item_count']
	    ) );
	    $this->success ( '下载微信素材中，请勿关闭', $url );
	}
	function _download_imgage($media_id,$picUrl='') {
	    $savePath=SITE_PATH.'/Uploads/Picture/'.time_format(NOW_TIME,'Y-m-d');
	    mkdirs ($savePath );
	    if (empty($picUrl)){
	        //获取图片URL
	       $url='https://api.weixin.qq.com/cgi-bin/material/get_material?access_token='.get_access_token();
	       $param['media_id']=$media_id;
	       $picContent = post_data ( $url, $param ,false,false);
	       $picjson=json_decode($picContent,true);
	       if (isset ( $picjson ['errcode'] ) && $picjson ['errcode'] != 0) {
			 $this->error ( error_msg ( $picjson, '下载图片' ) );
			 exit();
		   }
// 		   dump($picContent);
// 		   dump($picjson);
//             if ($picContent){
                $picName=NOW_TIME.'.jpg';
                $picPath=$savePath.'/'.$picName;
                $res = file_put_contents ( $picPath, $picContent );
//             }
	    }else{
	        $content = wp_file_get_contents ($picUrl );
	        //获取图片扩展名
	        $picExt=substr($picUrl, strrpos($picUrl, '=')+1);
	        // 	    $picExt=='jpeg'
	        if (empty($picExt)||$picExt=='jpeg'){
	            $picExt='jpg';
	        }
	        $picName=NOW_TIME.'.'.$picExt;
	        $picPath= $savePath.'/'.$picName;
	        $res = file_put_contents ($picPath, $content );
	        if (!$res) {
	            $this->error ( '远程图片下载失败' );
	            exit();
	        }
	    }
	    $cover_id=0;
	    if ($res){
	        //保存记录，添加到picture表里，获取coverid
	        $url=U('File/uploadPicture',array('session_id'=>session_id()));
	        $_FILES['download']=array(
	            'name'=>$picName,
	            'type'=>'application/octet-stream',
	            'tmp_name'=>$picPath,
	            'size'=>$res,
	            'error'=>0
	        );
	        $Picture = D('Picture');
	        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
	        $info = $Picture->upload(
	            $_FILES,
	            C('PICTURE_UPLOAD'),
	            C('PICTURE_UPLOAD_DRIVER'),
	            C("UPLOAD_{$pic_driver}_CONFIG")
	        );
	        $cover_id=$info['download']['id'];
	        unlink($picPath);
	    }
	    return $cover_id;
	}
	function news_detail() {
		$map ['id'] = I ( 'id' );
		$info = M ( 'material_news' )->where ( $map )->find ();
		$this->assign ( 'info', $info );
		
		$this->display ();
	}
}