<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 合同信息 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkContract
 * @mixin \app\common\model\MkContract
 */
class MkContract extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkContract';
    }
}