<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目描述 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjProjectRelease
 * @mixin \app\common\model\PjProjectRelease
 */
class PjProjectRelease extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjProjectRelease';
    }
}