<?php
namespace app\admin\controller;

use app\facade\MkInvoicing as MkInvoicingModel;
use app\facade\MkInvoice as MkInvoiceModel;
use app\facade\MkInvoiceTable as MkInvoiceTableModel;
use app\facade\MkFapiao as MkFapiaoModel;
use think\Controller;
use think\Request;
use think\Db;

// 请款单 控制器
class MkInvoice extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_invoice');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
                , 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = MkInvoiceModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_invoice');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {
        // 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 服务类型
        $service_type = Db::name('xt_dict')->where('c_id',5)->select();

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 单位
        $units = Db::name('xt_dict')->where('c_id',3)->select();

        // 直接返回视图
        return view('form', [
            'service_type'=>$service_type, 'yy'=>$yy, 'gs'=>$gs,
            'currency'=>$currency, 'units'=>$units
        ]);
    }

    // 查看
    public function read($id)
    {
        // 查询信息
        $res = MkInvoiceModel::get($id);

        // 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Issued_by'])
            ->whereOr('en_name',$res['Issued_by'])->value('id');

        // 服务类型
        $service_type = Db::name('xt_dict')->where('c_id',5)->select();

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 单位
        $units = Db::name('xt_dict')->where('c_id',3)->select();

        // 直接返回视图
        return view('form-view', [
            'info'=>$res, 'service_type'=>$service_type, 'gs'=>$gs, 'gs_id'=>$gs_id,
            'yy'=>$yy, 'currency'=>$currency, 'units'=>$units
        ]);
    }

    //编辑视图
    public function edit($id)
    {
        // 查询信息
        $res = MkInvoiceModel::get($id);

        // 主体公司
        $gs = Db::name('xt_company')->field('id,cn_name,en_name')->select();

        // 主体公司ID
        $gs_id = Db::name('xt_company')->where('cn_name',$res['Issued_by'])
            ->whereOr('en_name',$res['Issued_by'])->value('id');

        // 服务类型
        $service_type = Db::name('xt_dict')->where('c_id',5)->select();

        // 语种
        $yy = Db::name('xt_dict')->where('c_id',1)->select();

        // 币种
        $currency = Db::name('xt_dict')->where('c_id',2)->select();

        // 单位
        $units = Db::name('xt_dict')->where('c_id',3)->select();

        // 直接返回视图
        return view('form-view', [
            'info'=>$res, 'service_type'=>$service_type, 'gs'=>$gs, 'gs_id'=>$gs_id,
            'yy'=>$yy, 'currency'=>$currency, 'units'=>$units
        ]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 主表字段
//        $z_field = ['Invoice_Number','To','Attention','Company_Address','Email',
//            'Invoicing_Date','Issued_by','VAT_ID','Address','Currency'
//        ];
//
//        // 附表信息
//        $f_field = ['Invoice_Number','Filing_Code','Pages','File_Type',
//            'Assigned','Completed','Net_Amount','VAT_Amount','Invoicing_Amount',
//            'Job_Name','Service','Language','Units','Unit_Quantity','Unit_Price'
//        ];
//
//        // 预定义数组
//        $z = []; $f = [];
//
//        // 写入 请款单 主表信息
//        foreach ($data as $k => $v){
//            if(in_array($k,$z_field)){
//                $z[$k] = $data[$k];
//            }
//        }
//        MkInvoiceModel::create($z);
//
//
//        // 写入 请款单 附表 表格数据
//        foreach ($data as $k => $v){
//            if(in_array($k,$f_field)){
//                $f[$k] = $data[$k];
//            }
//        }
//        MkInvoiceTableModel::create($f);

        // 保存
        MkInvoiceModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        MkInvoiceModel::update($data);

        echo "<script>history.go(-2);</script>";

        // 返回操作结果
        //$this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkInvoiceModel::destroy($id);

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkInvoiceModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 生成开票单 （730要求删除）
    /*public function fapiao($id)
    {
        // 查询 已生成 请款的 结算单 且 确认已收到款 才能开发票

        // 查询主表信息
        $info = Db::name('mk_invoice')->where('id',$id)
            ->field('Invoice_Number, To, Issued_by as Company, VAT_ID, Company_Address, Address')
            ->find();

        // 开户银行、账号、电话、
        $info['Company_Name'] = $info['To'];
        unset($info['To']);

        // 写入附表信息
        MkFapiaoModel::create($info);

        // 跳转到列表页
        $this->redirect('mk_fapiao/index',['id',$id]);
    }*/

    // 请款单 打印预览
    public function print_view($id)
    {

        // 查询 首尾公共信息
        $i = MkInvoiceModel::get($id);

        // 表格 列表数据
        $table = Db::name('mk_invoice_table')
            ->where('Invoice_Number',$i['Invoice_Number'])
            ->select();

        $i['Total_A'] = 0;$i['Total_V'] = 0;$i['Total_Q'] = 0;

        // 计算 合计值
        foreach ($table as $k => $v){
            $i['Total_A'] += doubleval($v['Net_Amount']);
            $i['Total_V'] += doubleval($v['VAT_Amount']);
            $i['Total_Q'] += doubleval($v['Invoicing_Amount']);
        }

        // 千位符 保留两位小数 显示
        $z['ta'] = number_format($i['Total_A'], 2);
        $z['tv'] = number_format($i['Total_V'], 2);
        $z['tq'] = number_format($i['Total_Q'], 2);

        // 将金额数据 计算的合计结果 更新至主表
        MkInvoiceModel::update([
            'Total_Amount_without_VAT'=>$i['Total_A'],
            'Total_VAT_Amount'=>$i['Total_V'],
            'Total_Invoicing_Amount'=>$i['Total_Q']
        ], ['id' => $id]);

        // 获取语言版本信息
        $language = session('language');

        // 返回模板视图
        if($language == '中文'){

            // 中文 银行信息
            $bank_info = Db::name('xt_company')->where('cn_name',$i['Issued_by'])
                ->whereOr('en_name',$i['Issued_by'])->value('CN_Bank_Info');

            return view('request_cn',['i'=>$i, 'z'=>$z, 'table'=>$table, 'bank_info'=>$bank_info]);

        }else{

            // 英文 银行信息
            $bank_info = Db::name('xt_company')->where('cn_name',$i['Issued_by'])
                ->whereOr('en_name',$i['Issued_by'])->value('EN_Bank_Info');

            return view('request_en',['i'=>$i, 'z'=>$z, 'table'=>$table, 'bank_info'=>$bank_info]);
        }

    }

}