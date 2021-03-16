<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 客户反馈 模型的Facade
 * @package app\facade
 * @see     \app\common\model\PjClientFeedback
 * @mixin \app\common\model\PjClientFeedback
 */
class PjClientFeedback extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\PjClientFeedback';
    }
}