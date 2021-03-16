<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目助理综合考核 模型的Facade
 * @package app\facade
 * @see     \app\common\model\TjOpaPa
 * @mixin \app\common\model\TjOpaPa
 */
class TjOpaPa extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\TjOpaPa';
    }
}