<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\Admin as AdminModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 系统词库 控制器
class XtDict extends Common
{

    // 词汇分类 列表
    public function index(Request $request)
    {

        $list = Db::name('xt_dict_cate')
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

    // 词汇分类查看
    public function read(Request $request, $c_id)
    {

        $list = Db::name('xt_dict')
            ->where('c_id',$c_id)
            ->field('id, cn_name, en_name')
            ->select();

        if (!$request->isAjax()) {
            // 返回视图
            return view('dict',['c_id'=>$c_id]);
        }

        // 按格式组装返回数据
        $a['code'] = 0;
        $a['msg'] = '成功';
        $a['data'] = $list;

        // 返回数据
        return json($a);
    }

    // 创建选项
    public function create($c_id)
    {
        // 返回视图
        return view('',['c_id'=>$c_id]);
    }

    // 保存 新建选项
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 数据库写入数据
        $res = Db::name('xt_dict')->insert($data);

        // 返回操作结果
        return json(['msg'=>'操作成功']);
    }

    // 编辑选项 视图
    public function edit($id)
    {
        // 查询信息
        $info = Db::name('xt_dict')->where('id',$id)->find();

        // 返回视图
        return view('',['info'=>$info]);
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新数据
        $res = Db::name('xt_dict')->update($data);

        // 返回操作结果
        return json(['msg'=>'操作成功']);
    }

    // 删除
    public function delete($id)
    {
        // 查询信息
        $res = Db::name('xt_dict')->delete($id);

        // 返回操作结果
        return json(['msg'=>'操作成功']);
    }
}
