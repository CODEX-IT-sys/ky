<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\PjContractReview as PjContractReviewModel;
use app\facade\PjProjectRelease as PjProjectReleaseModel;
use think\Controller;
use think\Request;
use think\Db;

// 项目放行 控制器
class PjProjectRelease extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_project_release');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',15)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = PjProjectReleaseModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_project_release');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页（项目描述里指定校对人员、翻译人员才能读写）
    public function create()
    {
        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if(!in_array($job_id,[1,4,6,8,9,10,11,15,20])){
            $this->error('身份不匹配,无权操作');
        }

        // 查询 可供预选的 文件编码
        $file_code = PjContractReviewModel::field('Filing_Code')
            ->order('id desc')->limit(20000)->select();

        // 直接返回视图
        return view('form-pj_project_release', ['file_code'=>$file_code]);
    }

    //编辑视图 （项目描述里指定校对人员、翻译人员才能读写）
    public function edit($id)
    {
        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 查询信息
        $res = PjProjectReleaseModel::get($id);

        // 检查身份信息是否匹配
        if(in_array($job_id,[1,4,6,8,9,10,11,15,20])){
            // 返回视图
            return view('form-pj_project_release-view', ['info'=>$res]);
        }else{
            // 返回提示
            $this->error('身份不匹配,无权操作');
        }
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        PjProjectReleaseModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        PjProjectReleaseModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除
    public function delete($id)
    {
        // 调用模型删除
        PjProjectReleaseModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 校对 批量确认
    public function batch_jd($id)
    {
        $id_arr = explode(',' , $id);

        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if(!in_array($job_id, [1,4,6,8,9,10,11,15,20])){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{
            // 改变数据状态
            foreach ($id_arr as $k => $v) {
                Db::name('pj_project_release')->where('id', $v)
                    ->update(['Reviser' => 'Yes']);
            }

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 项目经理 批量确认
    public function batch_pm($id)
    {
        $id_arr = explode(',' , $id);

        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 8){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{
            // 改变数据状态
            foreach ($id_arr as $k => $v) {
                Db::name('pj_project_release')->where('id', $v)
                    ->update(['Project_Manager' => 'Yes']);
            }

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 校对人员 批准
    public function reviser($id)
    {
        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 11){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{// 改变数据状态
            Db::name('pj_project_release')->where('id',$id)
                ->update(['Reviser'=>'Yes']);

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 项目经理 批准
    public function project_manager($id)
    {
        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 8){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{
            // 改变数据状态
            Db::name('pj_project_release')->where('id',$id)
                ->update(['Project_Manager'=>'Yes']);

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = Db::name('pj_contract_review')
            ->field('Job_Name, Reviser')
            ->where('Filing_Code', $code)
            ->find();

        // 返回值
        return json(['data'=>$info]);
    }

    // 验证 相同文件是否已存在
    public function check_data($code, $name)
    {
        $res = PjProjectReleaseModel::where(['Filing_Code'=>$code, 'Job_Name'=>$name])->find();

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