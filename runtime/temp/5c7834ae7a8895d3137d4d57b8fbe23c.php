<?php /*a:2:{s:80:"D:\largon\laragon\www\ky\application\admin\view\authority_management\edit_d.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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


<div class="secWrap">
    <div class="layui-container">
        <form class="layui-form centerBox formReset" id="form">

            <div class="layui-form-item">
                <label class="layui-form-label"><?php echo session('language') == '中文'? '部门中文名称' : 'Department Chinese Name'; ?></label>
                <div class="layui-input-block">
                    <input name="cn_name" value="<?php echo htmlentities($info['cn_name']); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><?php echo session('language') == '中文'? '部门英文名称' : 'Department English Name'; ?></label>
                <div class="layui-input-block">
                    <input name="en_name" value="<?php echo htmlentities($info['en_name']); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
                </div>
            </div>

            <input type="hidden" name="id" value="<?php echo htmlentities($info['id']); ?>" />
        </form>
    </div>

    <div class="layui-layer-btn layui-layer-btn- bottm_control">
        <a class="layui-layer-btn0" id="submit"><?php echo session('language') == '中文'? '确认' : 'OK'; ?></a>
        <a class="layui-layer-btn1" id="cancel"><?php echo session('language') == '中文'? '取消' : 'Cancel'; ?></a>
    </div>

</div>


<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/list.js"></script>
<script type="text/javascript" src="/static/js/url.js"></script>
<script type="text/javascript" src="/static/js/validator.js"></script>


<script>

    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        var validatorFunc = function () {
            var validator = new Validator();

            validator.add('cn_name', [{
                rule: 'require',
                msg: '中文名称不能为空'
            }]);

            validator.add('en_name', [{
                rule: 'require',
                msg: '英文名称不能为空'
            }]);

            return validator.start();
        };


        // 获取要提交的数据
        var getSubmitData = function () {
            var data = {};

            // 获取文本框和单选按钮的数据
            var serializeArray = $('#form input').serializeArray();
            $.each(serializeArray, function (index, field) {
                data[field.name] = field.value;
            });

            return data;
        };

        // 表单提交
        $('#submit').on('click', function () {

            // 表单验证
            var errorMsg = validatorFunc();
            if (errorMsg) {
                layer.alert(errorMsg, {title: '提示'});
                return false;
            }
			
			console.log(getSubmitData());

            //异步提交
            $.ajax({
                url: "<?php echo url('authority_management/update_d'); ?>",
                type: 'post',
                dataType: 'json',
                data: getSubmitData(),
                success: function (res) {
                    layer.alert(res.msg, {title: '提示'}, function (index) {

                        // 关闭alert
                        layer.close(index);

                        // 关闭弹窗
                        qx();
                    });
                },
                error: function (jqXHR) {
                    if (jqXHR.status === 422) {
                        layer.alert(jqXHR.responseText, {title: '提示'}, function (index) {
                            layer.close(index);
                        });
                    }
                }
            });
        });

        // 取消
        function qx(){
            var index = top.layer.getFrameIndex(window.name);
            top.layer.close(index);
        }

        $('#cancel').on('click', function() {
            qx();
        });

    })
</script>


</body>
</html>