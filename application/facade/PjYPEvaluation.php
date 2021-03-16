<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 后排评估 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjYPEvaluation
 * @mixin \app\common\model\PjYPEvaluation
 */
class PjYPEvaluation extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjYPEvaluation';
    }
}