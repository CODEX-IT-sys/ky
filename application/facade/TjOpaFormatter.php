<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 排版人员综合考核 模型的Facade
 * @package app\facade
 * @see     \app\common\model\TjOpaFormatter
 * @mixin \app\common\model\TjOpaFormatter
 */
class TjOpaFormatter extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\TjOpaFormatter';
    }
}