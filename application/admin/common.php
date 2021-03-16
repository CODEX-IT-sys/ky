<?php

namespace app\common\controller;

use think\Controller;
use think\Request;
use think\Loader;
use think\Db;

use think\facade\View;

// 系统模块公共文件
class Common extends Controller
{
    /**
     * @var \think\Request Request实例
     */
    protected $request;

    // 构造函数(前置读写权限控制)
    public function __construct(Request $request = null)
    {
        //parent::__construct($request);

        // 栏目名
        $controller = $request->controller();

        // 方法名
        $action = $request->action();
        //方法 首字母小写转换
        $action = lcfirst($action);

        // 读、写 操作 涉及的操作方法名
        $action_arr = ['read','create','edit','delete'];

        // 判断方法名
        if (in_array($action, $action_arr)) {

            $name = session('administrator')['name'];

            // 根据栏目 查询 读写权限
            $rw = Db::name('xt_rw_auth')
                ->where('name',$name)->where('C',$controller)
                ->value($action);

            if (empty($rw)) {

                $this->error('无权操作,Permission Denied');

            }else if($rw == 0){

                $this->error('无权操作,Permission Denied');
            }
        }
    }

}