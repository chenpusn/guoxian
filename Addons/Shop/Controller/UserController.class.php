<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class UserController extends AddonsController
{
    var $userID;
    var $SHOP_COOKIE_NAME = 'HZXUSER';
    function _initialize()
    {
        parent::_initialize();

        // 本地未绑定用户信息 如果是需要用户信息的操作 则转至用户新绑定页面
        if(!cookie($this->SHOP_COOKIE_NAME.C('SITE_VERSION'))){
            $actionsNeedLogin = array('myCart');
            if (in_array(_ACTION, $actionsNeedLogin)){
                $this->redirect("bindUser");
            }
        }
        // 获取用户信息
        else{
            $userInfoJson = cookie($this->SHOP_COOKIE_NAME.C('SITE_VERSION'));
            $this->userID = json_decode ($userInfoJson);
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
        $this->assign("userInfo", $this->userID);

        // cart num
        $cartCount = D('Cart')->getMyCartCount($this->userID);
        $this->assign("cartCount", $cartCount);
        $this->display();
    }

    // CHEN PU: 2015/12/12 绑定用户信息
    function bindUser(){
        if (IS_POST) {
            $accountInfo = I('post.');
            $res = D('ShopUser')->bindAccount($accountInfo);

            cookie($this->SHOP_COOKIE_NAME.C('SITE_VERSION'), $res);
            redirect(U('index'));
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

    function addToCart(){
        $goods ['goods_id'] = I('goodsId');
        $info = D('goods')->getInfo($goods ['goods_id']);

        $goods ['price'] = $info ['price'];
        $goods ['shop_id'] = $info ['shop_id'];

        $goods ['uid'] = $this->userID;
        $goods ['num'] = 1;

        echo D('Cart')->addToCart($goods);
    }

    function cart(){
        if ($this->userID > 0) {
            $list = D ( 'Cart' )->getMyCart ( $this->userID, true );

            $dao = D ( 'goods' );
            foreach ( $list as &$v ) {
                $v ['goods_data'] = $dao->getInfo ( $v ['goods_id'] );
            }

            // dump ( $list );
            $this->assign ( 'lists', $list );

            $this->display ();
        } else {
            //cookie($this->SHOP_COOKIE_NAME.C('SITE_VERSION'), 'cart');
            $this->redirect("bindUser", "请先绑定个人信息");
        }
    }

    function delCart()
    {
        $ids = I('ids');
        echo D('Cart')->delCart($ids);
    }
}

?>