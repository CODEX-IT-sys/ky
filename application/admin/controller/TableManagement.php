<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use think\Controller;
use think\Db;
use think\Env;

// 数据表格管理
class TableManagement extends Controller
{
    public function index()
    {

        // 跳转到数据库管理工具界面
        $this->redirect('');

    }
}
