<?php
/**
 * Created by PhpStorm.
 * User: pchen
 * Date: 2015/12/27
 * Time: 21:24
 */

namespace Addons\Shop\Controller;

use Home\Controller\AddonsController;

class AdminController extends AddonsController
{
    function sales(){
        $this->display();
    }

    function salesDetail(){
        $filterStartDate = I('start')?I('start'):date('Y-n-d');
        $filterEndDate = I('end')?I('end'):date('Y-n-d');

        if(IS_GET){
            $orderDao = D ( 'Addons://Shop/Order' );
            $filterStartDateTimeStamp = strtotime($filterStartDate);
            $filterEndDateTimeStamp = strtotime($filterEndDate);
            $filterEndDateAddOneDayTimeStapm =  strtotime('+1 day', $filterEndDateTimeStamp);

            $filter_order['cTime'] = array('between', array($filterStartDateTimeStamp, $filterEndDateAddOneDayTimeStapm));
            $filter_order['pay_status'] = '1';
            $orderLists = $orderDao->where($filter_order)->select();

            $orderSheet = array();
            $total_amount = 0;
            foreach ( $orderLists as &$order ) {

                $orderGoods = json_decode ( $order ['goods_datas'], true );

                foreach($orderGoods as $goods){
                    $exits = false;
                    foreach($orderSheet as &$orderGood){
                        if($orderGood['id'] == $goods['id']){
                            $goods_sale_amount = $goods['num']*$goods['price'];
                            $orderGood['sales_amount'] += $goods_sale_amount;
                            $orderGood['sales_num'] += $goods['num'];
                            $total_amount += $goods_sale_amount;
                            $exits = true;
                            break;
                        }
                    }
                    if(!$exits){
                        $goods_sale_amount = $goods['num']*$goods['price'];
                        $orderSheet[] = array(
                            'id'=>$goods['id'],
                            'title'=>$goods['title'],
                            'sales_amount'=>$goods_sale_amount,
                            'sales_num'=>$goods['num']);
                        $total_amount += $goods_sale_amount;
                    }
                }
            }


            $this->assign('filter_start_date', $filterStartDate);
            $this->assign('filter_end_date', $filterEndDate);
            $this->assign('goods_lists', $orderSheet);
            $this->assign('total_amount', $total_amount);

            $this->display();
        }

    }

    function send(){
        $this->display();
    }

    function sendDetail(){
        if(IS_GET){
            $map['mobile'] = I('mobile');
            $user = D ( 'Common/shop_address' )->where($map)->find();

            $map['uid'] = $user['id'];
            $orderLists = D('Order')->where($map)->order('id desc')->select();

            foreach ($orderLists as $order) {
                $result['order_id'] = $order['id'];
                $result['order_number'] = $order['order_number'];
                $result['order_date'] = time_format($order['cTime']);
                // 如果尚未付款，显示付款状态；如果已经付款，显示订单跟踪状态
                if ($order['pay_status'] != 1) {
                    $result['order_status'] = getNamebyPayStatus($order['pay_status']);
                } else {
                    $result['order_status'] = getNamebyOrderStatus($order['status_code']);
                }
                $result['status_code'] = $order['status_code'];
                $result['goods'] = json_decode($order['goods_datas'], true);
                $result['total_price'] = $order['total_price'];
                $address_info = D('Shop')->getInfo($order['address_id']);
                $result['fetch_address'] = $address_info['intro'];
                $result['fetch_contact'] = $address_info['mobile'];
                $result['id'] = $order['order_number'];

                $results[] = $result;
            }
            $this->assign('userInfo', $user);
            $this->assign('lists', $results);
            $this->display();
        }
    }

    function confirmSend(){
        if(IS_GET){
            $orderInfo = D('Addons://Shop/Order')->getInfoByOrderNumber(I('number'));

            D('Addons://Shop/Order')->setStatusCode($orderInfo[0]["id"], 3);

            D('Addons://Shop/Order')->add_order_log($orderInfo[0]["id"], 3, I('get.'), '订单状态' . getNamebyOrderStatus(3));

            $feedback = '订单'.I('number').'已确认取货。';

            $this->assign('feedback', $feedback);
            $this->display();
        }
    }
}