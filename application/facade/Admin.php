<?php
namespace app\facade;

use think\facade;
use think\Model;

/**
 * Admin模型的Facade
 * @package app\facade
 * @see     \app\common\model\Admin
 * @mixin \app\common\model\Admin
 */
class Admin extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\Admin';
    }
}