<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 客户信息 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkCustomer
 * @mixin \app\common\model\MkCustomer
 */
class MkCustomer extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkCustomer';
    }
}