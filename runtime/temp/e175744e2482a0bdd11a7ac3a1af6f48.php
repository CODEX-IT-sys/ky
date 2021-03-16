<?php /*a:2:{s:79:"D:\largon\laragon\www\ky\application\admin\view\authority_management\index.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
					<?php if($type=='d'): ?>
					<a class="layui-btn" id="add_d"><?php echo session('language') == '中文'? '新增' : 'Add'; ?></a>
					<?php else: ?>
					<a class="layui-btn" id="add_j"><?php echo session('language') == '中文'? '新增' : 'Add'; ?></a>
					<?php endif; ?>
				</div>
			</div>
			<div class="moduleCt module">
				<div class="moduleWrap">
					<div class="layui-tab-brief" lay-filter="">
						<ul class="layui-tab-title">
							<li class="layui-this"><a href="<?php echo url('authority_management/index'); ?>"><?php echo session('language') == '中文'? '权限设置' : 'Authorization'; ?></a></li>
							<li><a href="<?php echo url('authority_management/index_tab'); ?>"><?php echo session('language') == '中文'? '权限分配' : 'Permission Assignment'; ?></a></li>
						</ul>
						<div class="layui-tab-content">
							<div class="layui-tab-item layui-show">
								<div class="forwardTable">
									<table class="layui-hide" id="test" lay-filter="test"></table>
								</div>
							</div>
						</div>
					</div>
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


<!--搜索-->
<script type="text/html" id="forwardBar">

	<div class="forward">

		<form class="layui-form" id="form">

			<div class="forward_lead">

				<div class="layui-form-item label_auto">
					<label class="layui-form-label"><?php echo session('language') == '中文'? '类型选择' : 'Select Type'; ?></label>
					<div class="layui-input-inline">
						<select id="type" lay-verify="" lay-filter="type" lay-search>
							<option value=""><?php echo session('language') == '中文'? '请选择类型' : 'Please Select'; ?></option>
							<option value="d" <?php echo $type=='d' ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '部门' : 'Department'; ?></option>
							<option value="j" <?php echo $type=='j' ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '职位' : 'Job'; ?></option>
						</select>
					</div>
				</div>

				<div class="layui-form-item label_auto">
					<label class="layui-form-label"><?php echo session('language') == '中文'? '字段选择' : 'Select Field'; ?></label>
					<div class="layui-input-inline">
						<select id="field" lay-verify="">
							<option value=""><?php echo session('language') == '中文'? '请选择查找字段' : 'Please Select'; ?></option>
							<option value="cn_name"><?php echo session('language') == '中文'? '中文名称' : 'Chinese Name'; ?></option>
							<option value="en_name"><?php echo session('language') == '中文'? '英文名称' : 'English Name'; ?></option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label"><?php echo session('language') == '中文'? '查询内容' : 'Keyword'; ?></label>
					<div class="layui-input-inline">
						<input type="text" id="keyword" placeholder="<?php echo session('language') == '中文'? '请输入查询内容' : 'Please input keyword'; ?>" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="searchBtn">
					<button class="layui-btn search_btn" type="button">
						<i class="iconfont icon-sousuo"></i>
						<span><?php echo session('language') == '中文'? '查询' : 'Search'; ?></span>
					</button>
				</div>
			</div>

		</form>

	</div>
</script>

<!--行工具-->
<script type="text/html" id="barDemo">
	<div class="table_btn">
		<a class="layui-btn layui-btn-xs modify_btn" lay-event="edit"><?php echo session('language') == '中文'? '修改' : 'Edit'; ?></a>

		<!--谨慎操作-->
		<!--<a class="layui-btn layui-btn-xs delete_btn" lay-event="del"><?php echo session('language') == '中文'? '删除' : 'Delete'; ?></a>-->
	</div>
</script>

<!--脚本-->
<script type="text/javascript">
	var tableIns;  // 数据表格对象，用于重载
	var url;  // 默认值
	var type = "<?php echo htmlentities($type); ?>";
	
	if(type === 'd'){
		url = "<?php echo url('authority_management/index'); ?>"
	}else{
		url = "<?php echo url('authority_management/job_index'); ?>"
	}

	layui.use(['layer', 'form', 'table', 'element'], function () {
		var layer = top.layer;var form = layui.form;
		var table = layui.table;
		var cols;

		// 切换语言
		var language = "<?php echo session('language') == '中文'? '中文' : 'english'; ?>";

		if(language == '中文'){

			cols = [[
				{field: 'id', title: 'ID', sort:true},
				{field: 'cn_name', title: '中文名称', sort:true},
				{field: 'en_name', title: '英文名称', sort:true},
				{width: 220, title: '操作', align: 'center', toolbar: '#barDemo'}
			]]
		}else{

			cols = [[
				{field: 'id', title: 'ID', sort:true},
				{field: 'cn_name', title: 'Chinese Name', sort:true},
				{field: 'en_name', title: 'English Name', sort:true},
				{width: 220, title: 'Action', align: 'center', toolbar: '#barDemo'}
			]]
		}

		// 表格类型切换时
		form.on('select(type)', function (data) {
			
			//console.log(data.value);

			// 选中不同类型请求不同数据
			if (data.value === 'd') {
				window.location.href = "<?php echo url('authority_management/index'); ?>"
			}else{
				window.location.href = "<?php echo url('authority_management/job_index'); ?>"
			}
			
			// 表格重载
			tableIns.reload();
		});

		// 渲染表格数据
		tableIns = table.render({
			elem: '#test',
			toolbar: '#forwardBar',
			url: url,
			method: 'get',
			cols: cols,
			page: true, limit:50, height: 700
		});

        // 回车亦可以搜索
        $(document).keyup(function (event) {
            if (event.keyCode == 13) {
                $(".search_btn").trigger("click");
            }
        });

		// 搜索
		$('.search_btn').click(function () {
			
			var searchfield = $('#field').val();
			var searchkeyword = $.trim($('#keyword').val());

			if (!searchkeyword) {
				layer.msg('搜索内容不能为空');
				return false;
			}

			// 表格重载
			table.reload('test', {
				url: url,
				where: {field: searchfield, keyword: searchkeyword},  // 设定异步数据接口的额外参数
				page: 1, limit:50, height: 700
			});
		});

		// 新增部门
		$("#add_d").bind("click", function () {
			parent.layer.open({  // 在父窗口打开
				type: 2,
				title: '新增',
				maxmin: true,
				area: ['800px', '500px'],
				content: "<?php echo url('authority_management/create_d'); ?>",
				end: function () {
					// 表格重载
					tableIns.reload();
				}
			});
		});

		// 新增职位
		$("#add_j").bind("click", function () {
			parent.layer.open({  // 在父窗口打开
				type: 2,
				title: '新增',
				maxmin: true,
				area: ['800px', '500px'],
				content: "<?php echo url('authority_management/create_j'); ?>",
				end: function () {
					// 表格重载
					tableIns.reload();
				}
			});
		});

		//监听工具条
		table.on('tool(test)', function (obj) {

			var id = obj.data.id; //获得当前行数据
			var layEvent = obj.event;//获得 lay-event 对应的值

			 if (layEvent === 'del') { //删除
				layer.confirm('确认删除么？', function (index) {

					var del_url;

					if(type === 'd') {
						del_url = replaceUrlParam("<?php echo url('authority_management/d_delete', ['id' => 1]); ?>", id);
					}else{
						del_url = replaceUrlParam("<?php echo url('authority_management/j_delete', ['id' => 1]); ?>", id);
					}

					layer.close(index);

					// 向服务器发送删除请求
					$.ajax({
						type: 'delete',
						contentType: 'application/json',
						url: del_url,
						dataType: 'json',
						success: function (res) {
							layer.alert(res.msg, {title: '提示'}, function (index) {
								// 删除成功
								// 表格重载
								tableIns.reload();

								// 关闭alert
								layer.close(index);
							});
						},
						error: function (jqXHR) {
							// 删除失败
							if (jqXHR.status === 422) {
								layer.alert(jqXHR.responseText, {title: '提示'}, function (index) {
									layer.close(index);
								});
							}
						}
					});
				});

			} else if (layEvent === 'edit') { //编辑

			 	var edit_url;

				if(type === 'd') {
					 edit_url = replaceEditUrlId("<?php echo url('authority_management/edit_d', ['id' => 1]); ?>", id);
				}else{
					edit_url = replaceEditUrlId("<?php echo url('authority_management/edit_j', ['id' => 1]); ?>", id);
				}

				 layer.open({
					 type: 2,
					 title: '编辑',
					 maxmin: true,
					 area: ['800px', '500px'],
					 content: edit_url,
					 end: function () {
						 // 表格重载
						 tableIns.reload();
					 }
				 });
			}
		});
	});
</script>

</body>
</html>