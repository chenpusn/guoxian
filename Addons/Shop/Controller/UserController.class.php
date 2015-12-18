<?php

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class UserController extends AddonsController
{
    var $userID;
    var $SHOP_COOKIE_NAME = 'HZXUSER';
    var $SHOP_SESSION_CONFIRM_ORdER = 'CONFIRMORDER';
    function _initialize()
    {
        parent::_initialize();

        // 本地未绑定用户信息 如果是需要用户信息的操作 则转至用户新绑定页面
        if(!cookie($this->SHOP_COOKIE_NAME.C('SITE_VERSION'))){
            $actionsNotNeedLogin = array('index', 'bindUser');
            if (!in_array(_ACTION, $actionsNotNeedLogin)){
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

    #region 账号信息
    // 2015-12-19 CHEN PU
    // 个人信息页
    function me(){
        $user = D('ShopUser')->getAccount($this->userID);

        $this->assign('user', $user);

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

    // CHEN PU: 2015/12/19 解除绑定用户信息
    function unbind(){
        if(IS_POST){
            cookie(null);
        }
    }
    #endregion

    #region 购物车
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
    #endregion

    #region 订单支付
    function myOrder(){
        $map['uid'] = $this->userID;
        $orderLists = D('Order')->where($map)->order('id desc')->select();

        foreach($orderLists as $order){
            $result['order_id'] = $order['id'];
            $result['order_number'] = $order['order_number'];
            $result['order_date'] = time_format($order['cTime']);
            $result['order_paystatus'] = getNamebyPayStatus($order['pay_status']);
            $result['order_status'] = getNamebyOrderStatus($order['status_code']);
            $result['goods'] = json_decode($order['goods_datas'], true);
        }

        $this->assign('lists', $result);

        $this->display();
    }

    function confirmOrder()
    {
        // 订单信息
        if (IS_POST) {
            $dao = D('Goods');
            $total_price = 0;
            if (isset ($_POST ['goods_ids'])) {
                $goods_ids = I('post.goods_ids');
                $numArr = I('post.buyCount');
                foreach ($goods_ids as $id) {
                    $goods = $dao->getInfo($id);
                    $goods ['num'] = $numArr [$id];
                    $list [] = $goods;

                    $total_price += $goods ['num'] * $goods ['price'];
                }
            } else {
                $id = I('post.goods_id');
                $goods = $dao->getInfo($id);
                $goods ['num'] = I('post.buyCount');
                $list [] = $goods;

                $total_price = $goods ['num'] * $goods ['price'];
            }

            $data ['lists'] = $list;
            $data ['total_price'] = $total_price;

            session($this->SHOP_SESSION_CONFIRM_ORdER, $data);
        } else {
            $data = session($this->SHOP_SESSION_CONFIRM_ORdER);
        }

        $this->assign($data);

        $map['id'] = array('GT', 1);
        $fetchGoodsAddress = D ( 'Shop' )->where($map)->select();

        $this->assign('fetch_address', $fetchGoodsAddress);

        // 收货地址
        /*if (isset ($_GET ['address_id'])) {
            $address = D('Address')->getInfo(I('get.address_id'));
        } else {
            $address = D('Address')->getMyAddress($this->mid);
        }
        $this->assign('address', $address);*/

        $this->display();
    }

    // 生成订单
    function createOrder()
    {
        if(IS_POST){
            $data ['address_id'] = I('address_id'); // TODOCHENPU: 需改为用户在终端选择的分店提货点//$this->mid; //I('address_id');
            $data ['remark'] = I('remark');
            $data ['uid'] = $this->userID;

            $data ['order_number'] = date('YmdHis') . substr(uniqid(), 4);
            $data ['cTime'] = NOW_TIME;
            $data ['openid'] = get_openid();
            $data ['pay_status'] = 0;
            $info = session($this->SHOP_SESSION_CONFIRM_ORdER );

            $data ['total_price'] = $info ['total_price'];
            $data ['goods_datas'] = json_encode($info ['lists']);
            if ($info ['order_from_type']) {
                $data ['order_from_type'] = $info ['order_from_type'];
            }
            $data ['shop_id'] = 1; //TODOCHENPU: 需改为用户在终端选择的分店提货点//$this->shop_id;
            $id = D('Addons://Shop/Order')->add($data);
            if ($id) {
                // 删除购物车消息
                $goods_ids = getSubByKey($info ['lists'], 'id');
                D('Cart')->delUserCart($this->userID, $goods_ids);
                echo $id;
            } else {
                echo 0;
            }
        }
    }

    // 调用钱方支付
    // https://support.qfpay.com/qiantai/H5/H5.html
    // CHEN PU: 2015/12/09
    function qianfangPay()
    {
        $order_id = $_GET ['order_id'];
        $orderDao = D('Addons://Shop/Order');
        $orderInfo = $orderDao->getInfo($order_id);
        $customerId = $orderInfo['uid'];
        $outUser = $customerId;

        $accountInfo = D('Addons://Shop/ShopUser')->getAccount($this->userID);
        if(!$accountInfo){
            echo '信息错误';
        }
        else{
            $mobile = $accountInfo[0]['mobile'];
            trace($outUser, "outUser", 'user');
            trace($mobile, "mobile", 'user');
            $qianfangToken = getQianfangToken($outUser, $mobile);
            trace($qianfangToken, "qianfangToken", 'user');
            // 如果正确，返回token值；如果错误，返回0
            if (!$qianfangToken) {
                echo "付款失败";
            } else {
                //$orderInfo['total_price']
                $totalAmt = $orderInfo["total_price"] * 100;
                $orderNO = $orderInfo["order_number"];
                $qianfangOrderToken = getQianFangOrderToken($totalAmt, $orderNO);
                if (!$qianfangOrderToken) {
                    echo "付款失败";
                } else {

                    $goods = json_decode($orderInfo ['goods_datas'], true);
                    $goodsName = "";
                    foreach ($goods as $good) {
                        $goodsName .= $good['title'];
                    }

                    $checkoutUrl =
                        sprintf("https://qtapi.qfpay.com/wap/v1/checkout/get_openid?" .
                            "token=%s&order_token=%s&goods_name=%s&" .
                            "mobile=%s&total_amt=%s&out_sn=%s&showwxpaytitle=1",
                            $qianfangToken, $qianfangOrderToken, $goodsName,
                            $mobile, $totalAmt, $orderNO);

                    redirect($checkoutUrl);
                }
            }
        }
    }

    //https://support.qfpay.com/qiantai/H5/H5.html
    //CHENPU:2015-12-16 接受钱方支付平台的反馈信息
    function payFeedback(){
        $orderNumber = I ( 'out_sn' );
        $orderInfo = D ( 'Addons://Shop/Order' )->getInfoByOrderNumber($orderNumber);
        $goods = json_decode($orderInfo[0]['goods_datas'], true);
        $goodsName = "";
        foreach ($goods as $good) {
            $goodsName .= $good['title'];
        }

        $feedback = '';
        // Qian Fang: 1 未支付 2 完成(已支付) 3 关闭
        switch(I('status')){
            case 1:
                $save ['pay_status'] = 3;
                $feedback = '您的订单尚未支付，请尽快付款，以免影响配货。';
                break;
            case 2:
                $save ['pay_status'] = 1;
                $feedback = '您预定的'.$goodsName.'已成功付款，我们将尽快为您配货，请在明日12点前到指定提货点取货。';
                break;
            case 3:
                $save ['pay_status'] = 2;
                $feedback = '您的订单已关闭';
                break;
        }

        $save['pay_type'] = I('pay_type');
        $save['qianfang_number'] = I('order_id');
        $pay_time = strtotime (I('pay_time'));
        $save['pay_time'] = $pay_time;

        $res = D ( 'Addons://Shop/Order' )->update ( $orderInfo[0]["id"], $save );
        switch(I('status')){
            case 2:
                D ( 'Addons://Shop/Order' )->setStatusCode ( $orderInfo[0]["id"], 2);
                D ( 'Addons://Shop/Order' )->add_order_log ( $orderInfo[0]["id"], 2, I('get.'), '订单状态'.getNamebyOrderStatus(2));
                break;
            case 3:
                D ( 'Addons://Shop/Order' )->setStatusCode ( $orderInfo[0]["id"], -1);
                D ( 'Addons://Shop/Order' )->add_order_log ( $orderInfo[0]["id"], -1, I('get.'), '订单状态'.getNamebyOrderStatus(-1));
                break;
            case 1:
                D ( 'Addons://Shop/Order' )->setStatusCode ( $orderInfo[0]["id"], 1);
                D ( 'Addons://Shop/Order' )->add_order_log ( $orderInfo[0]["id"], 1, I('get.'), '订单状态'.getNamebyOrderStatus(1));
                break;
        }

        D ( 'Addons://Shop/Order' )->add_order_log ( $orderInfo[0]["id"], I('status'), json_encode(I('get.')), '支付状态'.getNamebyPayStatus(I('status')));


        $this->assign('feedback', $feedback);
        $this->display();
    }
    #endregion
}

?>