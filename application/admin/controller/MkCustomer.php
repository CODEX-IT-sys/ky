<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\MkContract as MkContractModel;
use app\facade\MkCustomer as MkCustomerModel;
use think\Controller;
use think\Request;
use think\Db;

// 客户信息 控制器
class MkCustomer extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_customer');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',2)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {

            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = MkCustomerModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_customer');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {

        // 查询 可供预选的 编号值
        $contract_code = MKContractModel::field('Contract_Number')
            ->order('id desc')->select();
			
		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 直接返回视图
        return view('form-Customer',['contract_code'=>$contract_code, 'gs'=>$gs]);
    }


    // 查看
    public function read($id)
    {

        // 查询信息
        $res = MkCustomerModel::get($id);

        // 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');

        // 直接返回视图
        return view('form-Customer-view',['info'=>$res, 'gs'=>$gs, 'gs_id'=>$gs_id]);
    }

    //编辑视图
    public function edit($id)
    {

        // 查询信息
        $res = MkCustomerModel::get($id);

        // 查询 可供预选的 编号值
        $contract_code = MKContractModel::field('Contract_Number')->order('id desc')->select();
			
		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');

        return view('form-Customer-view',
            ['info'=>$res, 'contract_code'=>$contract_code, 'gs'=>$gs, 'gs_id'=>$gs_id]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 登记日期
        $data['Register_Date'] = date("Ymd");

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        MkCustomerModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->put();

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        MkCustomerModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkCustomerModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete(Request $request, $id)
    {
        // 栏目名
        $controller = $request->controller();

        $name = session('administrator')['name'];

        // 根据栏目 查询 读写权限
        $rw = Db::name('xt_rw_auth')
            ->where('name',$name)->where('C',$controller)
            ->value('delete');

        if (empty($rw)) {

            $this->error('无权操作');

        }else if($rw == 0){

            $this->error('无权操作');
        }

        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkCustomerModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = MKContractModel::where('Contract_Number', $code)
            ->field('Sales, Attention, Department, Company_Full_Name, Company_Name, Company_Code, Company_Address, 
            Remarks, Subject_Company, Subject_Company_VAT_ID, Subject_Company_Address, Subject_Company_Bank_Info')
            ->find();

        // 返回值
        return json(['data'=>$info]);
    }
}