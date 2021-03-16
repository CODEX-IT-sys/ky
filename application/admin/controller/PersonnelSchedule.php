<?php
namespace app\admin\controller;

use app\facade\PersonnelSchedule as PersonnelScheduleModel;
use app\facade\Admin as AdminModel;
use think\Controller;
use think\Request;
use think\Db;

// 人员日程 控制器
class PersonnelSchedule extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $field = '', $keyword = '', $limit = 50)
    {

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('');
        }

        // 调用模型获取用户列表
        $list = AdminModel::getOneList($field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    /*
     * 人员日程 日历
     * @param Request   $request    请求类型
     * @param int       $id         用户ID
     * @return Json|View
     * @throws \think\exception\DbException
     * */
    public function look(Request $request, $id)
    {

        // 查询用户信息
        $u_info = db('admin')->field('job_id, name')
            ->where('id', $id)->find();

        $job_id = $u_info['job_id'];
        $name = $u_info['name'];

        // 人员查询条件
        $where_name = '';

        // 预定义数组
        $a = array();

        // 10翻译人员   11校对人员  12、13预、后排版人员
        if(in_array($job_id, [10,11,12,13])) {

            // 针对不同人员 查询字段不同
            if ($job_id == 10) {
                $where_Start_Time = 'Translation_Start_Time';
                $where_End_Time = 'Translation_Delivery_Time';
                $where_name = 'Translator';
            }
            if ($job_id == 11) {
                $where_Start_Time = 'Revision_Start_Time';
                $where_End_Time = 'Revision_Delivery_Time';
                $where_name = 'Reviser';
            }
            if ($job_id == 12) {
                $where_Start_Time = 'Pre_Format_Delivery_Time';
                $where_End_Time = '';
                $where_name = 'Pre_Formatter';
            }
            if ($job_id == 13) {
                $where_Start_Time = 'Post_Format_Delivery_Time';
                $where_End_Time = '';
                $where_name = 'Post_Formatter';
            }

        }else{

            // 其他人员 无相关数据的直接返回
            return view('schedule', ['data'=>json_encode($a)]);
        }

        // 项目汇总表 日程时间数据查询(数据量很多时限制时间范围)
        $info = Db::name('pj_contract_review')
            ->field('Filing_Code, Delivery_Date_Expected, Completed,
                    Translator, Translation_Start_Time, Translation_Delivery_Time,
                    Reviser, Revision_Start_Time, Revision_Delivery_Time, 
                    Pre_Formatter, Pre_Format_Delivery_Time, 
                    Post_Formatter, Post_Format_Delivery_Time')
            //->where('Delivered_or_Not', 'No')
            ->where($where_name, 'like', '%'.$name.'%')
            ->order('id desc')->limit(10000)
            ->select();

        /*条状持续时间图 按格式组装数据*/
        foreach ($info as $k => $v){

            $a[$k]['title'] = $v['Filing_Code'];
            $a[$k]['start'] = $v[$where_Start_Time];

            if(!empty($where_End_Time)){
                $a[$k]['end'] = $v[$where_End_Time];
            }
        }

        /*单时间节点图*/
/*        //获取当前月份天数
        $j = date("t");

        //获取本月第一天的时间戳
        $Start_Time = strtotime(date('Y-m-01'));

        // 我的日程数据查询
        $date_arr = db('my_schedule')
            ->field('id, date_time, type, work_info')
            ->where('uid', $uid)
            ->select();

        // 预定义数组
        $a = array(); $z = array();

        foreach ($date_arr as $k => $v) {
            //每隔一天赋值给数组
            for ($i = 0; $i < $j; $i++) {
                $z[$i][0] = strval(date('Y-m-d', $Start_Time + $i * 86400));
                if ($z[$i][0] == $v['date_time']) {
                    if ($v['type'] == 'AM') {
                        $z[$i][1] = $v['work_info'];
                    } else if ($v['type'] == 'PM') {
                        $z[$i][2] = $v['work_info'];
                    }
                }
                $a[$i] = $z[$i];
            }
        }

        // 空值补全
        foreach ($a as $k => $v){
            if(!isset($v[1])){
                $a[$k][1] = '';
            }
            if(!isset($v[2])){
                $a[$k][2] = '';
            }
        }
*/

        return view('schedule', ['data'=>json_encode($a)]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 直接返回视图
        return view('');
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = PersonnelScheduleModel::get($id);

        return view('edit', ['content'=>$res]);
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 保存
        PersonnelScheduleModel::create($data);

        // 返回操作结果
        return json(['msg' => '创建成功']);
    }

    // 更新
    public function update(Request $request,$id)
    {
        // 获取提交的数据
        $data = $request->put();

        PersonnelScheduleModel::update($data,['id' => $id]);

        // 返回操作结果
        return json(['msg' => '更新成功']);
    }

    // 删除
    public function delete($id)
    {
        // 调用模型删除
        PersonnelScheduleModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }
}