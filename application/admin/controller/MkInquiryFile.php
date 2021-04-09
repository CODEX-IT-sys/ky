<?php
namespace app\admin\controller;

use app\facade\MkInquiry as MkInquiryModel;
use app\facade\MkQuote as MkQuoteModel;
use think\Controller;
use think\Request;
use think\Db;

// 来稿需求 文件 控制器
class MkInquiryFile extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_inquiry');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {

            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
            ]);
        }

        // 调用模型获取列表
        $list = MkInquiryModel::getList($search_type, $field, $keyword, $limit);
		
		// 数据集
		$data = $list->getCollection();
		
		// 保留两位小数 计算 总价 = 千字单价 * （原字数/1000）
		foreach ($data as $k => $v){
			
			$data[$k]['Total_Price'] = round($data[$k]['Unit_Price'] * ($data[$k]['Source_Text_Word_Count']/1000) , 2);
		}

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_inquiry');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 查询 可供预选的 编号值
        $contract_code = db('mk_customer')
            ->field('Contract_Number')
            ->order('id desc')->select();
			
		// 主体公司
		$gs = Db::name('xt_dict')->where('c_id',14)->select();

		// 文件类型
		$File_Type = Db::name('xt_dict')->where('c_id',4)->select();

		// 服务类型
		$service_type = Db::name('xt_dict')->where('c_id',5)->select();
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 币种
		$currency = Db::name('xt_dict')->where('c_id',2)->select();
		
		// 单位
		$units = Db::name('xt_dict')->where('c_id',3)->select();
	
		// 是否首次合作
		$first = Db::name('xt_dict')->where('c_id',9)->select();

        // 直接返回视图
        return view('form-Inquiry',
            ['gs'=>$gs, 'File_Type'=>$File_Type, 'service_type'=>$service_type, 'yy'=>$yy, 'first'=>$first,
			'currency'=>$currency, 'units'=>$units, 'contract_code'=>$contract_code]);
    }

    // 查看
    public function read($id)
    {
        // 查询信息
        $res = MkInquiryModel::get($id);

        // 主体公司
        $gs = Db::name('xt_dict')->where('c_id',14)->select();

        // 文件类型
        $File_Type = Db::name('xt_dict')->where('c_id',4)->select();

        // 服务类型
        $service_type = Db::name('xt_dict')->where('c_id',5)->select();

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 单位
        $units = Db::name('xt_dict')->where('c_id',3)->select();

        // 是否首次合作
        $first = Db::name('xt_dict')->where('c_id',9)->select();

        // 直接返回视图
        return view('form-Inquiry-view',
            ['info'=>$res,'gs'=>$gs, 'File_Type'=>$File_Type, 'service_type'=>$service_type,
            'yy'=>$yy, 'first'=>$first, 'currency'=>$currency, 'units'=>$units]);
    }

    //编辑视图
    public function edit($id)
    {

        // 查询信息
        $res = MkInquiryModel::get($id);
		
		// 主体公司
		$gs = Db::name('xt_dict')->where('c_id',14)->select();

		// 文件类型
		$File_Type = Db::name('xt_dict')->where('c_id',4)->select();
		
		// 服务类型
		$service_type = Db::name('xt_dict')->where('c_id',5)->select();
		
		// 语种
		$yy = Db::name('xt_dict')->where('c_id',1)->select();
		
		// 币种
		$currency = Db::name('xt_dict')->where('c_id',2)->select();
		
		// 单位
		$units = Db::name('xt_dict')->where('c_id',3)->select();
			
		// 是否首次合作
		$first = Db::name('xt_dict')->where('c_id',9)->select();

        return view('form-Inquiry-view',
            ['info'=>$res, 'gs'=>$gs, 'File_Type'=>$File_Type, 'service_type'=>$service_type,
			'yy'=>$yy, 'first'=>$first,'currency'=>$currency, 'units'=>$units]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 来稿日期
        $data['Inquiry_Date'] = date("Ymd");

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        // 保存
        MkInquiryModel::create($data);

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

        MkInquiryModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkInquiryModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkInquiryModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 生成报价单  改变状态值
    public function quotation($id)
    {
        // 查询需求信息
        $info = db('mk_inquiry')->where('id', $id)
            ->field('Company_Name, Job_Name, Attention, 
            Contract_Number, Quote_Number,Pages, Unit_Price, Units, File_Type, Language, 
            Source_Text_Word_Count, Quote_Quantity, Request_a_Quote, VAT')
            ->find();

        $info['To'] = $info['Company_Name'];
        $info['Date'] = date('Ymd');

        // 根据合同编码 查询 公司编码
        $company_code = db('mk_contract')
            ->where('Contract_Number', $info['Contract_Number'])
            ->value('Company_Code');

        // 所有编号延续 获取当前最大值
        $max_no = db('mk_quote')->max('id');
        $no = intval($max_no) + 1;

        // 生成 报价单编码
        $info['Quote_Number'] = 'Q-' . $company_code . date('Ymd') . $no;
        // 调用方法生成
        //quote_number($company_code);

        // 生成Invoice Code
        $info['Invoice_Code'] = $company_code . date('Ymd');

        // 移除非必要字段
		unset($info['Contract_Number']);
		unset($info['Request_a_Quote']);

		// 更新状态值
		db('mk_inquiry')->where('id', $id)
            ->update(['Request_a_Quote'=>'Yes', 'Quote_Number'=>$info['Quote_Number']]);

		// 默认往 报价单中写入一条关联信息
		MkQuoteModel::create($info);
        
        // 跳转到 报价单列表页
        $this->redirect('mk_quote/index',['id',$id]);
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = db('mk_customer')
            ->where('Contract_Number', $code)
            ->find();

        // 返回值
        return json(['data'=>$info]);
    }

    // 文件名称 重名验证
    public function check_name($name)
    {

        // 查询信息
        $res = db('mk_inquiry_file')->field('id')
            ->where('Job_Name',$name)
            ->find();

        $l = session('language');

        if($l == '中文'){
            $msg = '文件名称已存在';
        }else{
            $msg = 'The Job_Name already exists';
        }

        if(!empty($res)){
            return json(['code'=>0, 'msg'=>$msg]);
        }else{
            return json(['code'=>1]);
        }
    }
}