<?php
namespace app\http\middleware;

use app\facade\Admin;
use think\Request;

// 中间件-管理员系统的权限拦截
class AdministratorAuth
{
    public function handle(Request $request, \Closure $next)
    {
        // 获取提交的id
        $id = $request->route('id/d');

        // 根据管理员的类型，验证权限
        if (session('administrator.id') === 1) {
            // 如果是超级管理员
            $res = $this->checkSuper($request, $id);
        } else {
            // 如果不是超级管理员
            $res = $this->checkNotSuper($request, $id);
        }

        if (!$res) {
            return response('没有权限', 403);
        }

        return $next($request);
    }

    // 验证超级管理员的权限
    private function checkSuper(Request $request, $id)
    {
        // 调用模型，判断id是否存在
        $exist = Admin::checkId($id);
        // 如果id不存在，返回false
        if (!$exist) {
            return false;
        }

        // 如果要删除的id等于超管的id，返回false
        if ($request->action() === 'delete') {
            if ($id === 1) {
                return false;
            }
        }

        return true;
    }

    // 验证非超级管理员的权限
    private function checkNotSuper(Request $request, $id)
    {
        // 如果访问查看的方法，验证提交的id是否存在
        if ($request->action() === 'read') {
            return Admin::checkId($id);
        }

        // 禁止访问其他的方法
        return false;
    }
}