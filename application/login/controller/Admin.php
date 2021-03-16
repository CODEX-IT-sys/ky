<?php
namespace app\login\controller;

use think\Controller;

// 系统登录的控制器
class Admin extends Controller
{
    // 管理员的验证器名称
    private $validate = '\app\login\validate\Admin';

    // 验证失败抛出异常
    protected $failException = true;

    // 针对控制器方法的中间件
    protected $middleware = [
        'AjaxCheck' => ['only' => ['login']],
    ];

    // 显示登录页
    public function index()
    {
        // 直接返回视图
        return view('/admin');
    }

    // 登录
    public function login($name, $password)
    {
        // 数据验证
        $this->validate(['name' => $name, 'password' => $password], $this->validate);

        // 调用模型的登录方法
        $res = \app\facade\Admin::login($name, $password);

        // 返回数据
        if ($res === true) {
            $code = 1;
            $msg  = '登录成功';

        } else {
            $code = 0;
            $msg  = $res;
        }
        return json(['code' => $code, 'msg' => $msg]);
    }

    // 注销
    public function logout()
    {
        session('administrator', null);

        $this->redirect('login/admin/index');
    }
}
