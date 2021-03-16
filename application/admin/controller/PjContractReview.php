<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\common\model\Admin;
use app\facade\PjContractReview as PjContractReviewModel;
use think\Controller;
use think\Request;
use think\Db;

// 项目汇总 控制器
class PjContractReview extends Common
{
    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_contract_review');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',6)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = PjContractReviewModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_contract_review');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 编号值(去重)
        $file_code = Db::name('mk_feseability')->alias('f')
            ->join('ky_pj_contract_review c', 'f.Filing_Code = c.Filing_Code', 'left')
            ->field('f.Filing_Code')
            ->where('c.Filing_Code', null)
            ->order('f.id desc')
            ->limit(30000)->select();

        // N/A 选项
        $na = [['value'=>0, 'name'=>'N/A']];

		// 文件类型
		$File_Type = Db::name('xt_dict')->where('c_id',4)->select();
		
		// 文件分类
		$document_type = dict(6);
        $document_type = array_merge($document_type, $na);
		
		// 服务类型
		$service_type = dict(5);
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 排版难度
		$pb = Db::name('xt_dict')->where('c_id',7)->select();
		
		// 翻译难度
		$fy = Db::name('xt_dict')->where('c_id',8)->select();

        // 是否首次合作
        $first = Db::name('xt_dict')->where('c_id',9)->select();

        // 质量要求
        $zl = Db::name('xt_dict')->where('c_id',10)->select();

        // 销售
        $sales = Admin::field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();


        /*人员选项*/

        // 翻译
        $tr = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6,19])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $tr = array_merge($tr, $na);

        // 校对
        $re = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $re = array_merge($re, $na);

        // 预排
        $yp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $yp = array_merge($yp, $na);

        // 后排
        $hp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $hp = array_merge($hp, $na);

        // 项目助理
        $pa = Admin::field('name')->where(['job_id'=> 7, 'status'=> 0])->select();

        // 项目经理
        $pm = Admin::field('name')->where(['job_id'=> 8, 'status'=> 0])->select();

        // 直接返回视图
        return view('form-contract_review', [
            'file_code'=>$file_code, 'File_Type'=>$File_Type, 'document_type'=>json_encode($document_type),
            'service_type'=>json_encode($service_type), 'pa'=>$pa, 'pm'=>$pm,
            'yy'=>$yy, 'pb'=>$pb, 'fy'=>$fy, 'first'=>$first, 'zl'=>$zl, 'sales'=>$sales,
            'tr'=>json_encode($tr), 're'=>json_encode($re), 'yp'=>json_encode($yp), 'hp'=>json_encode($hp)
        ]);
    }

    // 查看
    public function read($id)
    {
        // 查询信息
        $res = PjContractReviewModel::get($id);

        $fc_arr = explode(',', $res['File_Category']);

        $fw_arr = explode(',', $res['Service']);
        $tr_arr = explode(',', $res['Translator']);
        $re_arr = explode(',', $res['Reviser']);
        $yp_arr = explode(',', $res['Pre_Formatter']);
        $hp_arr = explode(',', $res['Post_Formatter']);

        // N/A 选项
        $na = [['value'=>0, 'name'=>'N/A']];

        // 文件类型
        $File_Type = Db::name('xt_dict')->where('c_id',4)->select();

        // 文件分类
        $document_type = dict(6);
        $document_type = array_merge($document_type, $na);
        foreach ($document_type as $k => $v){
            if(in_array($v['name'],$fc_arr)){
                $document_type[$k]['selected'] = true;
            }
        }

        // 服务类型
        $service_type = dict(5, $fw_arr);

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 排版难度
        $pb = Db::name('xt_dict')->where('c_id',7)->select();

        // 翻译难度
        $fy = Db::name('xt_dict')->where('c_id',8)->select();

        // 是否首次合作
        $first = Db::name('xt_dict')->where('c_id',9)->select();

        // 质量要求
        $zl = Db::name('xt_dict')->where('c_id',10)->select();

        // 销售
        $sales = Db::name('admin')->field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();



        // 翻译
        $tr = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6,19])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $tr = array_merge($tr, $na);
        foreach ($tr as $k => $v){
            if(in_array($v['name'],$tr_arr)){
                $tr[$k]['selected'] = true;
            }
        }

        // 校对
        $re = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $re = array_merge($re, $na);
        foreach ($re as $k => $v){
            if(in_array($v['name'],$re_arr)){
                $re[$k]['selected'] = true;
            }
        }

        // 预排
        $yp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $yp = array_merge($yp, $na);
        foreach ($yp as $k => $v){
            if(in_array($v['name'],$yp_arr)){
                $yp[$k]['selected'] = true;
            }
        }

        // 后排
        $hp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $hp = array_merge($hp, $na);
        foreach ($hp as $k => $v){
            if(in_array($v['name'],$hp_arr)){
                $hp[$k]['selected'] = true;
            }
        }

        // 项目助理
        $pa = Admin::field('name')->where(['job_id'=> 7, 'status'=> 0])->select();

        // 项目经理
        $pm = Admin::field('name')->where(['job_id'=> 8, 'status'=> 0])->select();

        // 直接返回视图
        return view('form-contract_review-view',[
            'File_Type'=>$File_Type, 'document_type'=>json_encode($document_type), 'service_type'=>json_encode($service_type),
            'info'=>$res, 'yy'=>$yy, 'pb'=>$pb, 'fy'=>$fy, 'first'=>$first, 'zl'=>$zl, 'sales'=>$sales, 'pm'=>$pm,
            'tr'=>json_encode($tr), 're'=>json_encode($re), 'yp'=>json_encode($yp), 'hp'=>json_encode($hp), 'pa'=>$pa
        ]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PjContractReviewModel::get($id);

        $fc_arr = explode(',', $res['File_Category']);

        $fw_arr = explode(',', $res['Service']);
        $tr_arr = explode(',', $res['Translator']);
        $re_arr = explode(',', $res['Reviser']);
        $yp_arr = explode(',', $res['Pre_Formatter']);
        $hp_arr = explode(',', $res['Post_Formatter']);

        // N/A 选项
        $na = [['value'=>0, 'name'=>'N/A']];

        // 文件类型
        $File_Type = Db::name('xt_dict')->where('c_id',4)->select();

        // 文件分类
        $document_type = dict(6);
        $document_type = array_merge($document_type, $na);
        foreach ($document_type as $k => $v){
            if(in_array($v['name'],$fc_arr)){
                $document_type[$k]['selected'] = true;
            }
        }
		
		// 服务类型
		$service_type = dict(5, $fw_arr);
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 排版难度
		$pb = Db::name('xt_dict')->where('c_id',7)->select();
		
		// 翻译难度
		$fy = Db::name('xt_dict')->where('c_id',8)->select();

        // 是否首次合作
        $first = Db::name('xt_dict')->where('c_id',9)->select();

        // 质量要求
        $zl = Db::name('xt_dict')->where('c_id',10)->select();

        // 销售
        $sales = Db::name('admin')->field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();



        // 翻译
        $tr = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6,19])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $tr = array_merge($tr, $na);
        foreach ($tr as $k => $v){
            if(in_array($v['name'],$tr_arr)){
                $tr[$k]['selected'] = true;
            }
        }

        // 校对
        $re = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [10,11,8,4,15,6])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $re = array_merge($re, $na);
        foreach ($re as $k => $v){
            if(in_array($v['name'],$re_arr)){
                $re[$k]['selected'] = true;
            }
        }

        // 预排
        $yp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $yp = array_merge($yp, $na);
        foreach ($yp as $k => $v){
            if(in_array($v['name'],$yp_arr)){
                $yp[$k]['selected'] = true;
            }
        }

        // 后排
        $hp = Db::name('admin')->field('id as value, name')->where('job_id', 'in', [19,12,13,5])
            ->where(['status'=> 0, 'delete_time'=>0])->select();
        $hp = array_merge($hp, $na);
        foreach ($hp as $k => $v){
            if(in_array($v['name'],$hp_arr)){
                $hp[$k]['selected'] = true;
            }
        }

        // 项目助理
        $pa = Admin::field('name')->where('job_id', 7)->where('status', 0)->select();

        // 项目经理
        $pm = Admin::field('name')->where('job_id', 8)->where('status', 0)->select();

        return view('form-contract_review-view', [
            'File_Type'=>$File_Type, 'document_type'=>json_encode($document_type), 'service_type'=>json_encode($service_type),
            'info'=>$res, 'yy'=>$yy, 'pb'=>$pb, 'fy'=>$fy, 'first'=>$first, 'zl'=>$zl, 'sales'=>$sales, 'pm'=>$pm,
            'tr'=>json_encode($tr), 're'=>json_encode($re), 'yp'=>json_encode($yp), 'hp'=>json_encode($hp), 'pa'=>$pa
        ]);
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];
        // 文件创建时间
        $data['Date'] = substr($data['Filing_Code'], 2, 8);

        // 保存
        PjContractReviewModel::create($data);

        // 同步更新 项目数据库表 相关信息
        $f = ['Translator','Reviser','Pre_Formatter','Post_Formatter',
            'Completed','Delivered_or_Not', 'File_Category', 'PA'];

        $db_data = [];
        foreach ($data as $k => $v){
            if(in_array($k, $f)){
                $db_data[$k] = $v;
            }
        }

        Db::name('pj_project_database')
            ->where('Filing_Code', $data['Filing_Code'])
            ->update($db_data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        PjContractReviewModel::update($data);

        // 同步更新 项目数据库表 相关信息
        $d = ['Translator','Reviser','Pre_Formatter','Post_Formatter',
            'Completed','Delivered_or_Not','File_Category', 'PA'];

        foreach ($data as $k => $v){
            if(in_array($k, $d)){
                $db_data[$k] = $v;
            }
        }

        Db::name('pj_project_database')
            ->where('Filing_Code', $data['Filing_Code'])
            ->update($db_data);


        // 同步更新 项目描述表
        $f = ['Pre_Formatter','Translator','Reviser','Post_Formatter',
            'Pre_Format_Delivery_Time','Translation_Delivery_Time',
            'Revision_Delivery_Time','Post_Format_Delivery_Time'];

        foreach ($data as $k => $v){
            if(in_array($k, $f)){
                $f_data[$k] = $v;
            }
        }

        Db::name('pj_project_profile')
            ->where('Filing_Code', $data['Filing_Code'])
            ->update($f_data);


        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除
    public function delete($id)
    {
        // 调用模型删除
        PjContractReviewModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
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

        }else{  // 改变数据状态

            foreach ($id_arr as $k => $v) {

                Db::name('pj_contract_review')->where('id', $v)
                    ->update(['Approval_Project_Manager' => 'Yes']);
            }

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 总经理 批量确认
    public function batch_gm($id)
    {
        $id_arr = explode(',' , $id);

        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 9){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{  // 改变数据状态

            foreach ($id_arr as $k => $v) {

                Db::name('pj_contract_review')->where('id', $v)
                    ->update(['Approval_General_Manager' => 'Yes']);
            }

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }


    // 项目经理 确认
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

        }else{// 改变数据状态
            Db::name('pj_contract_review')->where('id',$id)
                ->update(['Approval_Project_Manager'=>'Yes']);

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 总经理 确认
    public function general_manager($id)
    {
        // 用户id
        $uid = session('administrator')['id'];

        // 查询用户身份
        $job_id = Db::name('admin')->where('id',$uid)->value('job_id');

        // 检查身份信息是否匹配
        if($job_id != 9){

            // 返回数据
            return json(['msg' => '身份不匹配,操作失败']);

        }else{// 改变数据状态
            Db::name('pj_contract_review')->where('id',$id)
                ->update(['Approval_General_Manager'=>'Yes']);

            // 返回数据
            return json(['msg' => '操作成功']);
        }
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = Db::name('mk_feseability')
            ->where('Filing_Code', $code)->find();

        $fw_arr = explode(',', $info['Service']);

        // 服务类型
        $service = dict(5, $fw_arr);

        // 返回值
        return json(['data'=>$info, 'fw'=>json_encode($service)]);
    }
}