<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 结算管理 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkInvoicing
 * @mixin \app\common\model\MkInvoicing
 */
class MkInvoicing extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkInvoicing';
    }
}