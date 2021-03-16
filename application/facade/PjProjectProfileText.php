<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目描述 文件库 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjProjectProfileText
 * @mixin \app\common\model\PjProjectProfileText
 */
class PjProjectProfileText extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjProjectProfileText';
    }
}