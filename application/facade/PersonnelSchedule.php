<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 人员日程 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PersonnelSchedule
 * @mixin \app\common\model\PersonnelSchedule
 */
class PersonnelSchedule extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PersonnelSchedule';
    }
}