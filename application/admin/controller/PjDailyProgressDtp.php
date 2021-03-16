<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\PjContractReview as PjContractReviewModel;
use app\facade\PjProjectProfile as PjProjectProfileModel;
use app\facade\PjDailyProgressDtp as PjDailyProgressDtpModel;
use think\Controller;
use think\Request;
use think\Db;

// 每日进度（排版） 控制器
class PjDailyProgressDtp extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_daily_progress_dtp');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',10)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = PjDailyProgressDtpModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_daily_progress_dtp');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 文件编码
        $file_code = PjContractReviewModel::field('id, Filing_Code')
            ->order('id desc')->limit(30000)->select();
			
		// 文件类型
		$File_Type = Db::name('xt_dict')->where('c_id',4)->select();
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 排版难度
		$pb = Db::name('xt_dict')->where('c_id',7)->select();

        // 工作内容 下拉选项
        $Work_Content = Db::name('xt_dict')->where('c_id',13)->select();

        // 直接返回视图
        return view('form-daily_progress_dtp', [
            'file_code'=>$file_code, 'File_Type'=>$File_Type,
            'yy'=>$yy, 'pb'=>$pb, 'Work_Content'=>$Work_Content
        ]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PjDailyProgressDtpModel::get($id);
		
		// 文件类型
		$File_Type = Db::name('xt_dict')->where('c_id',4)->select();
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 排版难度
		$pb = Db::name('xt_dict')->where('c_id',7)->select();
		
		// 工作内容 下拉选项
		$Work_Content = Db::name('xt_dict')->where('c_id',13)->select();

        return view('form-daily_progress_dtp-view', [
            'info'=>$res, 'File_Type'=>$File_Type, 'yy'=>$yy,
            'pb'=>$pb, 'Work_Content'=>$Work_Content
        ]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 计算实际用时
        $s = strtotime($data['Start_Time']);
        $e = strtotime($data['End_Time']);

        $z = strtotime($data['Work_Date']. ' 12:00');

        $timediff = $e - $s;
        $remain = $timediff%86400;
        $hours = round($remain/3600, 2); // 保留2位小数

        // 写入实际工作小时(中午休息一小时)
        if($s < $z && $e > $z){
            $data['Actual_Work_Time'] = $hours - 1;
        }else{
            $data['Actual_Work_Time'] = $hours;
        }

        // 计算效率  完成页码/实际工作时间    保留2位小数
        if($hours != '' or 0){

            $data['Productivity'] = round($data['Number_of_Pages_Completed']/$data['Actual_Work_Time'],2);

        }else{
            $data['Productivity'] = 0;
        }

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        PjDailyProgressDtpModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 计算实际用时
        $s = strtotime($data['Start_Time']);
        $e = strtotime($data['End_Time']);

        // 中午休息 时间点
        $z = strtotime($data['Work_Date']. ' 12:00');

        $timediff = $e - $s;
        $remain = $timediff%86400;
        $hours = round($remain/3600, 2); // 保留2位小数

        // 写入实际工作小时(中午休息一小时)
        if($s < $z && $e > $z){
            $data['Actual_Work_Time'] = $hours - 1;
        }else{
            $data['Actual_Work_Time'] = $hours;
        }

        // 计算效率  完成页码/实际工作时间    保留2位小数
        if($hours != '' or 0){ // 分母不能为0

            $data['Productivity'] = round($data['Number_of_Pages_Completed']/$data['Actual_Work_Time'],2);

        }else{
            $data['Productivity'] = 0;
        }

        PjDailyProgressDtpModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除(防止大量重复数据、使用真实删除)
    public function delete($id)
    {
        // 调用模型删除
        PjDailyProgressDtpModel::destroy($id, true);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 根据 文件编码 查询 拆分后的 文件名
    public function get_job_name($code)
    {
        $job_name = PjProjectProfileModel::where('Filing_Code', $code)
            ->field('Job_Name')->order('id desc')->select();

        // 返回值
        return json(['data'=>$job_name]);
    }

    // 根据 文件编码、文件名称 获取相关信息
    public function get_info($code, $name)
    {
        $info = PjProjectProfileModel::where('Filing_Code', $code)
            ->field('Company_Name, File_Type, Language, Format_Difficulty')
            ->where('Job_Name', $name)->find();

        // 返回值
        return json(['data'=>$info]);
    }

}