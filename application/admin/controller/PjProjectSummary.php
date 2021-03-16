<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\common\model\Admin;
use app\facade\PjProjectProfile as PjProjectProfileModel;
use app\facade\PjProjectProfileText as PjProjectProfileTextModel;
use app\facade\PjProjectSummary as PjProjectSummaryModel;
use think\Controller;
use think\Request;
use think\Db;

// 项目总结 控制器
class PjProjectSummary extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_project_summary');

        // 查询翻译人员 签名
        $sign = Admin::field('id, name, job_id, sign')
            //->where('job_id', 'in', [10,11,8,4,5,15,6,19])
            ->where('job_id', 'in', [10,11,8,4,5,15,6,19,12,13]) //增加了预排版与后排版人员
            ->where('status', 0)->select();

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',14)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'sign' => $sign, 'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword,
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
            ]);
        }

        // 调用模型获取列表
        $list = PjProjectSummaryModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_project_summary');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 项目名称
        $Project_Name = PjProjectProfileTextModel::field('Project_Name')->order('id desc')->select();
			
		// 语种
		$yy = dict(1);
		
        // 直接返回视图
        return view('form-project_summary', ['Project_Name'=>$Project_Name, 'yy'=>json_encode($yy)]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PjProjectSummaryModel::get($id);

        $yy_arr = explode(',', $res['Language']);

        // 语种
        $yy = dict(1, $yy_arr);

        return view('form-project_summary-view', ['info'=>$res, 'yy'=>json_encode($yy)]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        PjProjectSummaryModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新数据
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->put();

        PjProjectSummaryModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除数据
    public function delete($id)
    {
        // 调用模型删除
        PjProjectSummaryModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // (批量) 翻译人员 签名
    public function sign($id, $sign)
    {

        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if(!in_array($job_id, [10,11,8,4,5,15,6,19])) { // 是否为该职位人员

            // 返回数据
            return json(['msg' => '职位不匹配,操作失败']);

        // 是否为 本人操作
        } else if($sign == session('administrator')['name']){

            $id_arr = explode(',', $id);

            // 调用模型删除
            foreach ($id_arr as $k => $v) {

                Db::name('pj_project_summary')->where('id', $v)->update(['sign' => $sign]);
            }

            // 返回数据
            return json(['msg' => '操作成功']);

        }else{
            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);
        }
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = Db::name('pj_project_profile')
            ->field('Language, File_Type, Product_Involved')
            ->where('Project_Name', $code)->find();

        // 返回值
        return json(['data'=>$info]);
    }

    // 验证 相同文件是否已存在
    public function check_data($code, $name)
    {
        $res = PjProjectSummaryModel::where(['Job_Name'=>$code])->find();

        $l = session('language');

        if($l == '中文'){
            $msg = '数据已存在';
        }else{
            $msg = 'Date already exists';
        }

        if(!empty($res)){
            return json(['code'=>0, 'msg'=>$msg]);
        }else{
            return json(['code'=>1]);
        }
    }
}