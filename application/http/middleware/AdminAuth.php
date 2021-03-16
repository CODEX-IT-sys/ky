<?php
namespace app\http\middleware;

use think\Request;

// 中间件-未登录拦截
class AdminAuth
{
    public function handle(Request $request, \Closure $next)
    {
        if (session('administrator.id') === null) {
            $url = 'login/admin/index';

            if ($request->isAjax()) {
                $response = json(['msg' => '未登录', 'url' => url($url)], 403);
            } else {
                $response = redirect($url);
            }

            return $response;
        }

        return $next($request);
    }
}