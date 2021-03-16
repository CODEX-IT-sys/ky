<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 工作绩效统计 控制器
class PerformanceTable extends Controller
{
    /*
     * 工作绩效统计                （允许范围 最近三年、四个季度、12个月）
     * @param   string            $type           时间类型（M：月份 Q：季度 Y：年份）
     * @param   string            $time           时间值（如：202006、Q1、2020）
     * @param   int               $job            人员类别
     * @param   string            $keyword        搜索关键词
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\Exception
     * */
    public function index(Request $request, $type = '', $time = '', $job = 0, $keyword = '', $limit = 50)
    {
        // 前年
        $f_year = date("Y", strtotime("-2 year"));
        // 去年
        $s_year = date("Y", strtotime("-1 year"));
        // 今年
        $year = date('Y'); $jx = []; $fy_arr = [];

        $s = ''; $d = '';

        // 查询条件 判断
        if($type == ''){
            // 为空时 默认当前 年月
            $type = 'M';
            $time = date('m');

            $s = intval(date('Ym')  . '01');
            //$d = intval(date('Ym')  . '31');
        }else{
            // 判断时间类型
            switch ($type) {
                case 'M':
                    $s = intval(date('Y') . $time . '01');
                    //$d = intval(date('Y') . $time . '31');
                    break;

                case 'Q':
                    // 判断季度
                    switch ($time) {
                        case 'Q1':
                            $s = intval(date('Y') . '0101');
                            //$d = intval(date('Y') . '0331');
                            break;
                        case 'Q2':
                            $s = intval(date('Y') . '0401');
                            //$d = intval(date('Y') . '0631');
                            break;
                        case 'Q3':
                            $s = intval(date('Y') . '0701');
                            //$d = intval(date('Y') . '0931');
                            break;
                        case 'Q4':
                            $s = intval(date('Y') . '1001');
                            //$d = intval(date('Y') . '1231');
                            break;
                    }
                    break;
                case 'Y':
                    //$s = intval($time . '0101');
                    //$d = intval($time . '1231');
                    if( isset(explode('-',$time)[1]) ){ //选择了月份
                        $s = intval(explode('-',$time)[0].explode('-',$time)[1].'01');
                        //$d = intval(date('Ymd', strtotime("$s +1 month -1 day")));


                    }else{ //整年
                        $s = intval($time . '0101');
                        //$d = intval($time . '1231');
                    }
                    break;
            }
        }


        $d = intval(date('Ymd', strtotime("$s +1 month -1 day")));//获取月份结束精确到年月日

        if ($job == 1){ // 翻译
            $job_arr = [10];
        }elseif ($job == 2){ // 校对
            $job_arr = [4,15,11];
        }elseif ($job == 3){ // 排版
            $job_arr = [12,13,5];
        }else{ // 默认全部
            $job_arr = [4,5,10,11,12,13,15,19];
        }

        // 翻译、校对 人员信息列表
        $fy_arr = Db::name('admin')->alias('a')
            ->join('xt_department d', 'a.department_id = d.id')
            ->field('a.job_id, a.name, d.cn_name, a.First_language')
            ->where('a.job_id', 'in', $job_arr)
            ->where('a.delete_time',0)
            ->paginate($limit);


        //dump($fy_arr);

        /*
         * 工作内容   非/本职语种
         * 校对       校对
         * 翻译       翻译
         *
         * // 查询 总字数 工作时间
         * // 计算效率（效率 = 总字数 / 工作时间）
         * */
        foreach ($fy_arr as $k => $v)
        {

            $jx[$v['name']]['tr_time'] = Db::name('pj_daily_progress_tr_re')
                //->field('SUM(Actual_Work_Time) time')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('Category', 'TR')
                ->where('Work_Content', 'like','tr%')
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Actual_Work_Time');

            $jx[$v['name']]['re_time'] = Db::name('pj_daily_progress_tr_re')
                //->field('SUM(Actual_Work_Time) time')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('Category', 'RE')
                ->where('Work_Content', 'like','re%')
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Actual_Work_Time');


            if(in_array($v['job_id'], [5,12,13,19])){

                $jx[$v['name']]['Pages'] = Db::name('pj_daily_progress_dtp')
                    //->field('Work_Date,SUM(Number_of_Pages_Completed) Pages')
                    ->where('Name_of_Formatter',$v['name'])
                    ->where('delete_time',0)
                    ->whereBetweenTime('Work_Date', $s, $d)
                    //->order('Work_Date desc')
                    ->group('Name_of_Formatter')
                    ->sum('Number_of_Pages_Completed');

            }else{

                $jx[$v['name']]['Pages'] = Db::name('pj_daily_progress_tr_re')
                    //->field('Work_Date,SUM(Number_of_Pages_Completed) Pages')
                    ->where('Name_of_Translator_or_Reviser',$v['name'])
                    ->where('delete_time',0)
                    ->whereBetweenTime('Work_Date', $s, $d)
                    //->order('Work_Date desc')
                    ->group('Name_of_Translator_or_Reviser')
                    ->sum('Number_of_Pages_Completed');
            }


            $jx[$v['name']]['Total_Chinese_Characters'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Total_Chinese_Characters) Total_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Total_Chinese_Characters');
                //->select();


            $jx[$v['name']]['Original_Chinese_Characters'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Original_Chinese_Characters) Original_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Original_Chinese_Characters');
                //->select();



            // 校对 本职语种
            $jx[$v['name']]['re']['b'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Total_Chinese_Characters) Total_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->where('Category', 'RE')
                ->where('Work_Content', 'like','re%')
                ->where('Language', 'in', explode(',', $v['First_language']))
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Total_Chinese_Characters');
                //->select();

            // 校对 非本职语种
            $jx[$v['name']]['re']['o'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Total_Chinese_Characters) Total_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->where('Category', 'RE')
                ->where('Work_Content', 'like','re%')
                ->where('Language', 'not in', explode(',', $v['First_language']))
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Total_Chinese_Characters');
                //->select();



            // 翻译 本职语种
            $jx[$v['name']]['tr']['b'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Total_Chinese_Characters) Total_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->where('Category', 'TR')
                ->where('Work_Content', 'like','tr%')
                ->where('Language', 'in', explode(',', $v['First_language']))
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Total_Chinese_Characters');
                //->select();

            // 翻译 非本职语种
            $jx[$v['name']]['tr']['o'] = Db::name('pj_daily_progress_tr_re')
                //->field('Work_Date,Filing_Code, SUM(Total_Chinese_Characters) Total_Chinese_Characters')
                ->where('Name_of_Translator_or_Reviser',$v['name'])
                ->where('delete_time',0)
                ->whereBetweenTime('Work_Date', $s, $d)
                ->where('Category', 'TR')
                ->where('Work_Content', 'like','tr%')
                ->where('Language', 'not in', explode(',', $v['First_language']))
                //->order('Work_Date desc')
                ->group('Name_of_Translator_or_Reviser')
                ->sum('Total_Chinese_Characters');
                //->select();


            $jx[$v['name']]['tr_time'] = $jx[$v['name']]['tr_time'] ? $jx[$v['name']]['tr_time'] : 0;
            $jx[$v['name']]['re_time'] = $jx[$v['name']]['re_time'] ? $jx[$v['name']]['re_time'] : 0;

            $jx[$v['name']]['time'] = $jx[$v['name']]['tr_time'] + $jx[$v['name']]['re_time'];


            $jx[$v['name']]['Pages'] = $jx[$v['name']]['Pages'] ? $jx[$v['name']]['Pages'] : 0;


            $jx[$v['name']]['Total_Chinese_Characters'] = $jx[$v['name']]['Total_Chinese_Characters']
                ? $jx[$v['name']]['Total_Chinese_Characters'] : 0;

            $jx[$v['name']]['Original_Chinese_Characters'] = $jx[$v['name']]['Original_Chinese_Characters']
                ? $jx[$v['name']]['Original_Chinese_Characters'] : 0;


            /*if($jx[$v['name']]['tr_time'] != 0) {
                $jx[$v['name']]['tr_Productivity'] = round($jx[$v['name']]['Original_Chinese_Characters'] / $jx[$v['name']]['tr_time'], 2);
            }else{
                $jx[$v['name']]['tr_Productivity'] = 0;
            }

            if($jx[$v['name']]['re_time'] != 0) {
                $jx[$v['name']]['re_Productivity'] = round($jx[$v['name']]['Original_Chinese_Characters'] / $jx[$v['name']]['re_time'], 2);
            }else{
                $jx[$v['name']]['re_Productivity'] = 0;
            }*/


            $jx[$v['name']]['re']['b'] = $jx[$v['name']]['re']['b']
                ? $jx[$v['name']]['re']['b']: 0;

            $jx[$v['name']]['re']['o'] = $jx[$v['name']]['re']['o']
                ? $jx[$v['name']]['re']['o']: 0;

            $jx[$v['name']]['tr']['b'] = $jx[$v['name']]['tr']['b']
                ? $jx[$v['name']]['tr']['b']: 0;

            $jx[$v['name']]['tr']['o'] = $jx[$v['name']]['tr']['o']
                ? $jx[$v['name']]['tr']['o']: 0;
        }

        //dump($jx);die;

        $arr = [];

        // 组装数据
        foreach ($fy_arr as $k => $v)
        {
            $arr[$k]['No'] = $k + 1;

            $arr[$k]['Name'] = $v['name'];

            $arr[$k]['Department'] = $v['cn_name'];

            $arr[$k]['First_language'] = $v['First_language']?$v['First_language']:'';

            foreach ($jx as $key => $val)
            {
                if($v['name'] == $key){

                    $arr[$k]['tr_time'] = round($val['tr_time'], 2);

                    $arr[$k]['re_time'] = round($val['re_time'], 2);

                    $arr[$k]['Pages'] = $val['Pages'];

                    $arr[$k]['Actual_total_number_of_words'] = $val['Total_Chinese_Characters'];

                    $arr[$k]['Original_total_number_of_words'] = $val['Original_Chinese_Characters'];


                    $arr[$k]['re']['b'] = $val['re']['b'];
                    $arr[$k]['re']['o'] = $val['re']['o'];
                    $arr[$k]['re']['total'] = round($arr[$k]['re']['b'] + $arr[$k]['re']['o'], 2);

                    $arr[$k]['tr']['b'] = $val['tr']['b'];
                    $arr[$k]['tr']['o'] = $val['tr']['o'];
                    $arr[$k]['tr']['total'] = round($arr[$k]['tr']['b'] + $arr[$k]['tr']['o'], 2);

                    if($arr[$k]['re_time'] != 0){
                        $arr[$k]['re_Productivity'] = round($arr[$k]['re']['total']/ $arr[$k]['re_time'], 2);
                    }else{
                        $arr[$k]['re_Productivity'] = 0;
                    }

                    if($arr[$k]['tr_time'] != 0){
                        $arr[$k]['tr_Productivity'] = round($arr[$k]['tr']['total']/ $arr[$k]['tr_time'], 2);
                    }else{
                        $arr[$k]['tr_Productivity'] = 0;
                    }

                    if($arr[$k]['Actual_total_number_of_words'] != 0){
                        $arr[$k]['Proofreading_proportion'] =
                            round($arr[$k]['re']['total']/$arr[$k]['Actual_total_number_of_words'], 2);
                    }else{
                        $arr[$k]['Proofreading_proportion'] = 0;
                    }

                    if(in_array($v['job_id'], [5,12,13,19])){

                        $dtp_time = Db::name('pj_daily_progress_dtp')
                            //->field('SUM(Actual_Work_Time) time')
                            ->where('Name_of_Formatter',$v['name'])
                            ->where('delete_time',0)
                            ->whereBetweenTime('Work_Date', $s, $d)
                            ->group('Name_of_Formatter')
                            ->sum('Actual_Work_Time');

                        $arr[$k]['Total_Time'] = round($dtp_time, 2);

                    }else{
                        $arr[$k]['Total_Time'] = round($val['tr_time'] + $val['re_time'], 2);
                    }
                }
            }
        }

        //dump($arr);die;


        // 按格式组装 列表数据
        if(empty($arr)){
            $a['count'] = 0;
        }else{
            $a['count'] = $fy_arr->total();
        }
        $a['code'] = 0;
        $a['msg'] = '成功';
        $a['data'] = $arr;
        //$a['sql'] =Db::name('pj_daily_progress_dtp')->getlastsql();

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'type'=>$type, 'time'=>$time, 'keyword'=>$keyword, 'job'=>$job,
                'f_year'=>$f_year, 's_year'=>$s_year, 'year'=>$year
            ]);
        }

        // 返回接口数据
        return json($a);
    }
    /*public function test()
    {
        echo date('Y-m-d H:i:s',1612108800)."<br/>".date('Y-m-d H:i:s',1612108799);

    }*/


}
