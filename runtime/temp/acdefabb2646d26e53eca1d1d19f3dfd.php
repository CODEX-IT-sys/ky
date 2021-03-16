<?php /*a:2:{s:81:"D:\largon\laragon\www\ky\application\admin\view\mk_inquiry\file_Inquiry-view.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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

                    <form class="layui-form" id="form" method="post" action="<?php echo url('mk_inquiry/file_update',['i_id'=>$i_id]); ?>">

                        <div class="layui-row layui-col-space10">

							<?php if((request()->action() == 'read')): ?>
                            <div class="layui-col-xs4">
                            	<div class="layui-form-item layui_ic">
                            		<label class="layui-form-label" title="<?php echo session('language') == '中文'? '来稿日期' : 'Inquiry Date'; ?>">
                            			<?php echo session('language') == '中文'? '来稿日期' : 'Inquiry Date'; ?>
                            		</label>
                            		<div class="layui-input-block">
                            			<input class="Date layui-input" name="Inquiry_Date" readonly value="<?php echo htmlentities((isset($info['Inquiry_Date']) && ($info['Inquiry_Date'] !== '')?$info['Inquiry_Date']:'')); ?>" type="text">
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
										<input class="Date layui-input" name="Update_Date" readonly value="<?php echo htmlentities((isset($info['Update_Date']) && ($info['Update_Date'] !== '')?$info['Update_Date']:'')); ?>" type="text">
										<i class="layui-icon layui-icon-date"></i>
									</div>
								</div>
							</div>
							<?php endif; ?>

							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>">
							            <?php echo session('language') == '中文'? '文件名称' : 'Job Name'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Job_Name" id="doc_name" lay-verify="required" value="<?php echo htmlentities((isset($info['Job_Name']) && ($info['Job_Name'] !== '')?$info['Job_Name']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
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
										<select name="File_Type" lay-filter="File_Type" lay-search>
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
										<div id="demo1" class="xm-select-demo"></div>
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
                                    <label class="layui-form-label" title="<?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>">
                                        <?php echo session('language') == '中文'? '单价' : 'Unit Price'; ?>
                                    </label>
                                    <div class="layui-input-block">
                                        <input name="Unit_Price" id="dj" value="<?php echo htmlentities((isset($info['Unit_Price']) && ($info['Unit_Price'] !== '')?$info['Unit_Price']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
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

							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>">
							            <?php echo session('language') == '中文'? '报价数量' : 'Quote Quantity'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Quantity" id="bjsl" value="<?php echo htmlentities((isset($info['Quote_Quantity']) && ($info['Quote_Quantity'] !== '')?$info['Quote_Quantity']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
							        </div>
							    </div>
							</div>

							<div class="layui-col-xs4">
								<div class="layui-form-item">
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>">
										<?php echo session('language') == '中文'? '税率' : 'VAT Rate'; ?>
									</label>
									<div class="layui-input-block">
										<select name="VAT_Rate" id="sl" lay-filter="VAT_Rate" lay-search>
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
										<input name="VAT_Amount" value="<?php echo htmlentities($info['VAT_Amount']); ?>" id="zzse" autocomplete="off" placeholder="" class="layui-input" type="number">
									</div>
								</div>
							</div>
							
							<div class="layui-col-xs4">
							    <div class="layui-form-item">
							        <label class="layui-form-label" title="<?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>">
							            <?php echo session('language') == '中文'? '报价金额' : 'Quote Amount'; ?>
							        </label>
							        <div class="layui-input-block">
							            <input name="Quote_Amount" id="bjje" value="<?php echo htmlentities((isset($info['Quote_Amount']) && ($info['Quote_Amount'] !== '')?$info['Quote_Amount']:'')); ?>" autocomplete="off" placeholder="" class="layui-input" type="number">
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
									<label class="layui-form-label" title="<?php echo session('language') == '中文'? '订单状态（接受/拒绝/未确定）' : 'Order Status'; ?>">
										<?php echo session('language') == '中文'? '订单状态（接受/拒绝/未确定）' : 'Order Status'; ?>
									</label>
									<div class="layui-input-block">
										<select name="Order_Status" lay-filter="Order_Status" lay-search>
											<option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
											<option value="Accepted" <?php echo $info['Order_Status']=="Accepted" ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '接受' : 'Accepted'; ?></option>
											<option value="Denied" <?php echo $info['Order_Status']=="Denied" ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '拒绝' : 'Denied'; ?></option>
											<option value="Unsure" <?php echo $info['Order_Status']=="Unsure" ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '未确定' : 'Unsure'; ?></option>
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

							<div class="layui-col-xs12">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" title="<?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>">
                                        <?php echo session('language') == '中文'? '客户要求' : 'Customer Requirements'; ?>
                                    </label>
                                    <div class="layui-input-block">
                                        <textarea placeholder="" id="Customer_Requirements" name="Customer_Requirements" class="layui-textarea"><?php echo htmlentities((isset($info['Customer_Requirements']) && ($info['Customer_Requirements'] !== '')?$info['Customer_Requirements']:'')); ?></textarea>
                                    </div>
                                </div>
                            </div>
							
							<div class="layui-col-xs12">
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

							<input name="i_id" type="hidden" value="<?php echo htmlentities($info['i_id']); ?>" >
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
			});
		});

        // 服务多选
        var fw = '<?php echo $service; ?>';
        var fwData = JSON.parse(fw);
        var demo1 = xmSelect.render({
            el: '#demo1',
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

        // 单价
        $('#dj').change(function () {

            var bjsl = $.trim($('#bjsl').val());
            var sl = $.trim($('#sl').val());
            var dj = $.trim($('#dj').val());

            bjsl?bjsl:0; dj?dj:0; sl?sl:0;

            var zzse = Number(bjsl) * Number(dj) * sl/100;

			var bjje = Number(bjsl) * Number(dj) + Number(zzse);

			$('#zzse').val(zzse);

			$('#bjje').val(bjje);
        });

        // 报价数量
        $('#bjsl').change(function () {

            var bjsl = $.trim($('#bjsl').val());
            var sl = $.trim($('#sl').val());
            var dj = $.trim($('#dj').val());

            bjsl?bjsl:0; dj?dj:0; sl?sl:0;

            var zzse = Number(bjsl) * Number(dj) * sl/100;

			var bjje = Number(bjsl) * Number(dj) + Number(zzse);

			$('#zzse').val(zzse);

			$('#bjje').val(bjje);
        });


        // 下拉选择器值发生变化
        form.on('select(VAT_Rate)', function (data) {
            var sl = data.value;

            var bjsl = $.trim($('#bjsl').val());
            var dj = $.trim($('#dj').val());

            bjsl?bjsl:0; dj?dj:0; sl?sl:0;

            var zzse = Number(bjsl) * Number(dj) * sl/100;

			var bjje = Number(bjsl) * Number(dj) + Number(zzse);

			$('#zzse').val(zzse);

			$('#bjje').val(bjje);
        });

		// 表单验证
		var validatorFunc = function () {
			var validator = new Validator();

			// 金额验证
			validator.add('Unit_Price', [{
				rule: 'price',
				msg: '单价金额数据错误'
			}]);

			/*validator.add('Quote_Amount', [{
				rule: 'price',
				msg: '报价金额数据错误'
			}]);*/

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

        // 文件名称 重名验证提示
        $('#doc_name').change(function () {

            var doc_name = $.trim($('#doc_name').val());

            //异步拉取信息
            $.ajax({
                type: 'get',
                url: "<?php echo url('mk_inquiry_file/check_name'); ?>",
                data: {name: doc_name},
                dataType: 'json',
                success: function (res) {
                    if(res.code === 0){
                        layer.alert(res.msg, {title: '提示'});
                    }
                }
            })
        });

		// 数据提交
		$('#save').on('click', function () {

			// 表单验证
			var errorMsg = validatorFunc();
			if (errorMsg) {
				layer.alert(errorMsg, {title: '提示'});
				return false;
			}

            var tip = layer.msg('Data Uploading', {icon: 16, shade: 0.3, time:3000});

            //获取当前多选选中的值
            var selectArr = demo1.getValue();
            var dataLength = selectArr.length;
            var namestr = '';
            for(var i=0; i< dataLength; i++ )
            {
                namestr += selectArr[i].name + ',';
            }
            // 去除多余符号
            namestr = namestr.substring(0, namestr.length - 1);
            $('#Service').val(namestr);

			// 表单提交
			$('#form').submit();
		});
	})
</script>

</body>
</html>