<?php /*a:2:{s:63:"D:\largon\laragon\www\ky\application\admin\view\admin\edit.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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

<body class="main_color">
    <div class="secWrap mainCt mainSec formReset signLimit">
        <div class="layui-container">
            <form class="layui-form" id="form">
                <div class="layui-row layui-col-space12">
                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '用户名称' : 'Name'; ?></label>
                            <div class="layui-input-block">
                                <input name="name" value="<?php echo htmlentities($info['name']); ?>" autocomplete="off" placeholder="" class="layui-input" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '邮箱' : 'Email'; ?></label>
                            <div class="layui-input-block">
                                <input name="email" value="<?php echo htmlentities($info['email']); ?>"  autocomplete="off" placeholder="" class="layui-input" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '联系电话' : 'Phone'; ?></label>
                            <div class="layui-input-block">
                                <input name="phone" value="<?php echo htmlentities($info['phone']); ?>"  autocomplete="off" placeholder="" class="layui-input" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '本职语种' : 'First Language'; ?></label>
                            <div class="layui-input-block">
                                <div id="yy" class="xm-select-demo"></div>
                                <input name="First_language" id="Language"  type="hidden" value="<?php echo htmlentities($info['First_language']); ?>" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '所属部门' : 'Department'; ?></label>
                            <div class="layui-input-block">
                                <select name="department_id" lay-filter="department_id" lay-search>
                                    <option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
                                    <?php if(is_array($bm) || $bm instanceof \think\Collection || $bm instanceof \think\Paginator): $i = 0; $__LIST__ = $bm;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                    <option value="<?php echo htmlentities($v['id']); ?>" <?php echo $v['cn_name']==$info['department_id'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '所属职位' : 'Job'; ?></label>
                            <div class="layui-input-block">
                                <select name="job_id" lay-filter="job_id" lay-search>
                                    <option value=""><?php echo session('language') == '中文'? '请选择' : 'Please Select'; ?></option>
                                    <?php if(is_array($job) || $job instanceof \think\Collection || $job instanceof \think\Paginator): $i = 0; $__LIST__ = $job;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                    <option value="<?php echo htmlentities($v['id']); ?>" <?php echo $v['cn_name']==$info['job_id'] ? 'selected' : ''; ?>><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '实习生' : 'Trainee'; ?></label>
                            <div class="layui-input-block">
                                <select name="trainee" lay-filter="trainee" lay-search>
                                    <option value="0" <?php echo $info['trainee']=='No' ? 'selected' : ''; ?>>No</option>
                                    <option value="1" <?php echo $info['trainee']=='Yes' ? 'selected' : ''; ?>>Yes</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><?php echo session('language') == '中文'? '工作状态' : 'Work Status'; ?></label>
                            <div class="layui-input-block">
                                <select name="status" lay-filter="status" lay-search>
                                    <option value="0" <?php echo $info['status']=='在职' ? 'selected' : ''; ?>><?php echo session('language')=='中文'?'在职':'on'; ?></option>
                                    <option value="1" <?php echo $info['status']=='离职' ? 'selected' : ''; ?>><?php echo session('language')=='中文'?'离职':'off'; ?></option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item layui_ic">
                            <label class="layui-form-label" title="<?php echo session('language') == '中文'? '入职时间' : 'Entry Time'; ?>">
                                <?php echo session('language') == '中文'? '入职时间' : 'Entry Time'; ?>
                            </label>
                            <div class="layui-input-block">
                                <input class="showDate layui-input" name="entry_time" value="<?php echo htmlentities($info['entry_time']); ?>" type="text">
                                <i class="layui-icon layui-icon-date"></i>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-xs4">
                        <div class="layui-form-item layui_ic">
                            <label class="layui-form-label" title="<?php echo session('language') == '中文'? '离职时间' : 'Dimission Time'; ?>">
                                <?php echo session('language') == '中文'? '离职时间' : 'Dimission Time'; ?>
                            </label>
                            <div class="layui-input-block">
                                <input class="showDate layui-input" name="dimission_time" value="<?php echo htmlentities($info['dimission_time']); ?>" type="text">
                                <i class="layui-icon layui-icon-date"></i>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo session('language') == '中文'? '签名图片' : 'Signature'; ?></label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="file_upload">
                                <i class="layui-icon layui-icon-upload"></i><?php echo session('language') == '中文'? '上传图片' : 'Upload'; ?>
                            </button>

                            <!--文件-->
                            <input type="hidden" id="zztp" name="img" value="<?php echo htmlentities($info['sign']); ?>" />
                        </div>

                        <div class="layui-input-block layer-photos-demo" style="margin-top: 20px;" id="up_div">

                            <img class="layui-upload-img" id="img_src" layer-src="" src="<?php echo htmlentities($info['sign']); ?>" alt="签名图片" style="max-width: 170px; max-height: 30px;" />

                            <span id="filename"></span>
                        </div>
                    </div>

                </div>
            </form>
        </div>

        <div class="layui-layer-btn layui-layer-btn- bottm_control">
            <a class="layui-layer-btn0" id="submit"><?php echo session('language') == '中文'? '确认' : 'OK'; ?></a>
            <a class="layui-layer-btn1" id="cancel"><?php echo session('language') == '中文'? '取消' : 'Cancel'; ?></a>
        </div>

    </div>

</body>


<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/list.js"></script>
<script type="text/javascript" src="/static/js/url.js"></script>
<script type="text/javascript" src="/static/js/validator.js"></script>


<script type="text/javascript" src="/static/js/xm-select.js"></script>

<script>

    layui.use(['form', 'layer','laydate','upload'], function () {
        var upload = layui.upload;
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        var tip;

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
                //,format: 'yyyy-MM-dd'
            });
        });

        // 语种多选
        var yy = '<?php echo $yy; ?>';
        var yyData = JSON.parse(yy);
        var yyz = xmSelect.render({
            el: '#yy',
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
            data: yyData
        });

        // 文件上传
        upload.render({
            elem: '#file_upload',               //绑定元素
            url: "<?php echo url('admin/up_sign'); ?>",     //上传接口
            accept: 'images',                   //允许类型

            // 选中
            choose: function(obj) {

                obj.preview(function(index, file, result) {

                    $('#filename').text(file.name); // 显示文件名

                    $('#img_src').attr('src', result); // 图片预览

                    $('#up_div').show();
                });

                tip = layer.msg('Uploading', {icon: 16, shade: 0.3, time:0});
            },
            done: function (res) {

                if(res.code === 0) {

                    layer.close(tip);

                    $('#zztp').val(res.data);//写入图片路径

                    //上传完毕回调
                    layer.alert('上传成功');
                }
            }
        });

        var validatorFunc = function () {
            var validator = new Validator();

            validator.add('name', [{
                rule: 'require',
                msg: '用户名称不能为空'
            }]);

            // 邮件
            validator.add('email', [{
                rule: 'email',
                msg: '邮件格式错误'
            }]);

            // 电话
            validator.add('phone', [{
                rule: 'phone',
                msg: '联系电话格式错误'
            }]);

            validator.add('department_id', [{
                rule: 'require',
                msg: '所属部门不能为空'
            }]);

            validator.add('job_id', [{
                rule: 'require',
                msg: '所属职位不能为空'
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

            var yyArr = yyz.getValue();
            var yyLength = yyArr.length;
            var yynamestr = '';
            for(var i=0; i< yyLength; i++ ) {
                yynamestr += yyArr[i].name + ',';
            }
            yynamestr = yynamestr.substring(0, yynamestr.length - 1);
            $('#Language').val(yynamestr);
			
			// 下拉框取值
			data.department_id = $('[name=department_id]').val();
			data.job_id = $('[name=job_id]').val();
            data.trainee = $('[name=trainee]').val();
			data.status = $('[name=status]').val();
            data.First_language = $('[name=First_language]').val();

            // 签名
            data.sign = $('#zztp').val();

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

            if($('[name=status]').val() == 1){

                if($('[name=dimission_time]').val() == ''){

                    layer.alert('离职时间不能为空', {title: '提示'});
                    return false;
                }
            }

            //异步提交
            $.ajax({
                url: "<?php echo url('admin/admin/update', ['id' => $info['id']]); ?>",
                type: 'put',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify(getSubmitData()),
                success: function (res) {
                    layer.alert(res.msg, {title: '提示'}, function (index) {
                        // 列表的数据表格重载
                        top.main['tableIns'].reload();

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