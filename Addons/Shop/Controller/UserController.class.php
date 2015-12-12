<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class MobileController extends AddonsController
{
    var $userInfo;
    function _checkUserBindInfo(){
        // 本地未绑定用户信息 如果是需要用户信息的操作 则转至用户新绑定页面
        if(!cookie("HZXUSER".C('SITE_VERSION'))){
            $actionsNeedLogin = array('basket');
            if (in_array(_ACTION, $actionsNeedLogin)){
                $this->redirect("bind_user");
            }
        }
        // 获取用户信息
        else{
            $userInfoJson = cookie("HZXUSER".C('SITE_VERSION'));
            $userInfo = json_decode ($userInfoJson);
        }
    }

    function _initialize()
    {
        parent::_initialize();

        _checkUserBindInfo();
    }


    // CHEN PU: 2015/12/12 移动端 首页
    // 显示商品列表
    function index(){

    }

    // CHEN PU: 2015/12/12 绑定用户信息
    function bind_user(){


    }
}

?>