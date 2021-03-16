<?php
namespace app\admin\controller;

use app\facade\MkInquiry as MkInquiryModel;
use app\facade\MkQuote as MkQuoteModel;
use think\Controller;
use think\Request;
use think\Db;

// 报价单 控制器
class MkQuote extends Controller
{

    // 验证失败抛出异常
    protected $failException = true;

    // 显示 报价单 列表
    public function index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_quote');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {
            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
                , 'field'=>$field, 'keyword'=>$keyword
            ]);
        }

        // 调用模型获取列表
        $list = MkQuoteModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }

    // 显示 报价单 表格数据 列表
    public function table_index(Request $request, $search_type = '', $field = '', $keyword = '', $limit = 50)
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_quote_table');

        // 非Ajax请求，直接返回视图
        if (!$request->isAjax()) {

            return view('', [
                'select_field'=>$colsData, 'colsData' => json_encode($colsData)
            ]);
        }

        // 调用模型获取列表
        $list = MkQuoteModel::getList($search_type, $field, $keyword, $limit);

        // 返回数据
        return json(generate_layui_table_data($list));
    }


    // 搜索弹框
    public function condition()
    {
        // 数据库表字段集
        $colsData = getAllField('ky_mk_quote');

        // 直接返回视图
        return view('', ['select_field'=>$colsData]);
    }

    // 显示新建的表单页
    public function create()
    {

        // 直接返回视图
        return view('form-Quote');
    }

    // 查看
    public function read($id)
    {
        // 允许手动修改 存档的 管理层
        if(in_array(session('administrator')['job_id'],[1,8,9,20])){
            $show = 1;
        }else{
            $show = 0;
        }

        // 查询信息
        $res = MkQuoteModel::get($id);

        // 直接返回视图
        return view('form-Quote-view', ['info'=>$res, 'show'=>$show]);
    }

    //编辑视图
    public function edit($id)
    {
        // 允许手动修改 存档的 管理层
        if(in_array(session('administrator')['job_id'],[1,8,9,20])){
            $show = 1;
        }else{
            $show = 0;
        }

        // 查询信息
        $res = MkQuoteModel::get($id);

        return view('form-Quote-view', ['info'=>$res, 'show'=>$show]);
    }

    // 新建 保存数据
    public function save(Request $request)
    {
        // 获取提交的数据
        $data = $request->post();

        // 日期
        $data['Date'] = date('Ymd');

        // 所有编号延续 获取当前最大值
        $max_no = Db::name('mk_quote')->max('id');
        $no = intval($max_no) + 1;

        // 生成 报价单编码
        $data['Quote_Number'] = 'Q-' . $data['Company_Code'] . date('Ymd') . $no;

        // 生成Invoice Code
        $data['Invoice_Code'] = $data['Company_Code'] . date('Ymd');

        // 保存
        MkQuoteModel::create($data);

        // 返回操作结果
        $this->redirect('index');
    }

    // 更新
    public function update(Request $request,$id)
    {
        // 获取提交的数据
        $data = $request->put();

        // 更新时间
        $data['Update_Date'] = date("Ymd");

        MkQuoteModel::update($data,['id' => $id]);

        // 返回操作结果
        $this->redirect('index');
    }

    // 单条删除
    public function delete($id)
    {
        // 调用模型删除
        MkQuoteModel::destroy($id);

        // 附表 关联删除

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 批量删除
    public function batch_delete($id)
    {
        $id_arr = explode(',' , $id);

        // 调用模型删除
        foreach ($id_arr as $k => $v){
            MkQuoteModel::destroy($v);
        }

        // 返回数据
        return json(['msg' => '删除成功']);
    }

    // 报价单 存档
    public function archive($id)
    {

        // 更新状态值
        MkQuoteModel::update(['Archive'=>'Yes'],['id' => $id]);

        // 返回操作结果
        return json(['msg' => '操作成功']);
    }

    // 报价单 打印预览
    public function print_view($id)
    {

        // 查询 首尾公共信息
        $i = MkQuoteModel::get($id);

        // 表格 列表数据
        $table = Db::name('mk_quote_table')
            ->where('Quote_Number',$i['Quote_Number'])
            ->select();

        $i['Total_A'] = 0;$i['Total_V'] = 0;$i['Total_Q'] = 0;

        // 计算 打印模板 的 合计值
        foreach ($table as $k => $v){
            $i['Total_A'] += doubleval($v['Net_Amount']);
            $i['Total_V'] += doubleval($v['VAT_Amount']);
            $i['Total_Q'] += doubleval($v['Quote_Amount']);
        }

        // 千位符 保留两位小数 显示
        $z['ta'] = number_format($i['Total_A'], 2);
        $z['tv'] = number_format($i['Total_V'], 2);
        $z['tq'] = number_format($i['Total_Q'], 2);

        // 将金额数据 计算的合计结果 更新至主表
        MkQuoteModel::update([
            'Total_Amount_without_VAT'=>$i['Total_A'],
            'Total_VAT_Amount'=>$i['Total_V'],
            'Total_Quote_Amount'=>$i['Total_Q']
        ], ['id' => $id]);

        // 获取语言版本信息
        $language = session('language');

        // 返回模板视图
        if($language == '中文'){
            // 中文 银行信息
            $bank_info = Db::name('xt_company')->where('cn_name',$i['Issued_by'])
                ->whereOr('en_name',$i['Issued_by'])->value('CN_Bank_Info');

            return view('quotation_cn',['i'=>$i, 'z'=>$z, 'table'=>$table, 'bank_info'=>$bank_info]);
        }else{
            // 英文 银行信息
            $bank_info = Db::name('xt_company')->where('cn_name',$i['Issued_by'])
                ->whereOr('en_name',$i['Issued_by'])->value('EN_Bank_Info');

            return view('quotation_en',['i'=>$i, 'z'=>$z, 'table'=>$table, 'bank_info'=>$bank_info]);
        }
    }

}