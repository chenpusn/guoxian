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
}