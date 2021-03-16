<?php
namespace app\common\exception;

use Exception;
use think\exception\Handle;
use think\exception\ValidateException;

// 异常处理类
class Http extends Handle
{
    public function render(Exception $e)
    {
        // 验证错误
        if ($e instanceof ValidateException) {
            return response($e->getError(), 422);
        }

        return parent::render($e);
    }

}