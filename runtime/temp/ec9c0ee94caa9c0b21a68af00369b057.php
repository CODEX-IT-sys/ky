<?php /*a:2:{s:69:"D:\largon\laragon\www\ky\application\admin\view\xt_company\index.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
                    <a class="on"><?php echo session('language') == '中文'? '主体公司' : 'Subject Company'; ?></a>
                </div>
                <div class="global_btn">
                    <a href="<?php echo url('xt_company/create'); ?>" class="layui-btn"><?php echo session('language') == '中文'? '新增' : 'Add'; ?></a>
                </div>
            </div>
            <div class="mainCt">
                <div class="mainWrap">
                    <div class="forwardTable">
                        <table class="layui-hide" id="admin" lay-data="{id:'admin'}" lay-filter="admin"></table>
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
                        <option value="cn_name"><?php echo session('language') == '中文'? '中文公司名称' : 'CN Company Name'; ?></option>
                        <option value="en_name"><?php echo session('language') == '中文'? '英文公司名称' : 'EN Company Name'; ?></option>
                        <option value="VAT_ID"><?php echo session('language') == '中文'? '公司税号' : 'VAT ID'; ?></option>
                        <option value="CN_Address"><?php echo session('language') == '中文'? '中文地址' : 'CN Address'; ?></option>
                        <option value="EN_Address"><?php echo session('language') == '中文'? '中文地址' : 'EN Address'; ?></option>
                        <option value="CN_Bank"><?php echo session('language') == '中文'? '中文开户银行' : 'CN Bank'; ?></option>
                        <option value="EN_Bank"><?php echo session('language') == '中文'? '英文开户银行' : 'EN Bank'; ?></option>
                        <option value="CN_Bank_Account"><?php echo session('language') == '中文'? '中文银行账号' : 'CN Bank Account'; ?></option>
                        <option value="EN_Bank_Account"><?php echo session('language') == '英文'? '中文银行账号' : 'EN Bank Account'; ?></option>
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
    </div>
</script>

<!--行工具-->
<script type="text/html" id="barDemo">
    <div class="table_btn">
        <a class="layui-btn layui-btn-xs modify_btn" lay-event="edit"><?php echo session('language') == '中文'? '修改' : 'Edit'; ?></a>
        <!--<a class="layui-btn layui-btn-xs delete_btn" lay-event="del"><?php echo session('language') == '中文'? '删除' : 'Delete'; ?></a>-->
        <a class="layui-btn layui-btn-xs com_btn" lay-event="look"><?php echo session('language') == '中文'? '查看' : 'View'; ?></a>
    </div>
</script>

<!--脚本-->
<script type="text/javascript">
    var tableIns;  // 数据表格对象，用于重载

    layui.use(['layer', 'table'], function () {
        var layer = top.layer;
        var table = layui.table;
		var cols;
		
		// 切换语言
		var language = "<?php echo session('language') == '中文'? '中文' : 'english'; ?>";
		
		if(language === '中文'){
			cols = [[
                {field: 'id', title: '主键序号', width:120, sort:true},
			    {field: 'cn_name', title: '中文名称', sort:true},
                {field: 'en_name', title: '英文名称', sort:true},
                {field: 'VAT_ID', title: '公司税号', sort:true},
                {field: 'CN_Address', title: '中文地址', sort:true},
                {field: 'EN_Address', title: '英文地址', sort:true},
                {field: 'CN_Bank_Info', title: '中文银行信息', sort:true},
                {field: 'EN_Bank_Info', title: '英文银行信息', sort:true},
			    {width: 150, title: '操作', align: 'center', toolbar: '#barDemo'}
			]]
		}else{
			cols = [[
                {field: 'id', title: 'ID', width:120, sort:true},
                {field: 'cn_name', title: '中文名称', sort:true},
			    {field: 'cn_name', title: 'CN Company Name', sort:true},
                {field: 'en_name', title: 'EN Company Name', sort:true},
                {field: 'VAT_ID', title: 'VAT_ID', sort:true},
                {field: 'CN_Address', title: 'CN_Address', sort:true},
                {field: 'EN_Address', title: 'EN_Address', sort:true},
                {field: 'CN_Bank_Info', title: 'CN_Bank_Info', sort:true},
                {field: 'EN_Bank_Info', title: 'EN_Bank_Info', sort:true},
			    {width: 150, title: 'Action', align: 'center', toolbar: '#barDemo'}
			]]
		}

        // 渲染表格数据
        tableIns = table.render({
            elem: '#admin',
            toolbar: '#forwardBar',
            url: "<?php echo url('xt_company/index'); ?>",
            cols: cols,
            page: true,
            limit:50, height:700
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
            }

            // 表格重载
            table.reload('admin', {
                url: "<?php echo url('xt_company/index'); ?>",
                where: {field: searchfield, keyword: searchkeyword},  // 设定异步数据接口的额外参数
                page: 1,
                limit:50
            });
        });

        //监听工具条
        table.on('tool(admin)', function (obj) {

            var id = obj.data.id; //获得当前行数据
            var layEvent = obj.event;//获得 lay-event 对应的值

            if (layEvent === 'edit') {

                window.location.href = replaceEditUrlId("<?php echo url('xt_company/edit', ['id' => 1]); ?>", id)

            } else if(obj.event === 'look'){

                window.location.href = replaceEditUrlId("<?php echo url('xt_company/read', ['id' => 1]); ?>", id);
            }
        });
    });
</script>

</body>
</html>