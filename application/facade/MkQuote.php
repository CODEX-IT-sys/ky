<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 报价单 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkQuote
 * @mixin \app\common\model\MkQuote
 */
class MkQuote extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkQuote';
    }
}