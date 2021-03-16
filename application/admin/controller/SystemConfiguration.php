<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 系统设置 控制器
class SystemConfiguration extends Controller
{
    // 系统信息
    public function index(Request $request)
    {
        // 查询信息
        $list = Db::name('xt_table_text')
            ->field('id, cn_name, en_name')
            ->select();

        if (!$request->isAjax()) {
            // 返回视图
            return view('');
        }

        // 按格式组装返回数据
        $a['code'] = 0;
        $a['msg'] = '成功';
        $a['data'] = $list;

        // 返回数据
        return json($a);
    }

    // 编辑选项 视图
    public function edit($id)
    {
        // 查询信息
        $info = Db::name('xt_table_text')->where('id',$id)->find();

        // 返回视图
        return view('',['info'=>$info]);
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新数据
        $res = Db::name('xt_table_text')->update($data);

        // 返回操作结果
        return json(['msg'=>'操作成功']);
    }


}
