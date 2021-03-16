<?php
namespace app\admin\controller;

use app\facade\ProjectSchedule as ProjectScheduleModel;
use app\facade\PjContractReview as PjContractReviewModel;
use app\facade\PjProjectProfile as PjProjectProfileModel;
use think\Controller;
use think\Request;
use think\Db;

// 项目日程 控制器
class ProjectSchedule extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('');
        }

        // 调用模型获取 项目列表
        $list = PjContractReviewModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    /*
     * 项目日程 日历
     * @param Request   $request    请求类型
     * @param int       $id         项目ID
     * @return Json|View
     * @throws \think\exception\DbException
     * */
    public function look(Request $request, $id)
    {
        // 预定义数组
        $a = array();

        // 项目汇总表 日程时间数据查询
        $info = Db::name('pj_contract_review')
            ->field('Translator, Translation_Start_Time, Translation_Delivery_Time,
                    Reviser, Revision_Start_Time, Revision_Delivery_Time, 
                    Pre_Formatter, Pre_Format_Delivery_Time, Delivery_Date_Expected,
                    Completed, Post_Formatter, Post_Format_Delivery_Time')
            ->where('id', $id)->find();

        /*条状持续时间图 按格式组装数据*/
        // 翻译
        $a[0]['title'] = $info['Translator'];
        $a[0]['start'] = $info['Translation_Start_Time'];
        $a[0]['end'] = $info['Translation_Delivery_Time'];
        $a[0]['className'] = "yellow";

        // 校对
        $a[1]['title'] = $info['Reviser'];
        $a[1]['start'] = $info['Revision_Start_Time'];
        $a[1]['end'] = $info['Revision_Delivery_Time'];
        $a[1]['className'] = "green";

        // 预排
        $a[2]['title'] = $info['Pre_Formatter'];
        $a[2]['start'] = $info['Pre_Format_Delivery_Time'];

        // 后排
        $a[3]['title'] = $info['Post_Formatter'];
        $a[3]['start'] = $info['Post_Format_Delivery_Time'];

        // 商定交稿
        $a[4]['title'] = '商定交稿';
        $a[4]['start'] = $info['Delivery_Date_Expected'];
        $a[4]['className'] = "red";

        // 最终交稿
        $a[5]['title'] = '交付日期';
        $a[5]['start'] = $info['Completed'];
        $a[5]['className'] = "red";

        return view('project_schedule', ['data'=>json_encode($a)]);

        /*单时间节点图*/
/*        //获取当前月份天数
        $j = date("t");

        //获取本月第一天的时间戳
        $Start_Time = strtotime(date('Y-m-01'));

        // 项目描述表 日程数据查询   预排版交付时间  翻译交付时间  校对交付时间 后排版交付时间 交付日期
        $date_arr = db('pj_project_profile')
            ->field('id, Project_Name, Pre_Format_Delivery_Time, Translation_Delivery_Time,
             Revision_Delivery_Time, Post_Format_Delivery_Time, Completed')
            ->where('id', $id)
            ->select();

        $z = array();

        // 分别写入项目 各人员 各阶段 时间事件
        foreach ($date_arr as $k => $v) {

            for ($i = 0; $i < $j; $i++) {

                $z[$i][0] = strval(date('Y-m-d', $Start_Time + $i * 86400));

                if ($z[$i][0] == substr($v['Pre_Format_Delivery_Time'],0,10)) { //预排版交付时间

                    $z[$i][1] = '预排版交付时间';

                } else if ($z[$i][0] == substr($v['Translation_Delivery_Time'],0,10)) { // 翻译交付时间

                    $z[$i][1] = '翻译交付时间';

                }else if ($z[$i][0] == substr($v['Revision_Delivery_Time'],0,10)) { // 校对交付时间

                    $z[$i][1] = '校对交付时间';

                }else if ($z[$i][0] == substr($v['Post_Format_Delivery_Time'],0,10)) { // 后排版交付时间

                    $z[$i][1] = '后排版交付时间';

                }else if ($z[$i][0] == substr($v['Completed'],0,10)) { // 交付日期

                    $z[$i][1] = '交付日期';

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

        return view('', ['data'=>json_encode($a), 'project_info'=>$date_arr]);
*/

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
        $res = ProjectScheduleModel::get($id);

        return view('edit', ['content'=>$res]);
    }

    // 新建/更新 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 保存
        ProjectScheduleModel::create($data);

        // 返回操作结果
        return json(['msg' => '创建成功']);
    }

    // 更新
    public function update(Request $request,$id)
    {
        // 获取提交的数据
        $data = $request->put();

        ProjectScheduleModel::update($data,['id' => $id]);

        // 返回操作结果
        return json(['msg' => '更新成功']);
    }

    // 删除
    public function delete($id)
    {
        // 调用模型删除
        ProjectScheduleModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }
}