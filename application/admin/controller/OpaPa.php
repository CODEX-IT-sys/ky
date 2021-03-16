<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use app\facade\TjOpaPa as TjOpaPaModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 统计报表 项目助理综合考核 控制器
class OpaPa extends Controller
{
    // (手动填写表格)
    public function index(Request $request, $type = '', $time = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_opa_pa');

        // 前年
        $f_year = date("Y", strtotime("-2 year"));
        // 去年
        $s_year = date("Y", strtotime("-1 year"));
        // 今年
        $year = date('Y'); $arr = []; $t_arr = [];
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
                    //echo 'M';
                    $s = intval(date('Y') . $time . '01');
                    //$d = intval(date('Y') . $time . '31');
                    break;

                case 'Q':
                    //echo 'Q';
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
                    //echo 'Y';
                    //$s = intval($time . '0101');
                    //$d = intval($time . '1231');
                    if( isset(explode('-',$time)[1]) ){ //选择了月份
                        $s = intval(explode('-',$time)[0].explode('-',$time)[1].'01');
                        //$d = intval(date('YmdHis', strtotime("$s +1 month -1 second")));

                    }else{ //整年
                        $s = intval($time . '0101');
                        //$d = intval($time . '1231');
                    }
                    break;
            }
        }
        $d = intval(date('YmdHis', strtotime("$s +1 month -1 second")));//获取月份结束精确到年月日时分秒

        // 格式时间转 时间戳
        $s = strtotime($s);
        $d = strtotime($d);

        // 时间戳 转 格式时间
        $s = date('Y-m-d H:i:s', $s);
        $d = date('Y-m-d H:i:s', $d);

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', ['type'=>$type, 'time'=>$time, 'keyword'=>$keyword,
                'f_year'=>$f_year, 's_year'=>$s_year, 'year'=>$year, 'colsData' => json_encode($colsData)]);
        }

        // 调用模型获取列表
        $list = TjOpaPaModel::getList($s, $d, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    //  搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_tj_opa_pa');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create($table)
    {
        // 数据库表字段集
        $colsData = getAllField($table);

        return view('',['info'=>'', 'table' => $table, 'field'=>$colsData]);
    }

    //编辑视图
    public function edit($table, $id)
    {

        // 数据库表字段集
        $colsData = getAllField($table);

        // 查询结果
        return view('',['info'=>'', 'field'=>$colsData]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 数据库表
        $table = $data['table_name'];

        // 数据库表字段集
        $colsData = getAllField($table);

        // 权重查询
        $score_arr = Db::name('tj_score')
            ->field('score_field, score')
            ->where('table_name', $table)
            ->select();

        $a = ['id','Time','Name','Total_score'];

        // 拼装数组（权重设置 不参与计算的默认为空 未设置的默认按100%）
        foreach ($colsData as $k => $v){

            if(in_array($colsData[$k]['Field'],$a)){
                $colsData[$k]['score_field'] = '';
            }else{
                $colsData[$k]['score_field'] = 100;
            }

            foreach ($score_arr as $key => $val){

                if($colsData[$k]['Field'] == $val['score_field']){

                    $colsData[$k]['score_field'] = $val['score'];
                }
            }

            if(in_array($colsData[$k]['Field'],$a)){
                unset($colsData[$k]);
            }
        }

        $total = [];

        // 计算总分(评分项 * 权重比例)
        foreach ($colsData as $k => $v){

            $total[] = $data[$colsData[$k]['Field']] * $colsData[$k]['score_field']/100;
        }

        // 求和
        $data['Total_score'] = array_sum($total);

        // 移除非必要字段
        unset($data['table_name']);

        // 保存
        Db::table($table)->insert($data);

        // 返回操作结果
        return json(['msg' => '创建成功']);
    }

    // 更新 
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新 时间
        $data['Time'] = date("Ymd");

        TjOpaPaModel::update($data);

        // 返回操作结果
        return json(['msg' => '更新成功']);
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        TjOpaPaModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            TjOpaPaModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

}
