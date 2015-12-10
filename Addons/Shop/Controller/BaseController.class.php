<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController
{
    var $shop_id;

    function _initialize()
    {
        parent::_initialize();
        // 获取当前登录的用户的商城
        $map ['token'] = 'gh_386b39d0fa1a';//get_token();
        //$map ['manamger_id'] = $this->mid;
        trace($this->mid,"BaseController::mid","user");
        $this->shop_id = 0;

        $currentShopInfo = M('shop')->where($map)->find();
        if ($currentShopInfo) {
            $this->shop_id = $currentShopInfo ['id'];
        } elseif (_ACTION != 'summary' && _ACTION != 'add') {
            redirect(addons_url('Shop://Shop/summary'));
        }

//        $controller = strtolower(_CONTROLLER);

//        $res ['title'] = '营销概况';
//        $res ['url'] = addons_url('Shop://Shop/lists');
//        $res ['class'] = ($controller == 'shop' && _ACTION == "lists") ? 'current' : '';
//        $nav [] = $res;
//
//        $res ['title'] = '订单管理';
//        $res ['url'] = addons_url('Shop://Order/lists');
//        $res ['class'] = ($controller == 'order' && _ACTION == "lists") ? 'current' : '';
//        $nav [] = $res;

        $nav = array ();
        $this->assign('nav', $nav);

        define('CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'Shop/View/default/Wap/Template');
    }
}
