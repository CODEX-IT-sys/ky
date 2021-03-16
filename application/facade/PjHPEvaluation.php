<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 后排评估 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjHPEvaluation
 * @mixin \app\common\model\PjHPEvaluation
 */
class PjHPEvaluation extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjHPEvaluation';
    }
}