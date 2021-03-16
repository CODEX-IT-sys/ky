<?php /*a:2:{s:69:"D:\largon\laragon\www\ky\application\admin\view\qa_reviser\index.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
							<a href="<?php echo url('Statistics/index'); ?>"><?php echo session('language') == '中文'? '数据统计' : 'Statistics Management'; ?></a>
							<a class="on"><?php echo session('language') == '中文'? '校对人员质量评估' : 'Quality Appraisal of Reviser'; ?></a>
						</div>

						<div class="global_btn">
							<a href="<?php echo url('qa_reviser/create'); ?>" class="layui-btn"><?php echo session('language') == '中文'? '新增' : 'Add'; ?></a>

							<!--<a class="layui-btn delete_btn" id="del"><?php echo session('language') == '中文'? '删除' : 'Delete'; ?></a>-->
						</div>
					</div>
					<div class="mainCt">
						<div class="mainWrap">
							<div class="forwardTable selftForward">
								<table class="layui-hide" id="test" lay-filter="test"></table>
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

					<div class="layui-form-item">
						<label class="layui-form-label"><?php echo session('language') == '中文'? '字段选择' : 'Select Field'; ?></label>
						<div class="layui-input-inline">
							<select id="field" lay-verify="" lay-search>
								<option value=""><?php echo session('language') == '中文'? '请选择查找字段' : 'Please Select'; ?></option>
								<?php if(is_array($select_field) || $select_field instanceof \think\Collection || $select_field instanceof \think\Paginator): $i = 0; $__LIST__ = $select_field;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;if($v['Field'] != 'delete_time'): if($v['Field'] != 'id'): ?>
								<option value="<?php echo htmlentities($v['Field']); ?>"><?php echo session('language') == '中文'? $v['Comment'] : str_replace('_' , ' ', $v['Field']); ?></option>
								<?php endif; ?><?php endif; ?>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><?php echo session('language') == '中文'? '查询内容' : 'Keyword'; ?></label>
						<div class="layui-input-inline">
							<input type="text" id="keyword" placeholder="<?php echo session('language') == '中文'? '请输入查询内容' : 'Please input keyword'; ?>" autocomplete="off" class="layui-input">
						</div>
					</div>

					<span class="addCondition">
						<i class="iconfont icon-icon-test"></i>
					</span>

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
		<a class="layui-btn layui-btn-xs delete_btn" lay-event="del"><?php echo session('language') == '中文'? '删除' : 'Delete'; ?></a>
		<!--<a class="layui-btn layui-btn-xs com_btn" lay-event="look"><?php echo session('language') == '中文'? '查看' : 'Look'; ?></a>-->
	</div>
</script>

<!--脚本-->
<script>
	var tableIns;  // 数据表格对象，用于重载
	layui.use('table', function(){
		var table = layui.table;
		// 切换语言
		var language = "<?php echo session('language') == '中文'? '中文' : 'english'; ?>";

		// 数据表格字段
		var data = '<?php echo $colsData; ?>';
		var colsData = JSON.parse(data);

		// 通用表头生成器
		function commonCols(language,colsData){
			// 左侧勾选栏
			var cols = [{type: 'checkbox', fixed: 'left'}];
			var l = colsData.length;

			// 遍历所有字段
			for(var i = 0; i < l; i++){
				if(colsData[i].Field !== 'delete_time'){
                    if(colsData[i].Field !== 'id'){
						if(language === '中文'){
							cols.push({field: colsData[i].Field ,title: colsData[i].Comment, sort:true, minWidth:120, totalRow:true});
						}else{
							cols.push({field: colsData[i].Field ,title: colsData[i].Field, sort:true, minWidth:180, totalRow:true});
						}
                    }
				}
			}
			// 右侧操作工具
			if(language === '中文') {
				cols.push({fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo', width: 150});
			}else{
				cols.push({fixed: 'right', title: 'Action', align: 'center', toolbar: '#barDemo', width: 150});
			}

			return [cols];
		}

		// 生成表格
		tableIns = table.render({
			elem: '#test'
			,url:"<?php echo url('qa_reviser/index'); ?>"
			,toolbar: '#forwardBar'
			,defaultToolbar: ['filter', 'exports', 'print']
			,title: '校对人员质量评估'
			,cols : commonCols(language, colsData)
            ,page: true, limit:50, height:700
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
				if(language === '中文') {
					layer.msg('搜索内容不能为空');
				}else{
					layer.msg('Please input keyword');
				}
				return false;
			}
			// 表格重载
			table.reload('test', {
				url: "<?php echo url('qa_reviser/index'); ?>",
				where: {field: searchfield, keyword: searchkeyword},  // 设定异步数据接口的额外参数
				page: true, limit:50
			});
		});

		// 多条件 搜索弹框
		$(function(){
			var index;
			$(".addCondition").live("click",function(){
				index = parent.layer.open({ //在父窗口打开
					type: 2,
					title: '条件查询',
					maxmin: true,
					shadeClose: true, //点击遮罩关闭层
					area : ['700px' , '560px'],
					content: "<?php echo url('qa_reviser/condition'); ?>",
					end: function () {
						var search_type = localStorage.getItem('search_type');
						var s = localStorage.getItem('field');
						var i = localStorage.getItem('keyword');
						// 表格重载
						table.reload('test', {
							url: "<?php echo url('qa_reviser/index'); ?>",
							where: {search_type : search_type, field: s, keyword: i},  // 设定异步数据接口的额外参数
							page: true, limit:50
						});
					}
				});
			});
		});

		//批量删除(多选操作)
		$('#del').click(function () {
			var checkStatus = table.checkStatus('test');
			var idstr = ''; var cd = checkStatus.data.length;

			if(cd !== 0){
				for(var i=0; i<cd; i++){
					idstr +=  checkStatus.data[i].id + ',';
				}
				// 去除多余符号
				idstr = idstr.substring(0, idstr.length - 1);

				layer.confirm('确认删除？', function(index){
					// 向服务器发送删除请求
					$.ajax({
						type: 'get',
						url: "<?php echo url('qa_reviser/batch_delete'); ?>",
						data: {id : idstr},
						// 删除成功
						success: function (res) {
							layer.alert(res.msg, {title: '提示'}, function (index) {
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
			}else{

				if(language === '中文') {
					layer.alert('请先勾选要删除的数据再操作');
				}else{
					layer.msg('Please check the box before operating');
				}
			}
		});

		//监听行工具事件
		table.on('tool(test)', function(obj){
			//获得当前行数据
			var id = obj.data.id;
			// 删除
			if(obj.event === 'del'){
				layer.confirm('确认删除？', function(index){
					// 向服务器发送删除请求
					$.ajax({
						type: 'delete',
						contentType: 'application/json',
						url: replaceEditUrlId("<?php echo url('qa_reviser/delete', ['id' => 1]); ?>", id),
						dataType: 'json',
						// 删除成功
						success: function (res) {
							layer.alert(res.msg, {title: '提示'}, function (index) {
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

			} else if(obj.event === 'edit'){

				window.location.href =  replaceEditUrlId("<?php echo url('qa_reviser/edit', ['id' => 1]); ?>", id);

			} else if(obj.event === 'look'){

				window.location.href = replaceEditUrlId("<?php echo url('qa_reviser/read', ['id' => 1]); ?>", id);
			}
		});
	});
</script>


</body>
</html>