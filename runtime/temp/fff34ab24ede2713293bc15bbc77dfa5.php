<?php /*a:2:{s:89:"D:\largon\laragon\www\ky\application\admin\view\mk_feseability\form-Feseability-view.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<a href="<?php echo url('mk_feseability/index'); ?>"><?php echo session('language') == '中文'? '来稿确认' : 'Feasibility'; ?></a>
				</div>
				<div class="global_btn">
					<?php if((request()->action() !== 'read')): ?>
					<button class="layui-btn" id="save"><?php echo session('language') == '中文'? '保存' : 'Save'; ?></button>
					<?php endif; ?>

					<a href="javascript:history.back(-1);">
						<button class="layui-btn layui-btn-primary" type="button"><?php echo session('language') == '中文'? '返回' : 'Back'; ?></button>
					</a>
				</div>
			</div>
            <div class="mainCt mainSec formReset signLimit">
                <div class="mainWrap">

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_feseability/update'); ?>">

                        <div class="layui-row layui-col-space10">

							<?php if((request()->action() == 'read')): ?>
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '委托日期' : 'Assigned Date'; ?>">
										<?php echo session('language') == '中文'? '委托日期' : 'Assigned Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="Date layui-input" name="Assigned_Date" readonly value="<?php echo htmlentities((isset($info['Assigned_Date']) && ($info['Assigned_Date'] !== '')?$info['Assigned_Date']:'')); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件编号' : 'Filing_Code'; ?>">
							            <?php echo session('language') == '中文'? '文件编号' : 'Filing_Code'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Filing_Code" readonly value="<?php echo htmlentities((isset($info['Filing_Code']) && ($info['Filing_Code'] !== '')?$info['Filing_Code']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>">
										<?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Contract_Number" lay-verify="required" readonly value="<?php echo htmlentities((isset($info['Contract_Number']) && ($info['Contract_Number'] !== '')?$info['Contract_Number']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<?php endif; ?>
                            
                            <div class="layui-col-xs4">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" title="<?php echo session('language') == '中文'? '销售' : 'Sales'; ?>">
                                        <?php echo session('language') == '中文'? '销售' : 'Sales'; ?>
                                    </label>
                                    <div class="layui-input-block">
                                        <input name="Sales" lay-verify="required" autocomplete="off" value="<?php echo htmlentities((isset($info['Sales']) && ($info['Sales'] !== '')?$info['Sales']:'')); ?>" placeholder="" class="layui-input" type="text">
                                    </div>
                                </div>
                            </div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>">
							            <?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Attention" lay-verify="required" value="<?php echo htmlentities((isset($info['Attention']) && ($info['Attention'] !== '')?$info['Attention']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '所在部门' : 'Department'; ?>">
							            <?php echo session('language') == '中文'? '所在部门' : 'Department'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Department" lay-verify="required" value="<?php echo htmlentities((isset($info['Department']) && ($info['Department'] !== '')?$info['Department']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>														
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司名称' : 'Company Name'; ?>">
							            <?php echo session('language') == '中文'? '公司名称' : 'Company Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Name" lay-verify="required" value="<?php echo htmlentities((isset($info['Company_Name']) && ($info['Company_Name'] !== '')?$info['Company_Name']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>							
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>">
							            <?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Job_Name" lay-verify="required" value="<?php echo htmlentities((isset($info['Job_Name']) && ($info['Job_Name'] !== '')?$info['Job_Name']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '页数' : 'Pages'; ?>">
							            <?php echo session('language') == '中文'? '页数' : 'Pages'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Pages" lay-verify="required" value="<?php echo htmlentities((isset($info['Pages']) && ($info['Pages'] !== '')?$info['Pages']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '源语数量' : 'Source Text Word Count'; ?>">
							            <?php echo session('language') == '中文'? '源语数量' : 'Source Text Word Count'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Source_Text_Word_Count" lay-verify="required" value="<?php echo htmlentities((isset($info['Source_Text_Word_Count']) && ($info['Source_Text_Word_Count'] !== '')?$info['Source_Text_Word_Count']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件类型' : 'File Type'; ?>">
										<?php echo session('language') == '中文'? '文件类型' : 'File Type'; ?>
									</label>
									<div class="layui-input-block">
										<select name="File_Type" lay-filter="File_Type">
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($File_Type) || $File_Type instanceof \think\Collection || $File_Type instanceof \think\Paginator): $i = 0; $__LIST__ = $File_Type;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>" <?php echo $info['File_Type']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
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
										<input name="Service" id="Service" type="hidden" value="<?php echo htmlentities($info['Service']); ?>" autocomplete="off" placeholder="" class="layui-input">
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
											<option value="<?php echo htmlentities($v['en_name']); ?>" <?php echo $info['Language']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
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
											<option value="<?php echo htmlentities($v['en_name']); ?>" <?php echo $info['Currency']==$v['cn_name'] ? 'selected' : ''; ?> <?php echo $info['Currency']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
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
                                        <input name="Unit_Price" lay-verify="required" value="<?php echo htmlentities((isset($info['Unit_Price']) && ($info['Unit_Price'] !== '')?$info['Unit_Price']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
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
											<option value="<?php echo session('language')=='中文'?$v['cn_name']:$v['en_name']; ?>" <?php echo $info['Units']==$v['cn_name'] ? 'selected' : ''; ?> <?php echo $info['Units']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>

							<!--自动生成-->
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>">
							            <?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Number" lay-verify="required" value="<?php echo htmlentities((isset($info['Quote_Number']) && ($info['Quote_Number'] !== '')?$info['Quote_Number']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>">
							            <?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Quantity" lay-verify="required" value="<?php echo htmlentities((isset($info['Quote_Quantity']) && ($info['Quote_Quantity'] !== '')?$info['Quote_Quantity']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>">
										<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>
									</label>
									<div class="layui-input-block">
										<input name="VAT_Rate" value="<?php echo htmlentities($info['VAT_Rate']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '增值税额' : 'VAT Amount'; ?>">
										<?php echo session('language') == '中文'? '增值税额' : 'VAT Amount'; ?>
									</label>
									<div class="layui-input-block">
										<input name="VAT_Amount" value="<?php echo htmlentities($info['VAT_Amount']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>">
										<?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Quote_Amount" lay-verify="required" value="<?php echo htmlentities((isset($info['Quote_Amount']) && ($info['Quote_Amount'] !== '')?$info['Quote_Amount']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户期望提交日期' : 'Delivery Date Expected'; ?>">
										<?php echo session('language') == '中文'? '客户期望提交日期' : 'Delivery Date Expected'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Delivery_Date_Expected" value="<?php echo htmlentities((isset($info['Delivery_Date_Expected']) && ($info['Delivery_Date_Expected'] !== '')?$info['Delivery_Date_Expected']:'')); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>

							<!--PM ?-->

							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '交付日期' : 'Completed'; ?>">
										<?php echo session('language') == '中文'? '交付日期' : 'Completed'; ?>
									</label>
									<div class="layui-input-block">
										<input class="Date layui-input" name="Completed" value="<?php echo htmlentities((isset($info['Completed']) && ($info['Completed'] !== '')?$info['Completed']:'')); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '是否首次合作？' : 'First Cooperation'; ?>">
							            <?php echo session('language') == '中文'? '是否首次合作？' : 'First Cooperation'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="First_Cooperation" lay-filter="First_Cooperation">
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($first) || $first instanceof \think\Collection || $first instanceof \think\Paginator): $i = 0; $__LIST__ = $first;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>" <?php echo $info['First_Cooperation']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '生成项目需求' : 'Project Requirements'; ?>">
							            <?php echo session('language') == '中文'? '生成项目需求' : 'Project Requirements'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Project_Requirements" lay-filter="Project_Requirements">
											<option value="No" <?php echo $info['Project_Requirements']=="No" ? 'selected' : ''; ?>>No</option>
											<option value="Yes" <?php echo $info['Project_Requirements']=="Yes" ? 'selected' : ''; ?>>Yes</option>
										</select>
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '生成报价' : 'Request a Quote'; ?>">
										<?php echo session('language') == '中文'? '生成报价' : 'Request a Quote'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Request_a_Quote" lay-filter="Request_a_Quote">
											<option value="No" <?php echo $info['Request_a_Quote']=="No" ? 'selected' : ''; ?>>No</option>
											<option value="Yes" <?php echo $info['Request_a_Quote']=="Yes" ? 'selected' : ''; ?>>Yes</option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '重复文件' : 'Repeated Document'; ?>">
							            <?php echo session('language') == '中文'? '重复文件' : 'Repeated Document'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Repeated_Document" lay-filter="Repeated_Document">
											<option value="No" <?php echo $info['Repeated_Document']=="No" ? 'selected' : ''; ?>>No</option>
											<option value="Yes" <?php echo $info['Repeated_Document']=="Yes" ? 'selected' : ''; ?>>Yes</option>
										</select>
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '项目经理' : 'PM'; ?>">
										<?php echo session('language') == '中文'? '项目经理' : 'PM'; ?>
									</label>
									<div class="layui-input-block">
										<select name="PM" lay-filter="PM" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($pm) || $pm instanceof \think\Collection || $pm instanceof \think\Paginator): $i = 0; $__LIST__ = $pm;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['name']); ?>" <?php echo $info['PM']==$v['name'] ? 'selected' : ''; ?>><?php echo htmlentities($v['name']); ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>

							<!--管理层 允许手动修改状态-->
							<?php if($show == 1): ?>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '市场行政经理批准' : 'Approval Head of Sales Admin'; ?>">
										<?php echo session('language') == '中文'? '市场行政经理批准' : 'Approval Head of Sales Admin'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Approval_Sales_Admin_Manager" lay-verify="required" value="<?php echo htmlentities((isset($info['Approval_Sales_Admin_Manager']) && ($info['Approval_Sales_Admin_Manager'] !== '')?$info['Approval_Sales_Admin_Manager']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '总经理批准' : 'Approval General Manager'; ?>">
										<?php echo session('language') == '中文'? '总经理批准' : 'Approval General Manager'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Approval_General_Manager" lay-verify="required" value="<?php echo htmlentities((isset($info['Approval_General_Manager']) && ($info['Approval_General_Manager'] !== '')?$info['Approval_General_Manager']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							<?php endif; ?>


							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司' : 'Subject Company'; ?>">
										<?php echo session('language') == '中文'? '主体公司' : 'Subject Company'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Subject_Company" lay-filter="Subject_Company" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($gs) || $gs instanceof \think\Collection || $gs instanceof \think\Paginator): $i = 0; $__LIST__ = $gs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?>" <?php echo $gs_id==$v['id'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
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
										<input name="Subject_Company_VAT_ID" value="<?php echo htmlentities($info['Subject_Company_VAT_ID']); ?>" autocomplete="off" placeholder="" readonly class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司地址' : 'Subject Company Address'; ?>">
										<?php echo session('language') == '中文'? '主体公司地址' : 'Subject Company Address'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Subject_Company_Address" value="<?php echo htmlentities($info['Subject_Company_Address']); ?>" autocomplete="off" placeholder="" readonly class="layui-input" type="text">
									</div>
								</div>
							</div>
						</div>

						<div class="layui-row layui-col-space10">

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>">
										<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" name="Subject_Company_Bank_Info" readonly class="layui-textarea"><?php echo htmlentities($info['Subject_Company_Bank_Info']); ?></textarea>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>">
										<?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" id="Customer_Requirements" name="Customer_Requirements" class="layui-textarea"><?php echo htmlentities((isset($info['Customer_Requirements']) && ($info['Customer_Requirements'] !== '')?$info['Customer_Requirements']:'')); ?></textarea>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户参考文件' : 'External Reference File'; ?>">
										<?php echo session('language') == '中文'? '客户参考文件' : 'External Reference File'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" id="External_Reference_File" name="External_Reference_File" class="layui-textarea"><?php echo htmlentities((isset($info['External_Reference_File']) && ($info['External_Reference_File'] !== '')?$info['External_Reference_File']:'')); ?></textarea>
									</div>
								</div>
							</div>

							<div class="layui-col-xs12">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '备注' : 'Remarks'; ?>">
										<?php echo session('language') == '中文'? '备注' : 'Remarks'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" name="Remarks" class="layui-textarea"><?php echo htmlentities($info['Remarks']); ?></textarea>
									</div>
								</div>
							</div>

							<input type="hidden" name="id" value="<?php echo htmlentities($info['id']); ?>" />
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
		$('.Date').click(function () {
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

        //同时绑定多个,单个日期选择，显示在input里面
        $('.showDate').click(function () {
            laydate.render({
                elem: this
                ,trigger: 'click'
                ,theme: '#1B3382'
                ,position: 'fixed'
                ,type:'datetime'
                ,format: 'yyyy-MM-dd HH:mm'
                ,ready: function(date){
                    this.dateTime.hours=23;
                    this.dateTime.minutes=0;
                    //this.dateTime.seconds=59;
                }
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

			// 日期必填项
			/*validator.add('Delivery_Date_Expected', [{
				rule: 'require',
				msg: '客户期望提交日期不能为空'
			}]);

			validator.add('Completed', [{
				rule: 'require',
				msg: '交付日期不能为空'
			}]);*/

			// 金额验证
			validator.add('Unit_Price', [{
				rule: 'price',
				msg: '单价金额数据错误'
			}]);

			// 数值验证
			validator.add('Pages', [{
				rule: 'isNum',
				msg: '页数只允许是数值数据'
			}]);

			validator.add('Source_Text_Word_Count', [{
				rule: 'isNum',
				msg: '源语数量只允许是数值数据'
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