<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * 文件管理 模型的Facade
 * @package app\facade
 * @see     \app\common\model\XtFile
 * @mixin \app\common\model\XtFile
 */
class XtFile extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\XtFile';
    }
}