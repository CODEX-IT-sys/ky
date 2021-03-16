<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * XtDepartment模型的Facade
 * @package app\facade
 * @see     \app\common\model\XtDepartment
 * @mixin \app\common\model\XtDepartment
 */
class XtDepartment extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\XtDepartment';
    }
}