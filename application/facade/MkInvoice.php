<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 请款管理 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkInvoice
 * @mixin \app\common\model\MkInvoice
 */
class MkInvoice extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkInvoice';
    }
}