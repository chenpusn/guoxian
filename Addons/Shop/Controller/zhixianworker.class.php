#!/usr/local/bin/php -q
<?php
/**
 * Created by PhpStorm.
 * User: pchen
 * Date: 2015/12/27
 * Time: 8:04
 */
namespace Addons\Shop\Controller;


class zhixianworker extends Worker{

    public function run()
    {
        while(1){
            $localtime_assoc = localtime(time(), true);
            if(in_array($localtime_assoc['tm_min'], array('5', '15', '25', '35', '45', '55'))){
                $orderDao = D ( 'Addons://Shop/Order' );
                $filter_order['pay_status'] = '0';
                $orderLists = $orderDao->where($filter_order)->select();

                foreach ( $orderLists as $order ) {
                    $caller = 'server';
                    $app_code = 'C921FF5C81381E203BAE6D9AC2E90C0F';

                    $data = array(	'caller'=> $caller,
                        'app_code' => $app_code,
                        'order_id' => $order['order_number'],
                        'sign'=>'');

                    $sign_str = getQianfangSign($data);
                    $data['sign'] = $sign_str;
                    while(list($key, $value) = each($data)){
                        $item[] = $key.'='.$value;
                    }
                    $orderQuery = implode('&', $item);

                    $server_url = 'https://qtapi.qfpay.com/order/v1/query?'.$orderQuery;

                    $curl = curl_init();
                    curl_setopt($curl, CURLOPT_URL, $server_url);
                    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
                    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
                    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
                    $info_json = curl_exec($curl);
                    if(!curl_errno($curl)){
                        $info = json_decode($info_json);
                        $pay_status = $info->data['order_info']['status'];
                        // Qian Fang: 1 未支付 2 完成(已支付) 3 关闭
                        switch ($pay_status) {
                            case 1:
                                $save ['pay_status'] = 3;
                                break;
                            case 2:
                                $save ['pay_status'] = 1;
                                break;
                            case 3:
                                $save ['pay_status'] = 2;
                                break;
                        }

                        $save['pay_type'] = $info->data['order_info']['pay_type'];
                        $save['qianfang_number'] = $info->data['order_info']['order_id'];
                        $pay_time = strtotime($info->data['order_info']['pay_time']);
                        $save['pay_time'] = $pay_time;

                        $res = D('Addons://Shop/Order')->update($order["id"], $save);
                        switch ($info->data['order_info']['status']) {
                            case 2:
                                D('Addons://Shop/Order')->setStatusCode($order["id"], 2);
                                D('Addons://Shop/Order')->add_order_log($order["id"], 2, $info, '订单状态' . getNamebyOrderStatus(2));
                                break;
                            case 3:
                                D('Addons://Shop/Order')->setStatusCode($order["id"], -1);
                                D('Addons://Shop/Order')->add_order_log($order["id"], -1, $info, '订单状态' . getNamebyOrderStatus(-1));
                                break;
                            case 1:
                                D('Addons://Shop/Order')->setStatusCode($order["id"], 1);
                                D('Addons://Shop/Order')->add_order_log($order["id"], 1, $info, '订单状态' . getNamebyOrderStatus(1));
                                break;
                        }

                        D('Addons://Shop/Order')->add_order_log($order["id"], $pay_status, $info, '支付状态' . getNamebyPayStatus($save ['pay_status']));
                    }
                    else{
                        $err = '访问服务器出错:'.curl_error($curl);
                        trace($err, "order status query error", 'user');

                    }
                    curl_close($curl);
                }
            }
        }
    }
}

$worker = new zhixianworker();
$worker->start();
