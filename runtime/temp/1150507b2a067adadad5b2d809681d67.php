<?php /*a:2:{s:83:"D:\largon\laragon\www\ky\application\admin\view\authority_management\index_tab.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
				</div>
				<div class="moduleCt module">
					<div class="moduleWrap">
						<div class="layui-tab-brief" lay-filter="">
							<ul class="layui-tab-title">
								<li><a href="<?php echo url('authority_management/index'); ?>"><?php echo session('language') == '中文'? '权限设置' : 'Authorization'; ?></a></li>
								<li class="layui-this"><a href="<?php echo url('authority_management/index_tab'); ?>"><?php echo session('language') == '中文'? '权限分配' : 'Permission Assignment'; ?></a></li>
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
		<div class="forward_lead">
			<div class="layui-form-item label_auto">
				<label class="layui-form-label"><?php echo session('language') == '中文'? '字段选择' : 'Select Field'; ?></label>
				<div class="layui-input-inline">
					<select id="field" lay-verify="" lay-search>
						<option value=""><?php echo session('language') == '中文'? '请选择查找字段' : 'Please Select'; ?></option>
						<option value="name" <?php echo $field=='name' ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '名称' : 'Name'; ?></option>
						<option value="department_id" <?php echo $field=='department_id' ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '部门' : 'Department'; ?></option>
						<option value="job_id" <?php echo $field=='job_id' ? 'selected' : ''; ?>><?php echo session('language') == '中文'? '职位' : 'Job'; ?></option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><?php echo session('language') == '中文'? '查询内容' : 'Keyword'; ?></label>
				<div class="layui-input-inline">
					<input type="text" id="keyword" value="<?php echo htmlentities($keyword); ?>" placeholder="<?php echo session('language') == '中文'? '请输入查询内容' : 'Please input keyword'; ?>" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="searchBtn">
				<button class="layui-btn search_btn" type="button">
					<i class="iconfont icon-sousuo"></i>
					<span><?php echo session('language') == '中文'? '查询' : 'Search'; ?></span>
				</button>
			</div>
		</div>
	</div>
</script>

<script type="text/html" id="barDemo">
	<div class="table_btn">
		<a class="layui-btn layui-btn-xs com_btn" lay-event="auth"><?php echo session('language') == '中文'? '权限分配' : 'Authority Management'; ?></a>
	</div>
</script>

<!--脚本-->
<script type="text/javascript">
	var tableIns;  // 数据表格对象，用于重载

	layui.use(['layer', 'table', 'element'], function () {
		var layer = top.layer;
		var table = layui.table;
		var cols;

        var field = '<?php echo htmlentities($field); ?>'; var keyword = '<?php echo htmlentities($keyword); ?>';

		// 切换语言
		var language = "<?php echo session('language') == '中文'? '中文' : 'english'; ?>";

		if(language == '中文'){
			cols = [[
				//{field: 'id', title: 'ID', sort:true},
				{field: 'name', title: '名称', sort:true},
                {field: 'department_id', title: '所属部门', sort:true},
                {field: 'job_id', title: '职位', sort:true},
				{width: 200, title: '操作', align: 'center', toolbar: '#barDemo'}
			]]
		}else{
			cols = [[
				//{field: 'id', title: 'ID', sort:true},
				{field: 'name', title: 'Name', sort:true},
                {field: 'department_id', title: 'Department', sort:true},
                {field: 'job_id', title: 'Job', sort:true},
				{width: 220, title: 'Action', align: 'center', toolbar: '#barDemo'}
			]]
		}

		// 渲染表格数据
		tableIns = table.render({
			elem: '#test',
			toolbar: '#forwardBar',
			url: "<?php echo url('index_tab'); ?>",
            where: {field: field, keyword: keyword},
			method: 'get',
			cols: cols,
			page: true
            , limit:50, height:650
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

            // 页面 带参跳转 可以记住搜索参数
            window.location.href = "<?php echo url('index_tab'); ?>" + '?field=' + searchfield + '&keyword=' + searchkeyword;

			// 表格重载
			/*table.reload('test', {
				url: "<?php echo url('index_tab'); ?>",
				where: { field: searchfield, keyword: searchkeyword},  // 设定异步数据接口的额外参数
				page: 1, limit:50
			});*/
		});

		// 新增
		$("#account_add").bind("click", function () {
            // 在父窗口打开
			parent.layer.open({
				type: 2,
				title: '新增',
				maxmin: true,
				area: ['900px', '560px'],
				content: "<?php echo url('authority_management/create'); ?>"
			});
		});

		//监听工具条
		table.on('tool(test)', function (obj) {

			var id = obj.data.id; //获得当前行数据
			var layEvent = obj.event;	//获得 lay-event 对应的值

			if (layEvent === 'auth') { //权限分配

				window.location.href = replaceEditUrlId("<?php echo url('authority_management/auth', ['id' => 1]); ?>", id)
			}
		});
	});
</script>

</body>
</html>