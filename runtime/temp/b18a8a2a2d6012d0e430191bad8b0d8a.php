<?php /*a:2:{s:78:"D:\largon\laragon\www\ky\application\admin\view\authority_management\auth.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
							<a><?php echo session('language') == '中文'? '系统管理' : 'System Management'; ?></a>
							<a href="<?php echo url('authority_management/index'); ?>"><?php echo session('language') == '中文'? '权限管理' : 'Authority Management'; ?></a>
						</div>
						<div class="global_btn">
							<button class="layui-btn" id="save"><?php echo session('language') == '中文'? '保存' : 'Save'; ?></button>

							<a href="javascript:history.back(-1);">
								<button class="layui-btn layui-btn-primary" type="button"><?php echo session('language') == '中文'? '返回' : 'Back'; ?></button>
							</a>
						</div>
					</div>
					<div class="mainCt mainSec formReset">
						<div class="mainWrap">
							<form class="layui-form" action="">
								<div class="layui-row layui-col-space10">
									<div class="layui-col-xs4">
									    <div class="layui-form-item">
									        <label class="layui-form-label"><?php echo session('language') == '中文'? '用户名称' : 'Name'; ?></label>
									        <div class="layui-input-block">
									            <input name="name" value="<?php echo htmlentities($info['name']); ?>" disabled autocomplete="off" placeholder="" class="layui-input" type="text">
									        </div>
									    </div>
									</div>
									<div class="layui-col-xs4">
										<div class="layui-form-item">
											<label class="layui-form-label"><?php echo session('language') == '中文'? '所属部门' : 'Department'; ?></label>
											<div class="layui-input-block">
												<input name="department_id" value="<?php echo htmlentities($info['department_id']); ?>" disabled autocomplete="off" placeholder="" class="layui-input" type="text">
											</div>
										</div>  		 
									</div>
									<div class="layui-col-xs4">
										<div class="layui-form-item">
											<label class="layui-form-label"><?php echo session('language') == '中文'? '所属职位' : 'Job'; ?></label>
											<div class="layui-input-block">
												<input name="job_id" value="<?php echo htmlentities($info['job_id']); ?>" disabled autocomplete="off" placeholder="" class="layui-input" type="text">
											</div>
										</div>  		 
									</div>

									<div class="layui-col-xs12">
										<div class="layui-form-item">
											<label class="layui-form-label"><?php echo session('language') == '中文'? '菜单权限' : 'Menu Power'; ?></label>
											<div class="layui-input-block checkSelf" id="menu">
												<ul>
												<?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
													<li>
														<input type="checkbox" name="top_node_id[]" id="<?php echo htmlentities($v['id']); ?>" lay-skin="primary" title="<?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?>" class="parent" lay-filter="">
														<dl>
														<?php if(is_array($v['z']) || $v['z'] instanceof \think\Collection || $v['z'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['z'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
															<input type="checkbox" name="s_node_id[]" id="<?php echo htmlentities($vo['id']); ?>" lay-skin="primary" title="<?php echo session('language') == '中文'? $vo['cn_name'] : $vo['en_name']; ?>">
														<?php endforeach; endif; else: echo "" ;endif; ?>
														</dl>
													</li>
												<?php endforeach; endif; else: echo "" ;endif; ?>
												</ul>
											</div>
										</div>  		 
									</div>

									<div class="layui-col-xs12">
										<div class="layui-form-item">
											<label class="layui-form-label"><?php echo session('language') == '中文'? '报表权限' : 'Report Power'; ?></label>
											<div class="layui-input-block checkSelf" id="report">
												<ul>
													<li>
														<dl>
														<?php if(is_array($report_menu) || $report_menu instanceof \think\Collection || $report_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $report_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
															<input type="checkbox" name="report_menu[]" num="<?php echo htmlentities($vo['id']); ?>" lay-skin="primary" title="<?php echo session('language') == '中文'? $vo['cn_name'] : $vo['en_name']; ?>">
														<?php endforeach; endif; else: echo "" ;endif; ?>
														</dl>
													</li>
												</ul>
											</div>
										</div>  		 
									</div>

									<!--精确控制 每个表格的 读写权限-->
									<div class="layui-col-xs12">
										<div class="layui-form-item">
											<label class="layui-form-label"><?php echo session('language') == '中文'? '操作权限' : 'Action Power'; ?></label>
											<div class="layui-input-block" id="action">
												<ul>
													<?php if(is_array($menu_table) || $menu_table instanceof \think\Collection || $menu_table instanceof \think\Paginator): $i = 0; $__LIST__ = $menu_table;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
													<div class="layui-col-xs4" style="padding-top: 10px;">
														<li>
															<input type="checkbox" name="table_name[]" value="<?php echo htmlentities($v['id']); ?>" lay-skin="primary" title="<?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?>" class="parent" lay-filter="">
															<dl>
																<input type="checkbox" name="action_arr[]" value="<?php echo htmlentities($v['id']); ?>-read" lay-skin="primary" title="<?php echo session('language') == '中文'? '查看' : 'View'; ?>">
																<input type="checkbox" name="action_arr[]" value="<?php echo htmlentities($v['id']); ?>-create" lay-skin="primary" title="<?php echo session('language') == '中文'? '新增' : 'Create'; ?>">
																<input type="checkbox" name="action_arr[]" value="<?php echo htmlentities($v['id']); ?>-edit" lay-skin="primary" title="<?php echo session('language') == '中文'? '修改' : 'Edit'; ?>">
																<input type="checkbox" name="action_arr[]" value="<?php echo htmlentities($v['id']); ?>-delete" lay-skin="primary" title="<?php echo session('language') == '中文'? '删除' : 'Delete'; ?>">
															</dl>
														</li>
													</div>
													<?php endforeach; endif; else: echo "" ;endif; ?>
												</ul>
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


<!--数据渲染-->
<script type="text/javascript">

$(function () {

	var data = JSON.parse('<?php echo $info; ?>');

	if(data.menu_arr != null){

		// 复选框渲染
		// 菜单二级节点选中
		$.each(data.menu_arr.split(','), function (index, nodeId) {
			$('#menu').find('[id=' + nodeId + ']').prop('checked', true);
		});

		// 菜单一级节点选中
		$('[name=top_node_id\\[\\]]').each(function () {
			var $this = $(this);

			// 如果有一个二级节点选中，则选中对应的一级节点
			$this.next().find('[type=checkbox]').each(function () {
				if ($(this).prop('checked')) {
					$this.prop('checked', true);
					return false;
				}
			});
		});
	}

	if(data.report_arr != null) {

		// 报表节点选中
		$.each(data.report_arr.split(','), function (index, nodeId) {
			$('#report').find('[num=' + nodeId + ']').prop('checked', true);
		});

		// 报表节点选中
		$('[name=report_menu\\[\\]]').each(function () {
			var $this = $(this);

			// 如果有一个二级节点选中，则选中对应的一级节点
			$this.next().find('[type=checkbox]').each(function () {
				if ($(this).prop('checked')) {
					$this.prop('checked', true);
					return false;
				}
			});
		});
	}

	// 文本框和下拉框的渲染
	if(data.action_arr != null) {

		// 复选框渲染
		// 操作权限节点选中
		$.each(data.action_arr.split(','), function (index, nodeId) {
			$('#action').find('[value=' + nodeId + ']').prop('checked', true);
		});

		// 操作权限节点选中
		$('[name=action_arr\\[\\]]').each(function () {
			var $this = $(this);

			// 如果有一个二级节点选中，则选中对应的一级节点
			$this.next().find('[type=checkbox]').each(function () {
				if ($(this).prop('checked')) {
					$this.prop('checked', true);
					return false;
				}
			});
		});
	}

    layui.use(['layer','form'], function() {

		var form = layui.form, layer = layui.layer;

        var tip = layer.msg('Loading', {icon: 16, shade: 0.3, time: 3000});

		// 数据渲染完成后，重新渲染表单
		form.render();

        // 获取操作表格的数据
        function getTableData() {
            var nodeIds = '';

            $('[name=table_name\\[\\]]:checked').each(function () {
                nodeIds += $(this).val() + ',';
            });
            table_name = nodeIds.substring(0, nodeIds.length - 1);

            // 返回操作菜单
            return table_name;
        }
		
		// 获取操作权限的数据
		function getActionData() {
			var nodeIds = '';
			
			$('[name=action_arr\\[\\]]:checked').each(function () {
				nodeIds += $(this).val() + ',';
			});
			action_arr = nodeIds.substring(0, nodeIds.length - 1);
			
			// 返回操作菜单
			return action_arr;
		}

		// 获取菜单权限节点的数据
        function getAuthData() {

			var t_nodeIds = '', s_nodeIds = '';
			
			//一级菜单节点
			$('[name=top_node_id\\[\\]]:checked').each(function () {
			    t_nodeIds += $(this).attr('id') + ',';
			});
			t_node_ids = t_nodeIds.substring(0, t_nodeIds.length - 1);
			
			//二级菜单节点
			$('[name=s_node_id\\[\\]]:checked').each(function () {
			    s_nodeIds += $(this).attr('id') + ',';
			});
			s_node_ids = s_nodeIds.substring(0, s_nodeIds.length - 1);
			
			// 拼接两级菜单
			menu_arr = t_node_ids + ',' + s_node_ids;
			
			// 返回一二级菜单组
			return menu_arr;
		}
		
		// 获取报表权限节点的数据
		function getReportData() {
			var nodeIds = '';
			
			$('[name=report_menu\\[\\]]:checked').each(function () {
			    nodeIds += $(this).attr('num') + ',';
			});
			report_arr = nodeIds.substring(0, nodeIds.length - 1);
			
			// 返回报表菜单
			return report_arr;
		}
		
		$('#save').click(function(){

            var tip = layer.msg('Data Uploading', {icon: 16, shade: 0.3, time:3000});
			
			var data = {};

			data.menu_arr = getAuthData();
			data.report_arr = getReportData();

			data.table_name = getTableData();
            data.action_arr = getActionData();
			
			$.ajax({
			    url: "<?php echo url('authority_management/update_auth', ['id' => $info['id']]); ?>",
			    type: 'put',
			    contentType: 'application/json',
			    dataType: 'json',
			    data: JSON.stringify(data),
			    success: function (res) {

                    layer.close(tip);

			        layer.alert(res.msg, {title: '提示'}, function (index) {
			            
			            // 关闭alert
			            layer.close(index);
			
			            window.location.href = "<?php echo url('authority_management/index_tab'); ?>"
			        });
			    },
			    error: function (jqXHR) {
			        if (jqXHR.status === 422) {
			            layer.alert(jqXHR.responseText, {title: '提示'});
			        }
			    }
			});
		});
		
		// 复选框选中事件
        form.on('checkbox()', function (data) {
            var checkbox = $(data.elem);

            if (checkbox.prop('checked') === true) {
                // 选中复选框
                if (checkbox.hasClass('parent')) {
                    // 如果选中的是一级节点，则把对应的二级节点全部选中
                    checkbox.siblings('dl').find('[type=checkbox]').prop('checked', true);
                } else {
                    // 如果选中的是二级节点，则把对应的一级节点选中
                    checkbox.parent().siblings('[type=checkbox].parent').prop('checked', true);
                }
            } else {
                // 取消选中复选框
                if (checkbox.hasClass('parent')) {
                    // 如果取消选中的是一级节点，则把对应的二级节点全部取消选中
                    checkbox.siblings('dl').find('[type=checkbox]').prop('checked', false);
				// 如果取消选中的是二级节点
                } else {
                    // 如果所有的二级节点都取消选中了，则把一级节点也取消选中
                    var hasSiblingChecked = false;
                    checkbox.siblings('[type=checkbox]').each(function () {
                        if ($(this).prop('checked') === true) {
                            hasSiblingChecked = true;
                        }
                    });

                    if (!hasSiblingChecked) {
                        checkbox.parent().siblings('[type=checkbox].parent').prop('checked', false);
                    }
                }
            }

            form.render('checkbox');
			
        });
		
	});
});
</script>


</body>
</html>