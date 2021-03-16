<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目总结 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjProjectSummary
 * @mixin \app\common\model\PjProjectSummary
 */
class PjProjectSummary extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjProjectSummary';
    }
}