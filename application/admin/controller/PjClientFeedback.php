<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\PjProjectRelease as PjProjectReleaseModel;
use app\facade\PjClientFeedback as PjClientFeedbackModel;
use think\Controller;
use think\Request;
use think\Db;

// 客户反馈 控制器
class PjClientFeedback extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_client_feedback');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',16)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = PjClientFeedbackModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_client_feedback');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 文件编码
        $file_code = PjProjectReleaseModel::field('Filing_Code')
            ->order('id desc')->limit(30000)->select();

        // 直接返回视图
        return view('form-client_feedback', ['file_code'=>$file_code]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PjClientFeedbackModel::get($id);

        return view('form-client_feedback-view', ['info'=>$res]);
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        PjClientFeedbackModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        PjClientFeedbackModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除
    public function delete($id)
    {
        // 调用模型删除
        PjClientFeedbackModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 质量经理(质控主管) 批准
    public function batch_qa($id)
    {
        $id_arr = explode(',' , $id);

        // 用户id
        $uid = session('administrator')['id'];

        $name = session('administrator')['name'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 6){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{  // 改变数据

            foreach ($id_arr as $k => $v) {

                Db::name('pj_client_feedback')->where('id', $v)
                    ->update(['Quality_Manager' => $name]);
            }

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }


    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = Db::name('pj_contract_review')
            ->where('Filing_Code', $code)
            ->find();

        // 返回值
        return json(['data'=>$info]);
    }
}