<?php

namespace Addons\Shop\Model;

use Think\Model;

/**
 * Shop模型
 */
class ShopUserModel extends Model {
    protected $tableName = 'shop_address';

    function bindAccount($accountInfo){
        $res = $this->add($accountInfo);
        return $res;
    }

    function  getAccount($accountId){
        $map['id'] = $accountId;
        $res = $this->where($map);
        return $res;
    }
}