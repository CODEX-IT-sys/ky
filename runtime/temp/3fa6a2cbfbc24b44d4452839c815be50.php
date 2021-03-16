<?php /*a:2:{s:80:"D:\largon\laragon\www\ky\application\admin\view\mk_invoicing\form-invoicing.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<a href="<?php echo url('mk_invoicing/index'); ?>"><?php echo session('language') == '中文'? '结算管理' : 'Invoicing'; ?></a>
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

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_invoicing/save'); ?>">

                        <div class="layui-row layui-col-space10">
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件编号' : 'Filing Code'; ?>">
							            <?php echo session('language') == '中文'? '文件编号' : 'Filing Code'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Filing_Code" lay-filter="Filing_Code" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($file_code) || $file_code instanceof \think\Collection || $file_code instanceof \think\Paginator): $i = 0; $__LIST__ = $file_code;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['Filing_Code']); ?>"><?php echo htmlentities($v['Filing_Code']); ?></option>
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
                                        <input name="Sales" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
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
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>">
							            <?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Full_Name" id="gsqc" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>														

							<!--系统生成-->
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '请款单编号' : 'Invoice Number'; ?>">
							            <?php echo session('language') == '中文'? '请款单编号' : 'Invoice Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Invoice_Number" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>">
							            <?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Job_Name" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '页数' : 'Pages'; ?>">
							            <?php echo session('language') == '中文'? '页数' : 'Pages'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Pages" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '源语数量' : 'Source Text Word Count'; ?>">
							            <?php echo session('language') == '中文'? '源语数量' : 'Source Text Word Count'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Source_Text_Word_Count" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件类型' : 'File Type'; ?>">
										<?php echo session('language') == '中文'? '文件类型' : 'File Type'; ?>
									</label>
									<div class="layui-input-block">
										<select name="File_Type" lay-filter="File_Type" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($File_Type) || $File_Type instanceof \think\Collection || $File_Type instanceof \think\Paginator): $i = 0; $__LIST__ = $File_Type;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '服务' : 'Service'; ?>">
										<?php echo session('language') == '中文'? '服务' : 'Service'; ?>
									</label>
									<div class="layui-input-block">
										<div id="fw" class="xm-select-demo"></div>
										<input name="Service" id="Service" type="hidden" value="" autocomplete="off" placeholder="" class="layui-input">
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '语种' : 'Language'; ?>">
										<?php echo session('language') == '中文'? '语种' : 'Language'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Language" lay-filter="Language" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($yy) || $yy instanceof \think\Collection || $yy instanceof \think\Paginator): $i = 0; $__LIST__ = $yy;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
							        </div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '交付日期' : 'Completed'; ?>">
										<?php echo session('language') == '中文'? '交付日期' : 'Completed'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Completed" type="text">
										<i class="layui-icon layui-icon-date"></i>
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
											<option value="<?php echo htmlentities($v['en_name']); ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
							        </div>
								</div>
							</div>

                            <div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>">
										<?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Unit_Price" id="dj" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '单位' : 'Units'; ?>">
										<?php echo session('language') == '中文'? '单位' : 'Units'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Units" lay-filter="Units" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($units) || $units instanceof \think\Collection || $units instanceof \think\Paginator): $i = 0; $__LIST__ = $units;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo session('language')=='中文'?$v['cn_name']:$v['en_name']; ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
							        </div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>">
							            <?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>
							        </label>
							        <div class="layui-input-block">
										<select id="sl" name="VAT_Rate" lay-filter="VAT_Rate" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($vat_rate) || $vat_rate instanceof \think\Collection || $vat_rate instanceof \think\Paginator): $i = 0; $__LIST__ = $vat_rate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>"><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
							        </div>
									<span class="signTip">%</span>
							    </div>
							</div>
														
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '交付数量' : 'Unit Quantity'; ?>">
							            <?php echo session('language') == '中文'? '交付数量' : 'Unit Quantity'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Unit_Quantity" id="jfsl" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '未税金额' : 'Net Amount'; ?>">
							            <?php echo session('language') == '中文'? '未税金额' : 'Net Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Net_Amount" id="wsje" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '增值税额' : 'VAT Amount'; ?>">
							            <?php echo session('language') == '中文'? '增值税额' : 'VAT Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="VAT_Amount" id="zzse" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '折扣' : 'Discount'; ?>">
							            <?php echo session('language') == '中文'? '折扣' : 'Discount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Discount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '请款金额' : 'Invoicing Amount'; ?>">
							            <?php echo session('language') == '中文'? '请款金额' : 'Invoicing Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Invoicing_Amount" id="qkje" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '请款日期' : 'Invoicing Date'; ?>">
										<?php echo session('language') == '中文'? '请款日期' : 'Invoicing Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Invoicing_Date" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>														
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? 'PO号' : 'PO Number'; ?>">
							            <?php echo session('language') == '中文'? 'PO号' : 'PO Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="PO_Number" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? 'PO金额' : 'PO Amount'; ?>">
							            <?php echo session('language') == '中文'? 'PO金额' : 'PO Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="PO_Amount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? 'PO剩余金额' : 'PO Balance'; ?>">
							            <?php echo session('language') == '中文'? 'PO剩余金额' : 'PO Balance'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="PO_Balance" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<!--按钮 改变 状态-->
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '生成请款单' : 'Apply to Pay'; ?>">
							            <?php echo session('language') == '中文'? '生成请款单' : 'Apply to Pay'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Apply_to_Pay" lay-filter="Apply_to_Pay" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>">
							            <?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Number" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>">
							            <?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Quantity" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>">
							            <?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Amount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '状态' : 'Status'; ?>">
							            <?php echo session('language') == '中文'? '状态' : 'Status'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Status" lay-filter="Status" lay-search>
											<option value="项目进行中">项目进行中</option>
											<option value="等待结算">等待结算</option>
											<option value="发票生成">发票生成</option>
											<option value="等待付款">等待付款</option>
											<option value="付款完成">付款完成</option>
											<option value="项目已取消">项目已取消</option>
										</select>
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '发票类型' : 'Fapiao Type'; ?>">
										<?php echo session('language') == '中文'? '发票类型' : 'Fapiao Type'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Fapiao_Type" lay-filter="Fapiao_Type" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="专票">专票</option>
											<option value="普票">普票</option>
										</select>
									</div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '开票金额' : 'Fapiao Amount'; ?>">
							            <?php echo session('language') == '中文'? '开票金额' : 'Fapiao Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Fapiao_Amount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>																				
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '开票日期' : 'Fapiao Date'; ?>">
										<?php echo session('language') == '中文'? '开票日期' : 'Fapiao Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Fapiao_Date" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '发票编码' : 'Fapiao Code'; ?>">
							            <?php echo session('language') == '中文'? '发票编码' : 'Fapiao Code'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Fapiao_Code" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
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
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '预付款(是/否)' : 'Pre Payment'; ?>">
							            <?php echo session('language') == '中文'? '预付款(是/否)' : 'Pre Payment'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Pre_Payment" lay-filter="Pre_Payment" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '预付款日期' : 'Pre Payment Date'; ?>">
										<?php echo session('language') == '中文'? '预付款日期' : 'Pre Payment Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Pre_Payment_Date" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '预付款金额' : 'Pre Payment Amount'; ?>">
							            <?php echo session('language') == '中文'? '预付款金额' : 'Pre Payment Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Pre_Payment_Amount" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '余款' : 'The Balance'; ?>">
							            <?php echo session('language') == '中文'? '余款' : 'The Balance'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="The_Balance" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '余款支付日期' : 'Date of Balance'; ?>">
										<?php echo session('language') == '中文'? '余款支付日期' : 'Date of Balance'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Date_of_Balance" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '余款付清' : 'Balance Done'; ?>">
							            <?php echo session('language') == '中文'? '余款付清' : 'Balance Done'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Balance_Done" lay-filter="Balance_Done" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
							        </div>
							    </div>
							</div>

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
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>">
										<?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" id="Customer_Requirements" name="Customer_Requirements" class="layui-textarea"></textarea>
									</div>
								</div>
							</div>

							<div class="layui-col-xs6">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户参考文件' : 'External Reference File'; ?>">
										<?php echo session('language') == '中文'? '客户参考文件' : 'External Reference File'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" id="External_Reference_File" name="External_Reference_File" class="layui-textarea"></textarea>
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

        // 服务多选
        var fw = '<?php echo $service_type; ?>';
        var fwData = JSON.parse(fw);
        var fwz = xmSelect.render({
            el: '#fw',
            toolbar: {
                show: true,
                list: [ 'ALL', 'CLEAR', 'REVERSE' ]
            },
            paging: true,
            pageSize: 10,
            filterable: true,
            pageEmptyShow: false,
            theme: {
                color: '#0073FF'
            },
            data: fwData
        });

		// 下拉选择器值发生变化
		form.on('select(Filing_Code)', function (data) {
			var code = data.value;
			//console.log(code);

			//异步拉取信息
			$.ajax({
				type: 'get',
				url: "<?php echo url('pj_contract_review/get_info'); ?>",
				data: {'code': code},
				dataType: 'json',
				success: function (res) {
					//console.log(res.data);
					var info = res.data;

					// 文本框写入默认值
					$.each(info, function (name, value) {
                        // input
                        $('#form [name=' + name + ']').val(value);
                        // select
                        $('#form select[name=' + name + ']').prop("selected", 'selected');
                        // 重新渲染表单
                        form.render();
					});
				}
			})
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

		// 公司全称 改变 关联 开票信息
		$('#gsqc').change(function () {

			var data = $('#gsqc').val();

			if(data){
				//异步拉取信息
				$.ajax({
					type: 'get',
					url: "<?php echo url('get_kp_info'); ?>",
					data: {'data':data},
					dataType: 'json',
					success: function (res) {
						console.log(res.data);
						var info = res.data;

						// 文本框写入默认值
						$.each(info, function (name, value) {
							// input
							$('#form [name=' + name + ']').val(value);

							// 重新渲染表单
							form.render();
						});
					}
				});
			}
		});


		// 单价
		$('#dj').change(function () {

			var jfsl = $.trim($('#jfsl').val());
			var sl = $.trim($('#sl').val());
			var dj = $.trim($('#dj').val());

			jfsl?jfsl:0; dj?dj:0; sl?sl:0;

			// 未税金额
			var wsje = Number(jfsl) * Number(dj);

			// 增值税额
			var zzse = Number(jfsl) * Number(dj) * sl/100;

			// 请款金额
			var qkje = Number(wsje) + Number(zzse);

			$('#wsje').val(wsje);

			$('#zzse').val(zzse);

			$('#qkje').val(qkje);
		});

		// 报价数量
		$('#jfsl').change(function () {

			var jfsl = $.trim($('#jfsl').val());
			var sl = $.trim($('#sl').val());
			var dj = $.trim($('#dj').val());

			jfsl?jfsl:0; dj?dj:0; sl?sl:0;

			// 未税金额
			var wsje = Number(jfsl) * Number(dj);

			// 增值税额
			var zzse = Number(jfsl) * Number(dj) * sl/100;

			// 请款金额
			var qkje = Number(wsje) + Number(zzse);

			$('#wsje').val(wsje);

			$('#zzse').val(zzse);

			$('#qkje').val(qkje);
		});


		// 未税金额
		$('#wsje').change(function () {

			// 未税金额
			var wsje = $.trim($('#wsje').val());

			// 增值税额
			var zzse = $.trim($('#zzse').val());

			wsje?wsje:0; zzse?zzse:0;

			// 请款金额
			var qkje = Number(wsje) + Number(zzse);

			$('#qkje').val(qkje);
		});

		// 增值金额
		$('#zzse').change(function () {

			// 未税金额
			var wsje = $.trim($('#wsje').val());

			// 增值税额
			var zzse = $.trim($('#zzse').val());

			wsje?wsje:0; zzse?zzse:0;

			// 请款金额
			var qkje = Number(wsje) + Number(zzse);

			$('#qkje').val(qkje);
		});

		// 表单验证
		var validatorFunc = function () {
			var validator = new Validator();

			validator.add('Filing_Code', [{
				rule: 'require',
				msg: '文件编号不能为空'
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

            var tip = layer.msg('Data Uploading', {icon: 16, shade: 0.3, time:5000});

            //获取当前多选选中的值
            var fwArr = fwz.getValue();
            var fwLength = fwArr.length;
            var fwnamestr = '';
            for(var i=0; i< fwLength; i++ ) {
                fwnamestr += fwArr[i].name + ',';
            }
            fwnamestr = fwnamestr.substring(0, fwnamestr.length - 1);
            $('#Service').val(fwnamestr);

			// 表单提交
			$('#form').submit();
		});
	})
</script>

</body>
</html>