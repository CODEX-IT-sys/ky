<?php
namespace app\facade;

use think\Facade;

/**
 * DownloadTempExcel模型的Facade
 * @package app\facade
 * @see \app\common\model\TempExcel
 * @mixin \app\common\model\TempExcel
 */
class TempExcel extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\common\model\TempExcel';
    }
}