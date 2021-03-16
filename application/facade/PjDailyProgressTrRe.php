<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目描述 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjDailyProgressTrRe
 * @mixin \app\common\model\PjDailyProgressTrRe
 */
class PjDailyProgressTrRe extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjDailyProgressTrRe';
    }
}