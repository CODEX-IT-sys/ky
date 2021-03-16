<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use app\facade\PjProjectProfile as PjProjectProfileModel;
use app\facade\TjQaReviser as TjQaReviserModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 统计报表 校对人员质量评估 控制器
class QaReviser extends Controller
{
    //校对人员质量评估 (手动填写表格)
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_quality_appraisal_reviser');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
            ]);
        }

        // 调用模型获取列表
        $list = TjQaReviserModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 校对人员质量评估 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_quality_appraisal_reviser');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    //校对人员质量评估 显示新建的表单页
    public function create()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_quality_appraisal_reviser');

        // 查询 项目描述表 可供预选的 文件编号值
        $file_code = PjProjectProfileModel::field('Filing_Code')
            ->order('id desc')->select();

        // 返回视图
        return view('read',['info'=>'', 'file_code'=>$file_code, 'field'=>$colsData]);
    }

    //校对人员质量评估 查看
    public function read($id)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_quality_appraisal_reviser');

        // 查询信息
        $res = TjQaReviserModel::get($id);

        // 直接返回视图
        return view('write',['info'=>$res, 'field'=>$colsData]);
    }

    //校对人员质量评估 编辑视图
    public function edit($id)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_quality_appraisal_reviser');

        // 查询 项目描述表 可供预选的 文件编号值
        $file_code = PjProjectProfileModel::field('Filing_Code')
            ->order('id desc')->select();

        // 查询信息
        $res = TjQaReviserModel::get($id);

        return view('write', ['info'=>$res, 'file_code'=>$file_code, 'field'=>$colsData]);
    }

    // 新建 校对人员质量评估 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入时间
        $data['Time'] = date("Ymd");
        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 调用 模型 写入数据
        TjQaReviserModel::create($data);

        // 返回操作结果
        return json(['msg' => '操作成功']);
    }

    // 更新 校对人员质量评估
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新 时间
        $data['Time'] = date("Ymd");

        TjQaReviserModel::update($data);

        // 返回操作结果
        return json(['msg' => '更新成功']);
    }

    //校对人员质量评估 单条删除
    public function delete($id)
    {
        // 调用模型删除
        TjQaReviserModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    //校对人员质量评估 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            TjQaReviserModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

}
