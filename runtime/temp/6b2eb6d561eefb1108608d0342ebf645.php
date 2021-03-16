<?php /*a:2:{s:78:"D:\largon\laragon\www\ky\application\admin\view\mk_contract\form-Contract.html";i:1615863965;s:18:"./layout/list.html";i:1615863909;}*/ ?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>CODEX</title>
    <link rel="shortcut icon" href="/static/images/logo-icon.ico">
    <link rel="stylesheet" type="text/css" href="/static/css/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/iconfont/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" />
    
    <link rel="stylesheet" type="text/css" href="/static/css/main.css" />

</head>
<body>


<div class="hn_body">
    <div class="layui-fluid">
        <div class="layui-row">
            <div class="top">
                <div class="position_lead">
                    <i class="iconfont icon-navigation"></i>
                    <a href="#"><?php echo session('language') == '中文'? '客户管理' : 'Customer Management'; ?></a>
                    <a href="<?php echo url('mk_contract/index'); ?>"><?php echo session('language') == '中文'? '合同信息' : 'Contract & Administrative Activities'; ?></a>
                </div>
                <div class="global_btn">
                    <button class="layui-btn" id="save"><?php echo session('language') == '中文'? '保存' : 'Save'; ?></button>

                    <a href="javascript:history.back(-1);">
                        <button class="layui-btn layui-btn-primary" type="button"><?php echo session('language') == '中文'? '返回' : 'Back'; ?></button>
                    </a>
                </div>
            </div>
            <div class="mainCt mainSec formReset signLimit">
                <div class="mainWrap">

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_contract/save'); ?>">

                        <div class="layui-row layui-col-space10">
							
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司' : 'Subject Company'; ?>">
										<?php echo session('language') == '中文'? '主体公司' : 'Subject Company'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Subject_Company" lay-filter="Subject_Company" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($gs) || $gs instanceof \think\Collection || $gs instanceof \think\Paginator): $i = 0; $__LIST__ = $gs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>
                            
                            <div class="layui-col-xs4">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" title="<?php echo session('language') == '中文'? '销售' : 'Sales'; ?>">
                                        <?php echo session('language') == '中文'? '销售' : 'Sales'; ?>
                                    </label>
                                    <div class="layui-input-block">
										<select name="Sales" lay-filter="Sales" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($sales) || $sales instanceof \think\Collection || $sales instanceof \think\Paginator): $i = 0; $__LIST__ = $sales;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['name']); ?>"><?php echo htmlentities($v['name']); ?> </option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
<!--
                                        <input name="Sales" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
-->
                                    </div>
                                </div>
                            </div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>">
							            <?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Attention" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '所在部门' : 'Department'; ?>">
							            <?php echo session('language') == '中文'? '所在部门' : 'Department'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Department" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>">
							            <?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Full_Name" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司名称' : 'Company Name'; ?>">
							            <?php echo session('language') == '中文'? '公司名称' : 'Company Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Name" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同签订人（若不同于联系人）' : 'Contract Signer'; ?>">
							            <?php echo session('language') == '中文'? '合同签订人（若不同于联系人）' : 'Contract Signer'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Contract_Signer" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '所在部门（若不同于联系人）' : 'Signer is Department'; ?>">
							            <?php echo session('language') == '中文'? '所在部门（若不同于联系人）' : 'Signer is Department'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Signer_is_Department" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司地址' : 'Company Address'; ?>">
							            <?php echo session('language') == '中文'? '公司地址' : 'Company Address'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Address" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '国家' : 'Country'; ?>">
							            <?php echo session('language') == '中文'? '国家' : 'Country'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Country" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '移动电话号码' : 'Mobile'; ?>">
							            <?php echo session('language') == '中文'? '移动电话号码' : 'Mobile'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Mobile" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '电话号码' : 'Telephone Number'; ?>">
							            <?php echo session('language') == '中文'? '电话号码' : 'Telephone Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Telephone_Number" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '邮箱' : 'Email'; ?>">
							            <?php echo session('language') == '中文'? '邮箱' : 'Email'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Email" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<!--手填 必填项 后续各种编码生成的基础-->
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司编码' : 'Company Code'; ?>">
							            <?php echo session('language') == '中文'? '公司编码' : 'Company Code'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Code" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '服务' : 'Service'; ?>">
							            <?php echo session('language') == '中文'? '服务' : 'Service'; ?>
							        </label>
									<div class="layui-input-block">
										<input name="Service" id="Service" autocomplete="off" placeholder="" class="layui-input">
									</div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '语种' : 'Language'; ?>">
							            <?php echo session('language') == '中文'? '语种' : 'Language'; ?>
							        </label>
							        <div class="layui-input-block">
										<input name="Language" id="Language" autocomplete="off" placeholder="" class="layui-input">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>">
										<?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Unit_Price" id="Unit_Price" autocomplete="off" placeholder="" class="layui-input">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '单位' : 'Units'; ?>">
										<?php echo session('language') == '中文'? '单位' : 'Units'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Units" id="Units" autocomplete="off" placeholder="" class="layui-input">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '币种' : 'Currency'; ?>">
										<?php echo session('language') == '中文'? '币种' : 'Currency'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Currency" lay-filter="Currency" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($currency) || $currency instanceof \think\Collection || $currency instanceof \think\Paginator): $i = 0; $__LIST__ = $currency;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['name']); ?>"><?php echo htmlentities($v['name']); ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '预计销售额' : 'Sales Forecasted'; ?>">
										<?php echo session('language') == '中文'? '预计销售额' : 'Sales Forecasted'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Sales_Forecasted" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>">
										<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>
									</label>
									<div class="layui-input-block">
										<select name="VAT_Rate" lay-filter="VAT_Rate" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($vat_rate) || $vat_rate instanceof \think\Collection || $vat_rate instanceof \think\Paginator): $i = 0; $__LIST__ = $vat_rate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?> </option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
									<span class="signTip">%</span>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户税号' : 'Customer VAT No'; ?>">
										<?php echo session('language') == '中文'? '客户税号' : 'Customer VAT No'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Customer_VAT_No" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '单位地址' : 'Customer Address'; ?>">
										<?php echo session('language') == '中文'? '单位地址' : 'Customer Address'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Customer_Address" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '电话' : 'Customer Phone'; ?>">
										<?php echo session('language') == '中文'? '电话' : 'Customer Phone'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Customer_Phone" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '开户银行' : 'Customer Bank'; ?>">
										<?php echo session('language') == '中文'? '开户银行' : 'Customer Bank'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Customer_Bank" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '银行账号' : 'Customer Bank Account'; ?>">
										<?php echo session('language') == '中文'? '银行账号' : 'Customer Bank Account'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Customer_Bank_Account" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>

														
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '开票规则' : 'Invoicing Policy'; ?>">
							            <?php echo session('language') == '中文'? '开票规则' : 'Invoicing Policy'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Invoicing_Policy" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '账期（结算方式）' : 'Account Period'; ?>">
							            <?php echo session('language') == '中文'? '账期（结算方式）' : 'Account Period'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Account_Period" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
														
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '有无保密协议' : 'NDA'; ?>">
										<?php echo session('language') == '中文'? '有无保密协议' : 'NDA'; ?>
									</label>
									<div class="layui-input-block">
										<select name="NDA" lay-filter="NDA" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
											<option value="N/A">N/A</option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '生效日期' : 'Effective Date'; ?>">
										<?php echo session('language') == '中文'? '生效日期' : 'Effective Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Effective_Date" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '失效日期' : 'Expired Date'; ?>">
										<?php echo session('language') == '中文'? '失效日期' : 'Expired Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Expired_Date" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同收件人' : 'Contract Recipient'; ?>">
							            <?php echo session('language') == '中文'? '合同收件人' : 'Contract Recipient'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Contract_Recipient" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同收件地址' : 'Contract Recipient Address'; ?>">
							            <?php echo session('language') == '中文'? '合同收件地址' : 'Contract Recipient Address'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Contract_Recipient_Address" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司税号' : 'Subject Company VAT ID'; ?>">
										<?php echo session('language') == '中文'? '主体公司税号' : 'Subject Company VAT ID'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Subject_Company_VAT_ID" lay-verify="required" autocomplete="off" placeholder="" readonly class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司地址' : 'Subject Company Address'; ?>">
										<?php echo session('language') == '中文'? '主体公司地址' : 'Subject Company Address'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Subject_Company_Address" lay-verify="required" autocomplete="off" placeholder="" readonly class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs6">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>">
										<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" id="Subject_Company_Bank_Info" name="Subject_Company_Bank_Info" readonly class="layui-textarea"></textarea>
									</div>
								</div>
							</div>

							<div class="layui-col-xs6">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '备注' : 'Remarks'; ?>">
										<?php echo session('language') == '中文'? '备注' : 'Remarks'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" name="Remarks" class="layui-textarea"></textarea>
									</div>
								</div>
							</div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>



<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/list.js"></script>
<script type="text/javascript" src="/static/js/url.js"></script>
<script type="text/javascript" src="/static/js/validator.js"></script>


<script type="text/javascript" src="/static/js/xm-select.js"></script>

<script>

	layui.use(['form','laydate'], function () {
		var form = layui.form, laydate = layui.laydate,layer = layui.layer;
        var language = "<?php echo session('language'); ?>";

		//同时绑定多个,单个日期选择，显示在input里面
		$('.showDate').click(function () {
			laydate.render({
				elem: this
				,trigger: 'click'
				,theme: '#1B3382'
				,position: 'fixed'
				//,isInitValue: true
				//,value: new Date()
				//,type:'datetime'
				,format: 'yyyyMMdd'
			});
		});

        // 主体公司 下拉选择器值发生变化
        form.on('select(Subject_Company)', function (data) {
            var name = data.value;
            //console.log(name);

            //异步拉取信息
            $.ajax({
                type: 'get',
                url: "<?php echo url('xt_company/get_info'); ?>",
                data: {'name': name},
                dataType: 'json',
                success: function (res) {
                    //console.log(res.data);
                    var info = res.data;

                    $('#form [name=Subject_Company_VAT_ID]').val(info.VAT_ID);

                    // 判断语言
                    if(language === '中文') {
                        $('#form [name=Subject_Company_Address]').val(info.CN_Address);
                        $('#form [name=Subject_Company_Bank_Info]').val(info.CN_Bank_Info);
                    }else{
                        $('#form [name=Subject_Company_Address]').val(info.EN_Address);
                        $('#form [name=Subject_Company_Bank_Info]').val(info.EN_Bank_Info);
					}
                }
            })
        });

		// 表单验证
		var validatorFunc = function () {
			var validator = new Validator();

            validator.add('Sales', [{
                rule: 'require',
                msg: '销售不能为空'
            }]);

            validator.add('Attention', [{
                rule: 'require',
                msg: '客户联系人不能为空'
            }]);

            validator.add('Company_Full_Name', [{
                rule: 'require',
                msg: '公司全称不能为空'
            }]);

            validator.add('Company_Name', [{
                rule: 'require',
                msg: '公司名称不能为空'
            }]);

			validator.add('Company_Code', [{
				rule: 'require',
				msg: '公司编码不能为空'
			}, {
				rule: 'max:5',
				msg: '公司编码不能超过5个字符'
			}]);

			validator.add('Effective_Date', [{
				rule: 'require',
				msg: '生效日期不能为空'
			}]);

			validator.add('Expired_Date', [{
				rule: 'require',
				msg: '失效日期不能为空'
			}]);

			// 邮件
			validator.add('Email', [{
				rule: 'email',
				msg: '邮箱格式错误'
			}]);
			
			return validator.start();
		};

		// 数据提交
		$('#save').on('click', function () {

			// 表单验证
			var errorMsg = validatorFunc();
			if (errorMsg) {
				layer.alert(errorMsg, {title: '提示'});
				return false;
			}

            var tip = layer.msg('Data Uploading', {icon: 16, shade: 0.3, time:3000});

			// 表单提交
			$('#form').submit();
		});
	})
</script>


</body>
</html>