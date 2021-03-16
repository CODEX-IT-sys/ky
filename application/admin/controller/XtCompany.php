<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\Admin as AdminModel;
use app\facade\XtCompany as CompanyModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 主体公司 控制器
class XtCompany extends Common
{

    // 主体公司 列表
    public function index(Request $request, $field = '', $keyword = '', $limit = 50)
    {

        if (!$request->isAjax()) {
            // 返回视图
            return view('');
        }

        $list = CompanyModel::getList($field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 查看
    public function read($id)
    {
        // 查询信息
        $info = CompanyModel::get($id);

        // 返回视图
        return view('edit',['info'=>$info]);
    }

    // 创建
    public function create()
    {
        // 返回视图
        return view('');
    }

    // 保存 新建选项
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 数据库写入数据
        CompanyModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 编辑选项 视图
    public function edit($id)
    {
        // 查询信息
        $info = CompanyModel::get($id);

        // 返回视图
        return view('',['info'=>$info]);
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新数据
        CompanyModel::update($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 删除
    public function delete($id)
    {

        CompanyModel::destroy($id);

        // 返回操作结果
        return json(['msg'=>'操作成功']);
    }

    // 异步获取 关联信息
    public function get_info($name)
    {
        // 查询主体公司信息
        $info = Db::name('xt_company')
            ->where('cn_name',$name)
            ->whereOr('en_name',$name)
            ->find();

        // 返回值
        return json(['data'=>$info]);
    }
}
