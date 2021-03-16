<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 后排评估 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjTranslationEvaluation
 * @mixin \app\common\model\PjTranslationEvaluation
 */
class PjTranslationEvaluation extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjTranslationEvaluation';
    }
}