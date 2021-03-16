<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 开票单 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkFapiao
 * @mixin \app\common\model\MkFapiao
 */
class MkFapiao extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkFapiao';
    }
}