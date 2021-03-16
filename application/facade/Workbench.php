<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 我的工作台 模型的Facade
 * @package app\facade
 * @see     \app\common\model\Workbench
 * @mixin \app\common\model\Workbench
 */
class Workbench extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\Workbench';
    }
}