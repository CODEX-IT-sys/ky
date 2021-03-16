<?php /*a:2:{s:81:"D:\largon\laragon\www\ky\application\admin\view\mk_inquiry\form-Inquiry-view.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<a href="<?php echo url('mk_inquiry/index'); ?>"><?php echo session('language') == '中文'? '来稿需求' : 'Inquiry'; ?></a>

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

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_inquiry/update'); ?>">

                        <div class="layui-row layui-col-space10">

							<?php if((request()->action() == 'read')): ?>
                            <div class="layui-col-xs4">
                            	<div class="layui-form-item layui_ic">
                            		<label class="layui-form-label" title="<?php echo session('language') == '中文'? '来稿日期' : 'Inquiry Date'; ?>">
                            			<?php echo session('language') == '中文'? '来稿日期' : 'Inquiry Date'; ?>
                            		</label>
                            		<div class="layui-input-block">
                            			<input class="showDate layui-input" name="Inquiry_Date" disabled value="<?php echo htmlentities((isset($info['Inquiry_Date']) && ($info['Inquiry_Date'] !== '')?$info['Inquiry_Date']:'')); ?>" type="text">
                            			<i class="layui-icon layui-icon-date"></i>
                            		</div>
                            	</div>
                            </div>

							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '更新日期' : 'Update Date'; ?>">
										<?php echo session('language') == '中文'? '更新日期' : 'Update Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Update_Date" disabled value="<?php echo htmlentities((isset($info['Update_Date']) && ($info['Update_Date'] !== '')?$info['Update_Date']:'')); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
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
                                    <label class="layui-form-label" title="<?php echo session('language') == '中文'? '销售' : 'Sales'; ?>">
                                        <?php echo session('language') == '中文'? '销售' : 'Sales'; ?>
                                    </label>
                                    <div class="layui-input-block">
                                        <input name="Sales" lay-verify="required" value="<?php echo htmlentities((isset($info['Sales']) && ($info['Sales'] !== '')?$info['Sales']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
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
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>">
							            <?php echo session('language') == '中文'? '公司全称' : 'Company Full Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Company_Full_Name" lay-verify="required" value="<?php echo htmlentities((isset($info['Company_Full_Name']) && ($info['Company_Full_Name'] !== '')?$info['Company_Full_Name']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
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
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>">
							            <?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Contract_Number" readonly value="<?php echo htmlentities((isset($info['Contract_Number']) && ($info['Contract_Number'] !== '')?$info['Contract_Number']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '是否首次合作？' : 'First Cooperation'; ?>">
										<?php echo session('language') == '中文'? '是否首次合作？' : 'First Cooperation'; ?>
									</label>
									<div class="layui-input-block">
										<select name="First_Cooperation" lay-filter="First_Cooperation" lay-search>
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
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>">
										<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>
									</label>
									<div class="layui-input-block">
										<select name="VAT_Rate" lay-filter="VAT_Rate" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($vat_rate) || $vat_rate instanceof \think\Collection || $vat_rate instanceof \think\Paginator): $i = 0; $__LIST__ = $vat_rate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
											<option value="<?php echo htmlentities($v['en_name']); ?>" <?php echo $info['VAT_Rate']==$v['en_name'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
									<span class="signTip">%</span>
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
										<input name="Quote_Amount" value="<?php echo htmlentities($info['Quote_Amount']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
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
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '生成报价（是/否）' : 'Request a Quote'; ?>">
										<?php echo session('language') == '中文'? '生成报价（是/否）' : 'Request a Quote'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Request_a_Quote" readonly value="<?php echo htmlentities((isset($info['Request_a_Quote']) && ($info['Request_a_Quote'] !== '')?$info['Request_a_Quote']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>">
										<?php echo session('language') == '中文'? '报价单编码' : 'Quote Number'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Quote_Number" readonly value="<?php echo htmlentities((isset($info['Quote_Number']) && ($info['Quote_Number'] !== '')?$info['Quote_Number']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
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

							<div class="layui-col-xs12">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>">
										<?php echo session('language') == '中文'? '主体公司银行信息' : 'Subject Company Bank Info'; ?>
									</label>
									<div class="layui-input-block">
										<textarea placeholder="" name="Subject_Company_Bank_Info" readonly class="layui-textarea"><?php echo htmlentities($info['Subject_Company_Bank_Info']); ?></textarea>
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

            // 选中空选项时，不请求数据
            if (data.value === '') {
                return;
            }

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