<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use app\facade\XtJob as XtJobModel;
use app\facade\XtDepartment as XtDepartmentModel;

use think\Controller;
use think\Db;
use think\Env;
use think\Request;

// 权限管理 控制器
class AuthorityManagement extends Controller
{

    // 权限设置（默认首页 显示部门列表）
    public function index(Request $request, $field = '', $keyword = '', $limit = 10)
    {
		// 非Ajax请求，直接返回视图
		if (!$request->isAjax()) {
		    return view('', ['type'=>'d']);
		}

        // 调用模型获取列表
        $list = XtDepartmentModel::getList($field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 权限设置（切换类型 显示职位列表）
    public function job_index(Request $request, $field = '', $keyword = '', $limit = 10)
    {
		// 非Ajax请求，直接返回视图
		if (!$request->isAjax()) {
		    return view('index', ['type'=>'j']);
		}

        // 调用模型获取列表
        $list = XtJobModel::getList($field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 权限分配（首页选项卡）
    public function index_tab(Request $request, $field = '', $keyword = '', $limit = 10)
    {
        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {

            return view('',['field'=>$field, 'keyword'=>$keyword]);
        }

        // 调用模型获取用户列表
        $list = AdminModel::getList($field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 权限设置 创建部门
    public function create_d()
    {
        // 返回视图
        return view('');
    }

    // 权限设置 创建职位
    public function create_j()
    {
        // 返回视图
        return view('');
    }

     // 权限设置 编辑部门
    public function edit_d($id)
    {
        $info = XtDepartmentModel::get($id);

        // 返回视图
        return view('', ['info'=>$info]);
    }

    // 权限设置 编辑职位
    public function edit_j($id)
    {
        $info = XtJobModel::get($id);

        // 返回视图
        return view('', ['info'=>$info]);
    }

    // 权限设置 创建部门 数据保存
    public function save_d(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 调用模型创建数据
        XtDepartmentModel::create($data);

        return json(['msg' => '创建成功']);
    }

    // 权限设置 创建职位 数据保存
    public function save_j(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 调用模型创建数据
        XtJobModel::create($data);

        return json(['msg' => '创建成功']);
    }

    // 权限设置 更新部门 数据保存
    public function update_d(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 调用模型创建数据
        XtDepartmentModel::update($data);

        return json(['msg' => '更新成功']);
    }

    // 权限设置 更新职位 数据保存
    public function update_j(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 调用模型创建数据
        XtJobModel::update($data);

        return json(['msg' => '更新成功']);
    }

    // 删除部门
    public function d_delete($id)
    {
        // 调用模型删除
        XtDepartmentModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 删除职位
    public function j_delete($id)
    {
        // 调用模型删除
        XtJobModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 权限分配 视图
    public function auth($id)
    {
		// 要查询的字段
        $field = ['id', 'name', 'department_id', 'job_id', 'menu_arr', 'report_arr'];

        // 调用模型获取用户信息
        $info = AdminModel::getOne($id, $field);

        // 查询菜单信息
        $menu_arr = Db::name('xt_menu')
		    ->field('id, pid, cn_name, en_name')
            ->select();

        // 预定义
        $a = array();$top = array();$two = array();

        if(!empty($menu_arr)){
            // 拆分一二级菜单
            foreach ($menu_arr as $k => $v){
                if($v['pid'] == 0){
                    $a['top'][] = $v;
                }else{
                    $a['two'][] = $v;
                }
            }
            $top = $a['top'];
            $two = $a['two'];
            
            // 组成新数组
            foreach ($top as $k => $v) {
                foreach ($two as $key => $val){
                    if($val['pid'] == $v['id']){
                        $top[$k]['z'][] = $val;
                    }
                }
            }
        }
        
        // 查询报表栏目
        $report_menu = db('xt_report')
		->field('id, cn_name, en_name')->select();

        // 查询 表格读写权限
        $menu_table = Db::name('xt_menu')
            ->field('id, C, cn_name, en_name')
            ->where('C', '<>', NULL)
            ->select();

        // 已授权的操作按钮
        $act = Db::name('xt_rw_auth')->field('C, read, create, edit, delete')
            ->where('name',$info['name'])->select();

        $info['action_arr'] = '';

        // 组装拼接字符串数据
        if(!empty($act)) {

            foreach ($menu_table as $key => $val) {

                foreach ($act as $k => $v) {

                    if ($v['C'] == $val['C']) {

                        $info['action_arr'] = $info['action_arr'] . ',' . $val['id'];

                        if ($v['read'] == 1) {

                            $info['action_arr'] = $info['action_arr'] . ',' . $val['id'] . '-read';
                        }
                        if ($v['create'] == 1) {

                            $info['action_arr'] = $info['action_arr'] . ',' . $val['id'] . '-create';
                        }
                        if ($v['edit'] == 1) {

                            $info['action_arr'] = $info['action_arr'] . ',' . $val['id'] . '-edit';
                        }
                        if ($v['delete'] == 1) {

                            $info['action_arr'] = $info['action_arr'] . ',' . $val['id'] . '-delete';
                        }
                    }
                }
            }
        }

        // 移除多余字符
        if($info['action_arr'] != ''){

            $info['action_arr'] = substr($info['action_arr'], 1, strlen($info['action_arr']));
        }

        // 返回视图
        return view('',
		['info'=>$info, 'menu'=>$top, 'menu_table'=>$menu_table, 'report_menu'=>$report_menu]);
    }

    // 权限分配 实现
    public function update_auth(Request $request, $id)
    {
		// 获取提交的数据
		$data = $request->put();

		// 有需要 控制栏目表格 读写权限数据
        if($data['table_name'] != ''){

            $table_arr = explode(',', $data['table_name']);

            $z = [];
            if($data['action_arr'] != ''){

                $action_arr = explode(',', $data['action_arr']);

                foreach ($action_arr as $k => $v){

                    $z[] = explode('-', $v);
                }

                $action_data = [];

                // 数据按格式重新组装
                foreach ($table_arr as $key => $val){

                    foreach ($z as $k => $v){

                        if($val === $v[0]){

                            if(in_array($v[1], ['read','create','edit','delete'])){

                                $action_data[$val][$v[1]] = 1;
                            }
                        }
                    }
                }

                // 栏目 表格
                $menu_table = Db::name('xt_menu')->field('id, C')->where('C', '<>', NULL)->select();

                // 用户名
                $name = db('admin')->where('id',$id)->value('name');

                // 组装数据
                foreach ($action_data as $k => $v){

                    foreach ($menu_table as $key => $val){

                        if($k == $val['id']){

                            $action_data[$k]['C'] = $val['C'];
                            $action_data[$k]['name'] = $name;

                            if(!isset($action_data[$k]['read'])){
                                $action_data[$k]['read'] = 0;
                            }
                            if(!isset($action_data[$k]['create'])){
                                $action_data[$k]['create'] = 0;
                            }
                            if(!isset($action_data[$k]['edit'])){
                                $action_data[$k]['edit'] = 0;
                            }
                            if(!isset($action_data[$k]['delete'])){
                                $action_data[$k]['delete'] = 0;
                            }
                        }
                    }
                }

                // 读写权限表
                foreach ($action_data as $k => $v){

                    $i = Db::name('xt_rw_auth')->field('id')
                        ->where('name',$name)->where('C',$v['C'])->find();

                    if(empty($i)){
                        Db::name('xt_rw_auth')->insert($v);
                    }else{
                        Db::name('xt_rw_auth')->where('id',$i['id'])->update($v);
                    }
                }
            }
        }

		unset($data['table_name']);
		unset($data['action_arr']);

		// 调用模型更新用户表数据
		AdminModel::updateAdmin($data, $id);

        // 返回数据
        return json(['msg' => '更新成功']);
    }


}
