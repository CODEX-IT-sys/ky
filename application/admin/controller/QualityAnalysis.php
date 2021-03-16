<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Db;

// 质量分析 统计 控制器
class QualityAnalysis extends Controller
{

    /*
     * 质量分析 （翻译评估表）      （允许范围 最近三年、四个季度、12个月）
     * @param   string            $type           时间类型（M：月份 Q：季度 Y：年份）
     * @param   string            $time           时间值（如：202006、Q1、2020）
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\Exception
     * */
    public function index(Request $request, $type = '', $time = '', $limit = 50)
    {

        // 前年
        $f_year = date("Y", strtotime("-2 year"));
        // 去年
        $s_year = date("Y", strtotime("-1 year"));
        // 今年
        $year = date('Y'); $arr = [];

        // 查询条件 判断
        if($type == ''){
            // 为空时 默认当前 年月
            $type = 'M';
            $time = date('m');

            $s = intval(date('Ym')  . '01');
            $d = intval(date('Ym')  . '31');
        }else{

            // 判断时间类型
            switch ($type) {
                case 'M':
                    //echo 'M';
                    $s = intval(date('Y') . $time . '01');
                    $d = intval(date('Y') . $time . '31');
                    break;

                case 'Q':
                    //echo 'Q';
                    // 判断季度
                    switch ($time) {
                        case 'Q1':
                            $s = intval(date('Y') . '0101');
                            $d = intval(date('Y') . '0331');
                            break;
                        case 'Q2':
                            $s = intval(date('Y') . '0401');
                            $d = intval(date('Y') . '0631');
                            break;
                        case 'Q3':
                            $s = intval(date('Y') . '0701');
                            $d = intval(date('Y') . '0931');
                            break;
                        case 'Q4':
                            $s = intval(date('Y') . '1001');
                            $d = intval(date('Y') . '1231');
                            break;
                    }
                    break;

                case 'Y':
                    //echo 'Y';
                    $s = intval($time . '0101');
                    $d = intval($time . '1231');
                    break;
            }
        }

        // 格式时间转 时间戳
        $s = strtotime($s);
        $d = strtotime($d);


        // 翻译评估表   (不分人员统计总体情况、限定时间段)
        $fy = Db::name('pj_translation_evaluation')
            ->whereBetweenTime('create_time', $s, $d)
            ->where('delete_time',0)
            ->paginate($limit);


        // 评价字段 数组 (作为查询条件)
        $f = ['Omission','Extra_Translation','Understanding','Typo_or_Data_Error',
            'Inconsistent_within_the_File','Inconsistent_with_Other_Translators',
            'Mistranslation','Incorrect_Punctuation','Inconsistent_with_Target_Language_Features',
            'Grammar_Mistakes','Sentence_Quality','Refer_to_the_References',
            'Refer_to_the_References','Corrected_Problems_Reoccur'];
        $fl = count($f);

        // 评价等级 数组
        $p = ['A','B','C','D'];
        $pl = count($p);

        // 不参与计数的评价(空和未知)
        $no = ['N/A',''];

        // 遍历查询 各评价字段 有多少个
        for($m = 0; $m < $fl; $m++) {

            //for ($n = 0; $n < $pl; $n++) {

                $arr[$f[$m]] = Db::name('pj_translation_evaluation')
                    ->whereBetweenTime('create_time', $s, $d)
                    ->where('delete_time',0)
                    ->where($f[$m], 'not in', $no)
                    ->count("$f[$m]");
            //}
        }
        //dump($arr);

        // 总评价数 是 表格数据条数
        if(empty($fy)){
            $total_num = 0;
        }else{
            $total_num = $fy->total();
        }

        // 比例值
        $bl = [];

        // 计算各评价所占百分比 分母不能为0
        for($i = 0; $i < $fl; $i++) {

            if($total_num == 0){

                $bl[$f[$i]] = 0;

            }else{

                $bl[$f[$i]] = round(($arr[$f[$i]]/$total_num) *100 , 2) . '%';
            }
        }
        //halt($bl);




        /*第四、五行的数据*/
        // 严重评价数 及 比例

        // 新入职评价数 及 比例




        /*按格式组装返回数据*/
        // 第一列 总数
        $arr['Total_Comments'] = $total_num;
        $bl['Total_Comments'] = '';

        // 各评价 字段数量
        $data[0] = $arr;

        // 各评价 百分比
        $data[1] = $bl;

        $a['code'] = 0;
        $a['msg'] = '成功';
        $a['data'] = $data;
        //halt($a);

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', ['type'=>$type, 'time'=>$time, 'f_year'=>$f_year, 's_year'=>$s_year, 'year'=>$year]);
        }

        // 返回接口数据
        return json($a);
    }

}