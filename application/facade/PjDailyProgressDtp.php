<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 每日进度（排版） 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjDailyProgressDtp
 * @mixin \app\common\model\PjDailyProgressDtp
 */
class PjDailyProgressDtp extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjDailyProgressDtp';
    }
}