<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class UserController extends AddonsController
{
    var $userInfo;

    function _initialize()
    {
        parent::_initialize();

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


    // CHEN PU: 2015/12/12 移动端 首页
    // 显示商品列表
    function index(){
        // 获取所有目录

        $categoryList = D("Category")->getShopCategory(0);
        $categoryListWithAll[] = array("id"=>0, "title"=>"所有");
        foreach($categoryList as $key => $value){
            $categoryListWithAll[] = $value;
        }

        $this->assign("categoryList", $categoryListWithAll);

        $goodsList = D("Goods")->getGoodsByCategory(0);
        $this->assign("goodsList", $goodsList);

        // banner
        $slideshow_list = D('Slideshow')->getShopList(0);
        $this->assign('slideShowList', $slideshow_list);

        // User info
        $this->assign("userInfo", $this->userInfo);
        $this->display();
    }

    // CHEN PU: 2015/12/12 绑定用户信息
    function bind_user(){
        if (IS_POST) {
            $accountInfo = I('post.');
            $res = D('ShopUser')->bindAccount($accountInfo);

            cookie("SHOPUSERID".C('SITE_VERSION'), $res);
            redirect(U(cookie('SHOPFORWARDURL'.C('SITE_VERSION'))));
        }
        else{
            $id = I('id');
            if ($id) {
                $info = D('ShopUser')->getAccount($id);
                $this->assign('info', $info);
            }
            $this->display();
        }
    }
}

?>