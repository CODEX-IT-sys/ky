<?php
namespace app\admin\controller;

use app\facade\MkInvoicing as MkInvoicingModel;
use app\facade\MkFapiao as MkFapiaoModel;
use think\Controller;
use think\Request;

// 开票单 控制器
class MkFapiao extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_fapiao');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {

            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
            ]);
        }

        // 调用模型获取列表
        $list = MkFapiaoModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_fapiao');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 直接返回视图
        return view('form');
    }

    // 查看
    public function read($id)
    {

        // 查询信息
        $res = MkFapiaoModel::get($id);

        // 直接返回视图
        return view('form-view', ['info'=>$res]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = MkFapiaoModel::get($id);

        return view('form-view', ['info'=>$res]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 保存
        MkFapiaoModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        MkFapiaoModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkFapiaoModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkFapiaoModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 报价单 存档
    public function archive()
    {

        // 返回操作结果
        return json(['msg' => '操作成功']);
    }


    // 发票单 打印预览
    public function print_view($id)
    {
        // 查询信息
        $info = MkFapiaoModel::get($id);

        // 获取语言版本信息
        $language = session('language');

        // 返回模板视图
        if($language == '中文'){

            return view('billing_cn',['info'=>$info]);

        }else{

            return view('billing_en',['info'=>$info]);

        }

    }

}