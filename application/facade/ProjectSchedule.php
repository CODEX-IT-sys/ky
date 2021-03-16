<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目日程 模型的Facade
 * @package app\facade
 * @see     \app\common\model\ProjectSchedule
 * @mixin \app\common\model\ProjectSchedule
 */
class ProjectSchedule extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\ProjectSchedule';
    }
}