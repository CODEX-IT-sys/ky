<?php
namespace app\admin\controller;

use app\common\controller\Common;
use app\facade\MkContract as MkContractModel;
use app\facade\MkInquiry as MkInquiryModel;
use app\facade\MkInquiryFile as MkInquiryFileModel;
use app\facade\MkQuote as MkQuoteModel;
use app\facade\MkQuoteTable as MkQuoteTableModel;
use app\facade\XtMessages as XtMsgModel;
use think\Controller;
use think\Request;
use think\Db;

// 来稿需求 控制器
class MkInquiry extends Common
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_inquiry');

        // 查询文本说明信息
        $intro = Db::name('xt_table_text')->where('id',3)->value('intro');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData),
                'intro'=>$intro, 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = MkInquiryModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 显示 文件信息列表
    public function file_index(Request $request, $field = '', $keyword = '', $limit = 50, $id)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_inquiry_file');

        // 判断管理层
        if(in_array(session('administrator')['job_id'],[1,8,9,20])){
            // 查询 所有文件列表
            $list = Db::name('mk_inquiry_file')
                ->where('i_id',$id)
                ->where($field, 'like', "%$keyword%")
                ->where('delete_time',0)
                ->order('id desc')
                ->paginate($limit);
        }else{
            // 查询 自己填写的 列表
            $list = Db::name('mk_inquiry_file')
                ->where('i_id',$id)
                ->where($field, 'like', "%$keyword%")
                ->where('Filled_by', session('administrator')['name'])
                ->where('delete_time',0)
                ->order('id desc')
                ->paginate($limit);
        }

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'i_id'=>$id, 'colsData' => json_encode($colsData)
            ]);
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
        $contract_code = MkContractModel::field('Contract_Number')->order('id desc')->select();

		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();
	
		// 是否首次合作
		$first = Db::name('xt_dict')->where('c_id',9)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 项目经理 通知
        $pm = Db::name('admin')->field('id, name')->where(['job_id'=>8,'status'=> 0,'delete_time'=>0])->select();

        // 直接返回视图
        return view('form-Inquiry', [
            'gs'=>$gs, 'pm'=>$pm, 'first'=>$first, 'vat_rate'=>$vat_rate,
            'currency'=>$currency, 'contract_code'=>$contract_code
        ]);
    }

    // 显示新建 文件信息 的表单页
    public function file_create($i_id)
    {
        // 文件类型
        $File_Type = Db::name('xt_dict')->where('c_id',4)->select();

        // 服务
        $service_type = dict(5);

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 单位
        $units = word(3);

        // 直接返回视图
        return view('file_Inquiry', [
            'File_Type'=>$File_Type, 'service_type'=>json_encode($service_type),
            'yy'=>$yy, 'i_id'=>$i_id, 'currency'=>$currency, 'units'=>$units, 'vat_rate'=>$vat_rate
        ]);
    }

    // 查看
    public function read($id)
    {
        // 查询信息
        $res = MkInquiryModel::get($id);

        // 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');

        // 是否首次合作
        $first = Db::name('xt_dict')->where('c_id',9)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 项目经理 通知
        $pm = Db::name('admin')->field('id, name')->where(['job_id'=>8,'status'=> 0,'delete_time'=>0])->select();

        // 直接返回视图
        return view('form-Inquiry-view', [
            'info'=>$res,'gs'=>$gs, 'gs_id'=>$gs_id, 'pm'=>$pm,
            'vat_rate'=>$vat_rate,'currency'=>$currency, 'first'=>$first
        ]);
    }

    // 编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = MkInquiryModel::get($id);
		
		// 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Subject_Company'])
            ->whereOr('en_name',$res['Subject_Company'])->value('id');
			
		// 是否首次合作
		$first = Db::name('xt_dict')->where('c_id',9)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 项目经理 通知
        $pm = Db::name('admin')->field('id, name')->where(['job_id'=>8,'status'=> 0,'delete_time'=>0])->select();

        return view('form-Inquiry-view', [
            'info'=>$res, 'gs'=>$gs, 'gs_id'=>$gs_id, 'pm'=>$pm,
            'vat_rate'=>$vat_rate,'currency'=>$currency, 'first'=>$first
        ]);
    }

    // 文件信息 编辑视图
    public function file_edit($id, $i_id)
    {
        // 查询信息
        $res = Db::name('mk_inquiry_file')->where('id',$id)->find();

        // 服务 多选
        $fw_arr = explode(',', $res['Service']);

        // 文件类型
        $File_Type = Db::name('xt_dict')->where('c_id',4)->select();

        // 服务类型
        $service = dict(5, $fw_arr);

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 税率
        $vat_rate = Db::name('xt_dict')->where('c_id',16)->select();

        // 单位
        $units = Db::name('xt_dict')->where('c_id',3)->select();

        // 直接返回视图
        return view('file_Inquiry-view', [
            'File_Type'=>$File_Type, 'service'=>json_encode($service), 'yy'=>$yy,
            'i_id'=>$i_id, 'currency'=>$currency, 'units'=>$units, 'info'=>$res, 'vat_rate'=>$vat_rate
        ]);
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

        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 保存
        MkInquiryModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 新建 保存 文件信息数据
    public function file_save(Request $request, $i_id)
    {
        // 获取提交的数据
        $data = $request->post();

        // 来稿日期
        $data['Inquiry_Date'] = date("Ymd");
        // 更新时间
        $data['Update_Date'] = date("Ymd");
        // 写入填表人
        $data['Filled_by'] = session('administrator')['name'];

        // 合同编号
        $data['Contract_Number'] = Db::name('mk_inquiry')
            ->where('id', $i_id)->value('Contract_Number');

        // 多选ID
        unset($data['select']);

        // 保存
        Db::name('mk_inquiry_file')->insert($data);



        /*以下为 数据自动关联写入功能*/
        // 判断订单状态(接收 自动写入 来稿确认)
        if($data['Order_Status'] == 'Accepted'){

            // 查询 来稿需求 主表信息
            $i = Db::name('mk_inquiry')->where('id',$i_id)
                ->field('Contract_Number,Subject_Company,Sales,Attention,Department,Company_Name,Company_Full_Name,
                Quote_Number, First_Cooperation, Request_a_Quote, PM, Currency,
                Subject_Company_VAT_ID, Subject_Company_Address, Subject_Company_Bank_Info')->find();

            // 筛选 来稿确认表 字段
            $f_field = ['Job_Name','Pages','Source_Text_Word_Count','File_Type','Service', 'VAT_Rate',
                'Language','Currency','Unit_Price','Units','Quote_Quantity','Quote_Amount','VAT_Amount',
                'Delivery_Date_Expected','Customer_Requirements','External_Reference_File', 'Remarks'];

            // 筛选 结算管理表 字段
            $in_field = ['Job_Name','Pages','Source_Text_Word_Count','File_Type','Service', 'VAT_Rate',
                'Language','Currency','Unit_Price','Units','Quote_Quantity','Quote_Amount','VAT_Amount',
                'Customer_Requirements','External_Reference_File', 'Remarks'];

            // 筛选存在 来稿确认表、结算管理表 字段
            $fz_data = []; $iz_data = [];
            foreach ($data as $k => $v){
                if(in_array($k, $f_field)){
                    $fz_data[$k] = $v;
                }
                if(in_array($k, $in_field)){
                    $iz_data[$k] = $v;
                }
            }

            // 合并数组 得到 来稿确认表 关联写入的字段
            $f_data = array_merge($fz_data,$i);
            // 合并数组 得到 结算管理表 关联写入的字段
            $in_data = array_merge($iz_data,$i);

            // 来稿存公司名、结算存公司全名
            unset($f_data['Company_Full_Name']);
            unset($in_data['Company_Name']);
            unset($in_data['Contract_Number']);
            unset($in_data['Department']);
            unset($in_data['First_Cooperation']);
            unset($in_data['Request_a_Quote']);
            unset($in_data['PM']);
            unset($in_data['VAT_Amount']);


            // 查询 公司编码
            $company_code = Db::name('mk_contract')
                ->where('Contract_Number', $i['Contract_Number'])->value('Company_Code');

            // 获取当天的文件数
            $arr = Db::name('mk_feseability')->field('id')
                ->where('Assigned_Date',  intval(date("Ymd")))->select();
            $no = count($arr);

            /* 调用方法 生成 文件编号*/
            $f_data['Filing_Code'] = filing_number($company_code, $no);

            // 来稿 委托日期
            $f_data['Assigned_Date'] = date("Ymd");
            // 来稿 填表人
            $f_data['Filled_by'] = session('administrator')['name'];

            // 结算 文件编号
            $in_data['Filing_Code'] = $f_data['Filing_Code'];
            // 结算 委托日期
            $in_data['Assigned_Date'] = date("Ymd");
            // 结算 填表人
            $in_data['Filled_by'] = session('administrator')['name'];



            /*自动写入 来稿确认表 数据*/
            Db::name('mk_feseability')->insert($f_data);

            /*自动写入 结算管理表 数据*/
            Db::name('mk_invoicing')->insert($in_data);


            // 提醒消息 信息
            $m_data['cn_title'] = '您有新来稿待批准，请尽快确认！';
            $m_data['en_title'] = 'You have new file to confirm';

            $m_data['content'] = 'Filing_Code: '. $f_data['Filing_Code'];
            $m_data['status'] = 0;

            // 通知 市场行政经理
            $res = Db::name('admin')->field('name')->where('job_id', 20)
                ->where('status',0)->where('delete_time',0)->find();
            $m_data['name'] = $res['name'];
            XtMsgModel::create($m_data);

            // 通知 总经理
            $res = Db::name('admin')->field('name')->where('job_id', 9)
                ->where('status',0)->where('delete_time',0)->find();
            $m_data['name'] = $res['name'];
            XtMsgModel::create($m_data);
        }

        // 返回操作结果
        $this->redirect('file_index',['id'=>$i_id]);
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

    // 文件信息 更新
    public function file_update(Request $request, $i_id)
    {
        // 获取提交的数据
        $data = $request->post();

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        // 多选ID
        unset($data['select']);

        // 更改数据前 查询之前的状态
        $order_status = Db::name('mk_inquiry_file')->where('id',$data['id'])->value('Order_Status');

        // 更新数据
        Db::name('mk_inquiry_file')->update($data);

        // 仅限更改订单状态 为接收 才触发相关逻辑
        if($order_status != 'Accepted'){

            // 判断 订单状态(接收 自动写入 来稿确认)
            if($data['Order_Status'] == 'Accepted'){

                $i = Db::name('mk_inquiry')->where('id',$i_id)
                    ->field('Contract_Number,Subject_Company,Sales,Attention,Department,Company_Name,Company_Full_Name,
                    Quote_Number, First_Cooperation, Request_a_Quote, PM, Currency,
                    Subject_Company_VAT_ID, Subject_Company_Address, Subject_Company_Bank_Info')->find();

                // 筛选 来稿确认表 字段
                $f_field = ['Job_Name','Pages','Source_Text_Word_Count','File_Type','Service', 'VAT_Rate',
                    'Language','Currency','Unit_Price','Units','Quote_Quantity','Quote_Amount','VAT_Amount',
                    'Delivery_Date_Expected','Customer_Requirements','External_Reference_File', 'Remarks'];

                // 筛选 结算管理表 字段
                $in_field = ['Job_Name','Pages','Source_Text_Word_Count','File_Type','Service', 'VAT_Rate',
                    'Language','Currency','Unit_Price','Units','Quote_Quantity','Quote_Amount','VAT_Amount',
                    'Customer_Requirements','External_Reference_File', 'Remarks'];

                // 筛选存在 来稿确认表、结算管理表 字段
                $fz_data = []; $iz_data = [];
                foreach ($data as $k => $v){
                    if(in_array($k, $f_field)){
                        $fz_data[$k] = $v;
                    }
                    if(in_array($k, $in_field)){
                        $iz_data[$k] = $v;
                    }
                }

                // 合并数组 得到 来稿确认表 关联写入的字段
                $f_data = array_merge($fz_data,$i);
                // 合并数组 得到 结算管理表 关联写入的字段
                $in_data = array_merge($iz_data,$i);

                // 来稿存公司名、结算存公司全名
                unset($f_data['Company_Full_Name']);
                unset($in_data['Company_Name']);
                unset($in_data['Contract_Number']);
                unset($in_data['Department']);
                unset($in_data['First_Cooperation']);
                unset($in_data['Request_a_Quote']);
                unset($in_data['PM']);
                unset($in_data['VAT_Amount']);

                // 查询 公司编码
                $company_code = Db::name('mk_contract')
                    ->where('Contract_Number', $i['Contract_Number'])->value('Company_Code');

                // 获取当天的文件数
                $arr = Db::name('mk_feseability')->field('id')
                    ->where('Assigned_Date',  intval(date("Ymd")))
                    ->select();
                $no = count($arr);

                /*调用方法 生成 文件编号*/
                $f_data['Filing_Code'] = filing_number($company_code, $no);

                // 来稿 委托日期
                $f_data['Assigned_Date'] = date("Ymd");
                // 来稿 填表人
                $f_data['Filled_by'] = session('administrator')['name'];

                // 结算 文件编号
                $in_data['Filing_Code'] = $f_data['Filing_Code'];
                // 结算 委托日期
                $in_data['Assigned_Date'] = date("Ymd");
                // 结算 填表人
                $in_data['Filled_by'] = session('administrator')['name'];


                /*自动写入 来稿确认表 数据*/
                Db::name('mk_feseability')->insert($f_data);

                /*自动写入 结算管理表 数据*/
                Db::name('mk_invoicing')->insert($in_data);


                // 提醒消息 信息
                $m_data['cn_title'] = '您有新来稿待批准，请尽快确认！';
                $m_data['en_title'] = 'You have new file to confirm';

                $m_data['content'] = 'Filing_Code: '. $f_data['Filing_Code'];
                $m_data['status'] = 0;

                // 通知 市场行政经理
                $res = Db::name('admin')->field('name')->where('job_id', 20)
                    ->where('status',0)->where('delete_time',0)->find();
                $m_data['name'] = $res['name'];
                XtMsgModel::create($m_data);

                // 通知 总经理
                $res = Db::name('admin')->field('name')->where('job_id', 9)
                    ->where('status',0)->where('delete_time',0)->find();
                $m_data['name'] = $res['name'];
                XtMsgModel::create($m_data);
            }
        }

        // 返回操作结果
        $this->redirect('file_index',['id'=>$i_id]);
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkInquiryModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 文件信息 单条删除
    public function file_delete($id)
    {
        // 调用模型删除
        MkInquiryFileModel::destroy($id);

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
            MkInquiryModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 文件信息 批量删除
    public function file_batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkInquiryFileModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 生成报价单(多来稿文件)
    public function quotation($id)
    {
        // 文件id数值
        $id_arr = explode(',', $id);

        // 查询 文件表信息
        $res = Db::name('mk_inquiry_file')->field('i_id, Contract_Number')
            ->where('id', $id_arr[0])->find();

        // 合同编号
        $Contract_Number = $res['Contract_Number'];

        // 查询 来稿需求 主表信息
        $info = Db::name('mk_inquiry')->where('id', $res['i_id'])
            ->field('id, Subject_Company as Issued_by, Subject_Company_VAT_ID as VAT_ID, Company_Full_Name,
            Subject_Company_Address as Address, Subject_Company_Bank_Info as Bank_Info, Attention, Currency')
            ->find();

        // 根据合同编码 查询 客户信息
        $customer_info = Db::name('mk_customer')
            ->field('Company_Code, Email1, Company_Address')
            ->where('Contract_Number', $Contract_Number)
            ->where('Attention', $info['Attention'])
            ->find();

        // 公司编码
        $company_code = $customer_info['Company_Code'];

        // 报价单 同一客户公司编号延续 获取当前最大值
        $max_no = Db::name('mk_quote')->field('id')->where('To', $info['Company_Full_Name'])->select();
        $no = count($max_no) + 1;

        // 生成 报价单编码
        $info['Quote_Number'] = 'Q-' . $company_code . date('Ymd') . $no;

        // 更新 来稿需求 主附表信息及报价状态值
        Db::name('mk_inquiry')->where('id', $info['id'])
            ->update(['Request_a_Quote'=>'Yes', 'Quote_Number'=>$info['Quote_Number']]);

        // 查询/组装 客户及主体公司 相关信息
        $info['Company_Address'] = $customer_info['Company_Address'];
        $info['Email'] = $customer_info['Email1'];
        $info['Date'] = date('Ymd');
        // 字段别名
        $info['To'] = $info['Company_Full_Name'];
        unset($info['Company_Full_Name']);
        unset($info['id']);


        // 查询 来稿需求 附表 文件信息
        $file_info = Db::name('mk_inquiry_file')
            ->field('id, Job_Name, Pages, File_Type, Service, Language, VAT_Rate, Unit_Price, Units, Quote_Quantity')
            ->where('id', 'in', $id_arr)->select();

        // 将文件信息 写入 报价单 表格列表信息 更新来稿文件 报价状态
        foreach ($file_info as $k => $v){

            $v['Quote_Number'] = $info['Quote_Number'];

            Db::name('mk_inquiry_file')->where('id',$file_info[$k]['id'])->update(['Request_a_Quote'=>'Yes']);

            $v['Net_Amount'] = $v['Quote_Quantity'] * $v['Unit_Price'];
            $v['VAT_Amount'] = $v['Quote_Quantity'] * $v['Unit_Price'] * $v['VAT_Rate']/100;
            $v['Quote_Amount'] = $v['Net_Amount'] + $v['VAT_Amount'];

            unset($v['id']);

            MkQuoteTableModel::create($v);
        }

        // 生成 填表人
        $info['Filled_by'] = session('administrator')['name'];

        // 报价单 主表中写入一条关联信息
        MkQuoteModel::create($info);

        // 返回值
        return json(['msg' => 'Success']);
    }

    // 异步获取 关联信息
    public function get_info($code)
    {
        // 根据 合同编码 获取相关信息
        $info = Db::name('mk_contract')
            ->field('Sales, Attention, Department, Company_Full_Name, Company_Name, VAT_Rate, Subject_Company,
             Subject_Company_VAT_ID, Subject_Company_Address, Subject_Company_Bank_Info')
            ->where('Contract_Number', $code)
            ->find();

        // 根据 合同编码 查询 客户联系人
        $customer = Db::name('mk_customer')
            ->field('Attention, Department')
            ->where('Contract_Number', $code)
            ->where('delete_time', 0)
            ->select();

        // 返回值
        return json(['data'=>$info, 'c'=>$customer]);
    }

    // 根据 客户联系人 查询 所属部门
    public function get_bm($customer)
    {
        // 根据 合同编码 获取相关信息
        $bm = Db::name('mk_customer')
            ->where('Attention', $customer)
            ->where('delete_time', 0)
            ->value('Department');

        // 返回值
        return json(['bm'=>$bm]);
    }

}