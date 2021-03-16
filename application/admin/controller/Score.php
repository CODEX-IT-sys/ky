<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Db;
use think\Env;

//  评分系统 控制器
class Score extends Controller
{
    // 表格字段
    public function index($table)
    {
        // 数据库表字段集
        $colsData = getAllField($table);
        //halt($colsData);

        // 条数 = 数据长度
        $limit = count($colsData);

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
        }

        // 返回视图
        return view('',['fieldData'=>$colsData, 'limit'=>$limit,
            'table' => $table, 'colsData' => json_encode($colsData)]);
    }

    // 添加评分项（数据库表加字段） 视图表单
    public function create_field($table)
    {

        // 返回视图
        return view('',['table' => $table]);
    }

    // 删除 表格字段
    public function delete_field($table)
    {
        // 数据库表字段集
        $colsData = getAllField($table);

        // 返回数据
        return $colsData;
    }

    // 评分表格 自定义字段 设置 字段在总分计算规则中的权重
    public function save_field(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 添加字段
        if($data['field_type'] == 'int'){

            $sql = "alter table" .' '. $data['table'] ." add " . $data['english_name'] .' '. $data['field_type'] . '(11)' . " comment ". "'". $data['name'] . "'";

        }elseif ($data['field_type'] == 'varchar'){

            $sql = "alter table" .' '. $data['table'] ." add " . $data['english_name'] .' '. $data['field_type'] . '(255)' . " comment ". "'". $data['name'] . "'";

        }else{

            $sql = "alter table" .' '. $data['table'] ." add " . $data['english_name'] .' '. $data['field_type'] . " comment ". "'". $data['name'] . "'";
        }

        // 执行sql
        Db::query($sql);

        // 返回操作结果
        return json(['msg' => '操作成功']);
    }

    // 字段重名验证
    public function check_name($table, $name)
    {
        // 数据库表字段集
        $colsData = getAllField($table);

        foreach ($colsData as $k => $v){

            $field_arr[] = $v['Field'];
        }

        if(in_array($name,$field_arr)){

            return json(['code'=>0,'msg'=>'英文名称已存在请勿重名']);

        }else{

            return json(['code'=>1,'msg'=>'成功']);
        }

    }

    // 设置字段权重 表单页
    public function score_field($table)
    {
        // 数据库表字段集
        $colsData = getAllField($table);

        $a = ['id','Time','Name','Total_score'];

        // 移除不可选字段
        foreach ($colsData as $k => $v){

            if(in_array($colsData[$k]['Field'],$a)){

                unset($colsData[$k]);
            }
        }

        // 返回视图
        return view('',['table' => $table, 'colsData' => $colsData]);
    }

    // 评分表格 自定义字段 设置 字段在总分计算规则中的权重
    public function save_score(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 查询数据
        $res = Db::name('tj_score')->field('id')
            ->where(['score_field'=>$data['score_field'],'table_name'=>$data['table_name']])
            ->find();

        // 判断是否存在 存在就更新 不存在就新增
        if(empty($res)){
            Db::name('tj_score')->insert($data);
        }else{
            Db::name('tj_score')->where('id',$res['id'])->update($data);
        }

        // 返回操作结果
        return json(['code'=>1,'msg'=>'操作成功']);
    }

}
