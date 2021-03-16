<?php
namespace app\http\middleware;

use think\Request;

// 中间件-拦截非Ajax请求
class AjaxCheck
{
    public function handle(Request $request, \Closure $next)
    {
        if (!$request->isAjax()) {
            return response('非法请求', 403);
        }

        return $next($request);
    }
}