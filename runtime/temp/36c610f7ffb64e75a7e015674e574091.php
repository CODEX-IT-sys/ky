<?php /*a:2:{s:78:"D:\largon\laragon\www\ky\application\admin\view\mk_customer\form-Customer.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<a href="<?php echo url('mk_customer/index'); ?>"><?php echo session('language') == '中文'? '客户信息' : 'Customer'; ?></a>

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

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_customer/save'); ?>">

                        <div class="layui-row layui-col-space10">

							<!--编号选择-->
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>">
										<?php echo session('language') == '中文'? '合同编码' : 'Contract Number'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Contract_Number" lay-filter="Contract_Number" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<?php if(is_array($contract_code) || $contract_code instanceof \think\Collection || $contract_code instanceof \think\Paginator): $i = 0; $__LIST__ = $contract_code;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
												<option value="<?php echo htmlentities($v['Contract_Number']); ?>"><?php echo htmlentities($v['Contract_Number']); ?></option>
											<?php endforeach; endif; else: echo "" ;endif; ?>
										</select>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '公司编码' : 'Company Code'; ?>">
										<?php echo session('language') == '中文'? '公司编码' : 'Company Code'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Company_Code" readonly autocomplete="off" placeholder="" class="layui-input" type="text">
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
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '职位' : 'Position'; ?>">
							            <?php echo session('language') == '中文'? '职位' : 'Position'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Position" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '移动电话号码1' : 'Mobile 1'; ?>">
							            <?php echo session('language') == '中文'? '移动电话号码1' : 'Mobile 1'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Mobile1" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '移动电话号码2' : 'Mobile 2'; ?>">
							            <?php echo session('language') == '中文'? '移动电话号码2' : 'Mobile 2'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Mobile2" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
													
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '固定电话号码1' : 'Office Number 1'; ?>">
							            <?php echo session('language') == '中文'? '固定电话号码1' : 'Office Number 1'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Office_Number1" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '固定电话号码2' : 'Office Number 2'; ?>">
							            <?php echo session('language') == '中文'? '固定电话号码2' : 'Office Number 2'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Office_Number2" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '邮箱1' : 'Email 1'; ?>">
							            <?php echo session('language') == '中文'? '邮箱1' : 'Email 1'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Email1" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '邮箱2' : 'Email 2'; ?>">
							            <?php echo session('language') == '中文'? '邮箱2' : 'Email 2'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Email2" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '状态' : 'Status'; ?>">
							            <?php echo session('language') == '中文'? '状态' : 'Status'; ?>
							        </label>
							        <div class="layui-input-block">
										<select name="Status" lay-filter="Status">
											<option value="在职"><?php echo session('language') == '中文'? '在职' : 'On job'; ?></option>
											<option value="离职"><?php echo session('language') == '中文'? '离职' : 'leave office'; ?></option>
										</select>
							        </div>
							    </div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '关联' : 'Link'; ?>">
							            <?php echo session('language') == '中文'? '关联' : 'Link'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Link" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
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
                                        <textarea placeholder="" id="Remarks" name="Remarks" class="layui-textarea"></textarea>
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

		// 下拉选择器值发生变化
		form.on('select(Contract_Number)', function (data) {

			var code = data.value;
			//console.log(code);

            // 选中第一个选项时，不请求数据
            if (data.value === '') {
                return;
            }

			//异步拉取信息
			$.ajax({
				type: 'get',
				url: "<?php echo url('mk_customer/get_info'); ?>",
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

		// 表单验证
		var validatorFunc = function () {
			var validator = new Validator();

            validator.add('Company_Name', [{
                rule: 'require',
                msg: '公司名称不能为空'
            }]);

			// 邮件
			validator.add('Email1', [{
				rule: 'email',
				msg: '邮箱格式错误'
			}]);

			validator.add('Email2', [{
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