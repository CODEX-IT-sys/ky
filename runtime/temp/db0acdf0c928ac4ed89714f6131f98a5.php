<?php /*a:2:{s:66:"D:\largon\laragon\www\ky\application\admin\view\xt_dict\index.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
                    <a><?php echo session('language') == '中文'? '公共信息' : 'Public Information'; ?></a>
                    <a class="on"><?php echo session('language') == '中文'? '词库管理' : 'Dict Management'; ?></a>
                </div>
            </div>
            <div class="mainCt">
                <div class="mainWrap">
                    <div class="forwardTable">
                        <table class="layui-hide" id="admin" lay-data="{id:'admin'}" lay-filter="admin"></table>
                    </div>

                    <!--文本说明-->
                    <div class="explain">
                        <h5 class="explainTitle">
                            <i class="iconfont icon-tishi"></i>
                            <span>说明</span>
                        </h5>
                        <div class="explainCt">
                            <span>注意：词库内容为数值类型及需要参与计算的请勿填写单位，只需填写数值即可。如：税率默认单位（%）</span>
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


<!--行工具-->
<script type="text/html" id="barDemo">
    <div class="table_btn">
        <a class="layui-btn layui-btn-xs modify_btn" lay-event="add"><?php echo session('language') == '中文'? '新增' : 'Add'; ?></a>
        <!--<a class="layui-btn layui-btn-xs com_btn" lay-event="edit"><?php echo session('language') == '中文'? '编辑' : 'Edit'; ?></a>-->
        <a class="layui-btn layui-btn-xs com_btn" lay-event="look"><?php echo session('language') == '中文'? '查看' : 'View'; ?></a>
    </div>
</script>

<!--脚本-->
<script type="text/javascript">

    layui.use(['layer', 'table'], function () {
        var layer = top.layer;
        var table = layui.table;
		var cols;
		
		// 切换语言
		var language = "<?php echo session('language') == '中文'? '中文' : 'english'; ?>";
		
		if(language === '中文'){
			cols = [[
			    {field: 'cn_name', title: '中文名称', sort:true},
                {field: 'en_name', title: '英文名称', sort:true},
			    {width: 150, title: '操作', align: 'center', toolbar: '#barDemo'}
			]]
		}else{
			cols = [[
			    {field: 'cn_name', title: 'Chinese Name', sort:true},
                {field: 'en_name', title: 'English name', sort:true},
			    {width: 150, title: 'Action', align: 'center', toolbar: '#barDemo'}
			]]
		}

        // 渲染表格数据
        table.render({
            elem: '#admin',
            //toolbar: '#forwardBar',
            toolbar:false,
            url: "<?php echo url('xt_dict/index'); ?>",
            method: 'get',
            cols: cols,
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
            table.reload('admin', {
                url: "<?php echo url('xt_dict/index'); ?>",
                where: {field: searchfield, keyword: searchkeyword},  // 设定异步数据接口的额外参数
            });
        });

        //监听工具条
        table.on('tool(admin)', function (obj) {

            var id = obj.data.id; //获得当前行数据
            var layEvent = obj.event;//获得 lay-event 对应的值

            if (layEvent === 'edit') {

                parent.layer.open({  // 在父窗口打开
                    type: 2,
                    title: '编辑',
                    maxmin: true,
                    area: ['900px', '500px'],
                    content: replaceEditUrlId("<?php echo url('xt_dict/edit', ['c_id' => 1]); ?>", id)
                });

            }else if (layEvent === 'add') {

                parent.layer.open({  // 在父窗口打开
                    type: 2,
                    title: '新增',
                    maxmin: true,
                    area: ['900px', '500px'],
                    content: replaceEditUrlId("<?php echo url('xt_dict/create', ['c_id' => 1]); ?>", id)
                });

            }else if (layEvent === 'look') {

                parent.layer.open({  // 在父窗口打开
                    type: 2,
                    title: '查看',
                    maxmin: true,
                    area: ['900px', '800px'],
                    content: replaceEditUrlId("<?php echo url('xt_dict/read', ['c_id' => 1]); ?>", id)

                });
            }
        });
    });
</script>

</body>
</html>