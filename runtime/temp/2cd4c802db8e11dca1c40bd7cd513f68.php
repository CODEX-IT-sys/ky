<?php /*a:2:{s:77:"D:\largon\laragon\www\ky\application\admin\view\mk_quote\form-Quote-view.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<a><?php echo session('language') == '中文'? '客户管理' : 'Customer Management'; ?></a>
					<a href="<?php echo url('mk_inquiry/index'); ?>"><?php echo session('language') == '中文'? '来稿需求' : 'Inquiry'; ?></a>
					<a class="on"><?php echo session('language') == '中文'? '报价单' : 'Quote'; ?></a>
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

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_quote/update'); ?>">

                        <div class="layui-row layui-col-space10">

							<!--报价单 编码-->

							<!--公司名称-->
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="To">To</label>
									<div class="layui-input-block">
										<input name="To" value="<?php echo htmlentities($info['To']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>">
							            <?php echo session('language') == '中文'? '客户联系人' : 'Attention'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Attention" value="<?php echo htmlentities($info['Attention']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户公司地址' : 'Company Address'; ?>">
										<?php echo session('language') == '中文'? '客户公司地址' : 'Company Address'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Company_Address" value="<?php echo htmlentities($info['Company_Address']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '邮箱' : 'Email'; ?>">
							            <?php echo session('language') == '中文'? '邮箱' : 'Email'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Email" value="<?php echo htmlentities($info['Email']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="text">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item layui_ic">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '日期' : 'Date'; ?>">
										<?php echo session('language') == '中文'? '日期' : 'Date'; ?>
									</label>
									<div class="layui-input-block">
										<input class="showDate layui-input" name="Date" value="<?php echo htmlentities($info['Date']); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '不含税金额合计' : 'Total Amount without VAT'; ?>">
										<?php echo session('language') == '中文'? '不含税金额合计' : 'Total Amount without VAT'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Total_Amount_without_VAT" value="<?php echo htmlentities($info['Total_Amount_without_VAT']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '税额合计' : 'Total VAT Amount'; ?>">
										<?php echo session('language') == '中文'? '税额合计' : 'Total VAT Amount'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Total_VAT_Amount" value="<?php echo htmlentities($info['Total_VAT_Amount']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价金额合计' : 'Total Quote Amount'; ?>">
										<?php echo session('language') == '中文'? '报价金额合计' : 'Total Quote Amount'; ?>
									</label>
									<div class="layui-input-block">
										<input name="Total_Quote_Amount" value="<?php echo htmlentities($info['Total_Quote_Amount']); ?>" lay-verify="required" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>

							<!--管理层 允许手动修改状态-->
							<?php if($show == 1): ?>
							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '是否存档' : 'Archive'; ?>">
										<?php echo session('language') == '中文'? '是否存档' : 'Archive'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Archive" lay-filter="Archive" lay-search>
											<option value="No" <?php echo $info['Archive']=="No" ? 'selected' : ''; ?>>No</option>
											<option value="Yes" <?php echo $info['Archive']=="Yes" ? 'selected' : ''; ?>>Yes</option>
										</select>
									</div>
								</div>
							</div>
							<?php endif; ?>

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

		//同时绑定多个,单个日期选择，显示在input里面
		$('.showDate').click(function () {
			laydate.render({
				elem: this
				,trigger: 'click'
				,theme: '#1B3382'
				,position: 'fixed'
				//,isInitValue: true
				//,value: new Date()
				,format: 'yyyyMMdd'
			});
		});

		// 表单验证
		var validatorFunc = function () {
			var validator = new Validator();

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

			// 表单提交
			$('#form').submit();
		});
	})
</script>


</body>
</html>