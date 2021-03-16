<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 项目数据库 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjProjectDatabase
 * @mixin \app\common\model\PjProjectDatabase
 */
class PjProjectDatabase extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjProjectDatabase';
    }
}