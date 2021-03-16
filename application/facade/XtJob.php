<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * XtJob模型的Facade
 * @package app\facade
 * @see     \app\common\model\XtJob
 * @mixin \app\common\model\XtJob
 */
class XtJob extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\XtJob';
    }
}