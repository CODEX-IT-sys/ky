<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 系统消息提醒 模型的Facade
 * @package app\facade
 * @see     \app\common\model\XtMessages
 * @mixin \app\common\model\XtMessages
 */
class XtMessages extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\XtMessages';
    }
}