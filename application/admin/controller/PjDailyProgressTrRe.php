<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\PjContractReview as PjContractReviewModel;
use app\facade\PjProjectProfile as PjProjectProfileModel;
use app\facade\PjDailyProgressTrRe as PjDailyProgressTrReModel;
use think\Controller;
use think\Request;
use think\Db;

// 每日进度（翻译/校对） 控制器
class PjDailyProgressTrRe extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_daily_progress_tr_re');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',9)->value('intro');
        if($request->has('search_type')){
            $data= $request->only(['search_type']);
            $search_type=$data ["search_type"];
        }
        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword,
                'search_type'=>$search_type
            ]);
        }

        // 调用模型获取列表
        $list = PjDailyProgressTrReModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_pj_daily_progress_tr_re');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 文件编码
        $file_code = PjContractReviewModel::field('Filing_Code')
            ->order('id desc')->limit(30000)->select();

        // 职位
        $job_id = session('administrator')['job_id'];

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 工作内容 下拉选项
        $Work_Content = Db::name('xt_dict')->where('c_id',12)->select();

        // 翻译难度
        $fy = Db::name('xt_dict')->where('c_id',8)->select();

        // 直接返回视图
        return view('form-daily_progress_tr_re', [
            'file_code'=>$file_code, 'yy'=>$yy,  'fy'=>$fy, 'Work_Content'=>$Work_Content, 'job_id'=>$job_id
        ]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PjDailyProgressTrReModel::get($id);

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 工作内容 下拉选项
        $Work_Content = Db::name('xt_dict')->where('c_id',12)->select();

        // 翻译难度
        $fy = Db::name('xt_dict')->where('c_id',8)->select();

        return view('form-daily_progress_tr_re-view', [
            'info'=>$res, 'yy'=>$yy,  'fy'=>$fy, 'Work_Content'=>$Work_Content
        ]);
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();
        $admin=$this->userinfo();
        //如果不是翻译,排版.完成页数为0
        if($data['Work_Content']!='Revise'&&$data['Work_Content']!='Translate'&&$data['Work_Content']!='RE (Sampling)'&&$data['Work_Content']!='RE (Highlight)'&&$data['Work_Content']!='RE (Sampling_Highlight)'){
            $data['Number_of_Pages_Completed']=0;
        };
        //计算项目描述表中的文件编号的页数
        $xmms=Db::name('pj_project_profile')->where('Filing_Code',$data['Filing_Code'])->where('Job_Name',$data['Job_Name'])->value('Pages');
        //计算改文件的页数和
         $ysh   =Db::name('pj_daily_progress_tr_re')->where('Filing_Code',$data['Filing_Code'])->where('Job_Name',$data['Job_Name'])->where('Filled_by',$admin['name'])
             ->where('Work_Content',$data['Work_Content'])->sum('Number_of_Pages_Completed');

         if($ysh+$data['Number_of_Pages_Completed']>$xmms){

          return $this->error('该文件完成页数和和超过项目描述页数');
        }




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

        // 计算效率  中文总字数/实际工作时间   保留2位小数
        if($hours != '' or 0){

            // 进度100% 计算总效率
            if($data['Percentage_Completed'] == 100){

                // 查 所有该文件 用时
                $f_time = PjDailyProgressTrReModel::where('Filing_Code',$data['Filing_Code'])
                    ->where('Name_of_Translator_or_Reviser', $data['Name_of_Translator_or_Reviser'])
                    ->where('Job_Name', $data['Job_Name'])->sum('Actual_Work_Time');

                $total_time = $f_time + $data['Actual_Work_Time'];

                $data['Productivity'] = round($data['Total_Chinese_Characters']/$total_time,2);

            }else{

                $data['Productivity'] = round($data['Total_Chinese_Characters']/$data['Actual_Work_Time'],2);
            }

        }else{
            $data['Productivity'] = 0;
        }

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        PjDailyProgressTrReModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        $admin=$this->userinfo();
        //如果不是翻译,排版.完成页数为0
        if($data['Work_Content']!='Revise'&&$data['Work_Content']!='Translate'&&$data['Work_Content']!='RE (Sampling)'&&$data['Work_Content']!='RE (Highlight)'&&$data['Work_Content']!='RE (Sampling_Highlight)'){
            $data['Number_of_Pages_Completed']=0;
        };
        //计算项目描述表中的文件编号的页数
        $xmms=Db::name('pj_project_profile')->where('Filing_Code',$data['Filing_Code'])->where('Job_Name',$data['Job_Name'])->value('Pages');
        //去除正在修改的页数
        $page=Db::name('pj_daily_progress_tr_re')->where('id',$data['id'])->value('Number_of_Pages_Completed');
//        dump($page);die;
        //计算改文件的页数和
        $ysh   =Db::name('pj_daily_progress_tr_re')->where('Filing_Code',$data['Filing_Code'])->where('Job_Name',$data['Job_Name'])->where('Filled_by',$admin['name'])
            ->where('Work_Content',$data['Work_Content'])->sum('Number_of_Pages_Completed');

        if($ysh+$data['Number_of_Pages_Completed']-$page>$xmms){
            return $this->error('该文件完成页数和和超过项目描述页数');
        }
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


        $data['Productivity']=0;
//        dump($data);
        PjDailyProgressTrReModel::update($data);
        // 计算效率  总字数/实际工作时间    保留2位小数(这里写的修改时还没有参与计算!)
        if($hours != '' or 0){
            // 进度100% 计算总效率
            if($data['Percentage_Completed'] == 100){

                $f_time = 0;

                // 计算 所有该文件 用时
                if($data['Category'] == 'TR'){

                    $f_time = PjDailyProgressTrReModel::where('Filing_Code',$data['Filing_Code'])
                        ->where('Name_of_Translator_or_Reviser', $data['Name_of_Translator_or_Reviser'])
                        ->where('Job_Name', $data['Job_Name'])
                        ->where('Category', 'TR')
                        ->where('Work_Content', 'Translate')
                        ->sum('Actual_Work_Time');
                }
                if($data['Category'] == 'RE'){

                    $f_time = PjDailyProgressTrReModel::where('Filing_Code',$data['Filing_Code'])
                        ->where('Name_of_Translator_or_Reviser', $data['Name_of_Translator_or_Reviser'])
                        ->where('Job_Name', $data['Job_Name'])
                        ->where('Category', 'RE')
                        ->where('Work_Content', 'Revise')
                        ->sum('Actual_Work_Time');
                }

                // 查询 之前这条记录用时
                $old_time = PjDailyProgressTrReModel::where('id', $data['id'])->value('Actual_Work_Time');


                $total_time = $f_time + $data['Actual_Work_Time'] - $old_time;
                if($total_time > 0){
                    $data['Productivity'] = round($data['Total_Chinese_Characters']/$total_time,2);
                }else{
                    $data['Productivity'] = 0;
                }
            }else{

                $data['Productivity'] = round($data['Total_Chinese_Characters']/$data['Actual_Work_Time'],2);
            }

        }else{
            $data['Productivity'] = 0;
        }

//        die;
        PjDailyProgressTrReModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 删除(防止大量重复数据、使用真实删除)
    public function delete($id)
    {
        // 调用模型删除
        PjDailyProgressTrReModel::destroy($id, true);

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
            ->field('Company_Name, Language, Translation_Difficulty, Total_Repetition_Rate, Excluding_Words')
            ->where('Job_Name', $name)->find();

        // 返回值
        return json(['data'=>$info]);
    }

    public function Batch_edit(Request $request)
    {

        try {
            $data=$request->param();
            $res = Db::name('pj_daily_progress_tr_re')->wherein('id',$data['arr'])->update([$data['field']=>$data['numsss']]);
        } catch (ValidateException $e) {
            // 这是进行验证异常捕获
            return json($e->getError());
        } catch (\Exception $e) {
            // 这是进行异常捕获
            return json(['code'=>9999,'error'=>$e->getMessage()]);
        }

        return json(['code'=>$res]);
    }
}