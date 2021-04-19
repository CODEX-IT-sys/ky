<?php
namespace app\admin\controller;

use app\common\model\Admin;
use app\facade\MkContract as MkContractModel;
use app\facade\MkCustomer as MkCustomerModel;
use app\common\controller\Common;
use think\Controller;
use think\Request;
use think\Db;

// 合同信息 控制器
class MKContract extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {

        // 数据库表字段集
        $colsData = getAllField('ky_mk_contract');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',1)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = MkContractModel::getList($search_type, $field, $keyword, $limit);

        // 获取当前时间
        $now = date("Ymd");

        // 数据集
        $data = $list->getCollection();

        // 根据当前时间更新有效期和合同状态
        foreach ($data as $k => $v){

            // 生效日期 大于 当前日期 起始时间按 生效时间开始计算 否则反之
            if($now > $data[$k]['Effective_Date']){
                $data1 = $now;
            }else{
                $data1 = $data[$k]['Effective_Date'];
            }

            // 如果失效时间 小于 当前时间 直接判断为无效合同
            if($now > $data[$k]['Expired_Date']){
                $data[$k]['Contract_Status'] = '无效';
            }else{
                $data[$k]['Contract_Status'] = '有效';
            }

            // 计算合同有效期
            $interval = date_diff(date_create($data1), date_create($data[$k]['Expired_Date']));
            // 剩余有效期
            $data[$k]['Remaining_Validity'] = $interval->format('%R%a天');

            // 更新数据库
            Db::name('mk_contract')->where('id',$data[$k]['id'])
                ->update([
                    'Contract_Status'   =>$data[$k]['Contract_Status'],
                    'Remaining_Validity'=>$data[$k]['Remaining_Validity']
                ]);
        }

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_contract');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {

        //.语种
        $language=Db::name('xt_dict')->where('c_id',1)->field('id,cn_name,en_name')->select();
        $l=[];
        foreach ($language as $k=>$v)
        {
            $l[$k]['name']=$v['cn_name'];
            $l[$k]['value']=$v['cn_name'];
        }

        //服务
        $serve=Db::name('xt_dict')->where('c_id',12)->field('id,cn_name,en_name')->select();
        $s=[];
        foreach ($serve as $k=>$v)
        {
            $s[$k]['name']=$v['cn_name'];
            $s[$k]['value']=$v['cn_name'];
        }
        //单位
        $danwei=Db::name('xt_dict')->where('c_id',3)->field('id,cn_name,en_name')->select();
        $d=[];
        foreach ($danwei as $k=>$v)
        {
            $d[$k]['name']=$v['cn_name'];
            $d[$k]['value']=$v['cn_name'];
        }
        // 查询 可供预选的 编号值
        $contract_code = MkCustomerModel::field('Contract_Number')->order('id desc')->select();
		
		// 主体公司
		$gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 销售
        $sales = Admin::field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();

        // 币种
		$currency = dict(2);

		// 税率
		$vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 直接返回视图
        return view('form-Contract', [
            'contract_code'=>$contract_code, 'vat_rate'=>$vat_rate,
            'currency'=>$currency,  'gs'=>$gs, 'sales'=>$sales,
            'language'=>$l,'Service'=>$s,'unit'=>$d
        ]);
    }

    // 查看
    public function read($id)
    {

        // 查询信息
        $res = MkContractModel::get($id);
        $yz = explode(',', $res['Language']);
        $dw= explode(',', $res['Units']);
        $fw= explode(',', $res['Service']);
        //.语种
        $language=Db::name('xt_dict')->where('c_id',1)->field('id,cn_name,en_name')->select();
        $l=[];
        foreach ($language as $k=>$v)
        {
            $l[$k]['name']=$v['cn_name'];
            $l[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$yz)){
                $l[$k]['selected'] = true;
            }
        }

//        dump($yz);
//        dump($l);

        //服务
        $serve=Db::name('xt_dict')->where('c_id',12)->field('id,cn_name,en_name')->select();
        $s=[];
        foreach ($serve as $k=>$v)
        {
            $s[$k]['name']=$v['cn_name'];
            $s[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$fw)){
                $s[$k]['selected'] = true;
            }
        }
        //单位
        $danwei=Db::name('xt_dict')->where('c_id',3)->field('id,cn_name,en_name')->select();
        $d=[];
        foreach ($danwei as $k=>$v)
        {
            $d[$k]['name']=$v['cn_name'];
            $d[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$dw)){
                $d[$k]['selected'] = true;
            }
        }

		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');

        // 销售
        $sales = Admin::field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();

		// 币种
		$currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 直接返回视图
        return view('form-Contract-view', [
            'info'=>$res, 'vat_rate'=>$vat_rate,'gs'=>$gs,
            'gs_id'=>$gs_id, 'sales'=>$sales, 'currency'=>$currency,
                        'language'=>$l,'Service'=>$s,'unit'=>$d
        ]);
    }

    //编辑视图
    public function edit($id)
    {

        $res = MkContractModel::get($id);
        $yz = explode(',', $res['Language']);
        $dw= explode(',', $res['Units']);
        $fw= explode(',', $res['Service']);
        //.语种
        $language=Db::name('xt_dict')->where('c_id',1)->field('id,cn_name,en_name')->select();
        $l=[];
        foreach ($language as $k=>$v)
        {
            $l[$k]['name']=$v['cn_name'];
            $l[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$yz)){
                $l[$k]['selected'] = true;
            }
        }

//        dump($yz);
//        dump($l);

        //服务
        $serve=Db::name('xt_dict')->where('c_id',12)->field('id,cn_name,en_name')->select();
        $s=[];
        foreach ($serve as $k=>$v)
        {
            $s[$k]['name']=$v['cn_name'];
            $s[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$fw)){
                $s[$k]['selected'] = true;
            }
        }
        //单位
        $danwei=Db::name('xt_dict')->where('c_id',3)->field('id,cn_name,en_name')->select();
        $d=[];
        foreach ($danwei as $k=>$v)
        {
            $d[$k]['name']=$v['cn_name'];
            $d[$k]['value']=$v['cn_name'];
            if(in_array($v['cn_name'],$dw)){
                $d[$k]['selected'] = true;
            }
        }
        // 查询信息
        $res = MkContractModel::get($id);

		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');

        // 销售
        $sales = Admin::field('name')->where('job_id', 3)
            ->where(['status'=> 0, 'delete_time'=>0])->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 查询 可供预选的 编号值
        $contract_code = Db::name('mk_customer')
            ->field('Contract_Number')
            ->order('id desc')->select();

        return view('form-Contract-view', [
            'contract_code'=>$contract_code, 'vat_rate'=>$vat_rate,'gs'=>$gs,
            'gs_id'=>$gs_id, 'sales'=>$sales, 'info'=>$res,'currency'=>$currency,
            'language'=>$l,'Service'=>$s,'unit'=>$d
        ]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();
//        dump($data);
//        die;
        /* 合同编码 C- + 公司编码 + 登记日期 自动生成*/
        $data['Contract_Number'] = 'C-'. $data['Company_Code'] . date("Ymd");

        // 写入登记日期
        $data['Register_Date'] = date("Ymd");
        // 写入更新时间
        $data['Update_Date'] = date("Ymd");
        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];
        // 获取当前时间
        $now = date("Ymd");

        // 生效日期 大于 当前日期 起始时间按 生效时间开始计算 否则反之
        if($now > $data['Effective_Date']){
            $data1 = $now;
        }else{
            $data1 = $data['Effective_Date'];
        }

        // 如果失效时间 小于 当前时间 直接判断为无效合同
        if($now > $data['Expired_Date']){
            $data['Contract_Status'] = '无效';
        }else{
            $data['Contract_Status'] = '有效';
        }

        // 计算合同有效期
        $interval = date_diff(date_create($data1), date_create($data['Expired_Date']));
        // 剩余有效期
        $data['Remaining_Validity'] = $interval->format('%R%a天');

        // 保存
        MkContractModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        // 获取当前时间
        $now = date("Ymd");

        // 生效日期 大于 当前日期 起始时间按 生效时间开始计算 否则反之
        if($now > $data['Effective_Date']){
            $data1 = $now;
        }else{
            $data1 = $data['Effective_Date'];
        }

        // 如果失效时间 小于 当前时间 直接判断为无效合同
        if($now > $data['Expired_Date']){
            $data['Contract_Status'] = '无效';
        }else{
            $data['Contract_Status'] = '有效';
        }

        // 计算合同有效期
        $interval = date_diff(date_create($data1), date_create($data['Expired_Date']));
        // 剩余有效期
        $data['Remaining_Validity'] = $interval->format('%R%a天');

        MkContractModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkContractModel::destroy($id);

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
            MkContractModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = MkCustomerModel::where('Contract_Number', $code)->find();

        // 返回值
        return json(['data'=>$info]);
    }

}