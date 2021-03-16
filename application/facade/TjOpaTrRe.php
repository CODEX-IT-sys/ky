<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 翻译校对人员综合考核 模型的Facade
 * @package app\facade
 * @see     \app\common\model\TjOpaTrRe
 * @mixin \app\common\model\TjOpaTrRe
 */
class TjOpaTrRe extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\TjOpaTrRe';
    }
}