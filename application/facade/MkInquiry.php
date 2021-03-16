<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 来稿需求 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkInquiry
 * @mixin \app\common\model\MkInquiry
 */
class MkInquiry extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkInquiry';
    }
}