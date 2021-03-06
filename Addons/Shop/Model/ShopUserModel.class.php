<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class ShopUserModel extends Model {
    protected $tableName = 'shop_address';

    function bindAccount($accountInfo){
        $map['mobile'] = $accountInfo['mobile'];
        $user = $this->where($map)->find();
        if(!$user){
            if($accountInfo['mobile'] && $accountInfo['truename']){
                $res = $this->add($accountInfo);
            }
        }else{
            $this->where($map)->save($accountInfo);
            $res = $user['id'];
        }
        return $res;
    }

    function  getAccount($accountId){
        $map['id'] = $accountId;
        $res = $this->where($map)->find();
        return $res;
    }
}