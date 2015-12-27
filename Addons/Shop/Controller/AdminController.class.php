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
    function  sales(){
        $this->display();
    }
}