<?php
namespace app\admin\controller;

use app\facade\Admin as AdminModel;
use app\facade\XtMessages as MsgModel;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;

// 页面框架控制器
class Index extends Controller
{
    public function index($language = '', $if_url = '')
    {

        // 默认为中文版
        //session('language',$language);

        // 用户id
        $id = session('administrator')['id'];

        // 查询用户可见菜单栏
        $menu = AdminModel::getOne($id, ['menu_arr']);

        // 字符串分割为数组
        $id_arr = explode(',' , $menu['menu_arr']);

        // 查询菜单信息
        $menu_arr = Db::name('xt_menu')->where('id', 'in', $id_arr)->select();

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


        // 消息状态
        $msg = Db::name('xt_messages')->field('id')
            ->where('name', session('administrator')['name'])
            ->where('status', 0)->find();

        if(empty($msg)){
            $msg_s = 0;
        }else{
            $msg_s = 1;
        }

        // iframe url
        /*if($if_url == ''){

            $if_dz = "admin/index/welcome";

        } else{

            $url_arr = explode('/', $if_url);

            $cd = count($url_arr);

            $c = $url_arr[$cd -2];
            $a = $url_arr[$cd -1];

            $if_dz = "admin/$c/$a";
        }*/

        // 返回视图
        return view('', ['menu'=>$top, 'msg_s'=>$msg_s]);
    }

    // 欢迎页
    public function welcome()
    {

        // 直接返回视图
        return view();
    }

    // 切换语言
    public function language($language, $if_url)
    {
        // 默认为中文版
        session('language',$language);

        return json(['code'=>0, 'url'=>$if_url]);
    }

    // 消息列表 查询
    public function msg(Request $request, $limit = 10)
    {

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('msg_list');
        }

        // 查看消息列表
        $list = MsgModel::getList($limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 消息详情
    public function read($id)
    {
        $info = MsgModel::get($id);

        return view('', ['info'=>$info]);
    }

    // 更新消息状态
    public function msg_status(Request $request)
    {
        // 获取提交的数据
        $data = $request->get();

        $res = MsgModel::update($data);

        return json(['msg' => '更新成功']);
    }

    // 消息 批量删除
    public function batch_delete($id)
    {

        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MsgModel::destroy($v, true);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

}
