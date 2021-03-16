<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 我的日程 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MySchedule
 * @mixin \app\common\model\MySchedule
 */
class MySchedule extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MySchedule';
    }
}