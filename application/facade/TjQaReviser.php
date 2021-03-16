<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 校对人员质量评估 模型的Facade
 * @package app\facade
 * @see     \app\common\model\TjQaReviser
 * @mixin \app\common\model\TjQaReviser
 */
class TjQaReviser extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\TjQaReviser';
    }
}