<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 请款单 表格数据 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkInvoiceTable
 * @mixin \app\common\model\MkInvoiceTable
 */
class MkInvoiceTable extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkInvoiceTable';
    }
}