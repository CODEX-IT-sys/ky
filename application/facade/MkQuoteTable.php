<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 报价单 表格数据 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkQuoteTable
 * @mixin \app\common\model\MkQuoteTable
 */
class MkQuoteTable extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkQuoteTable';
    }
}