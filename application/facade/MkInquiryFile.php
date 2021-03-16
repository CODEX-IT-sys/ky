<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 来稿需求 文件信息 模型的Facade
 * @package app\facade
 * @see     \app\common\model\MkInquiryFile
 * @mixin \app\common\model\MkInquiryFile
 */
class MkInquiryFile extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\MkInquiryFile';
    }
}