<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * XtCompany模型的Facade
 * @package app\facade
 * @see     \app\common\model\XtCompany
 * @mixin \app\common\model\XtCompany
 */
class XtCompany extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\XtCompany';
    }
}