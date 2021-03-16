<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 来稿确认 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkFeseability
 * @mixin \app\common\model\MkFeseability
 */
class MkFeseability extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkFeseability';
    }
}