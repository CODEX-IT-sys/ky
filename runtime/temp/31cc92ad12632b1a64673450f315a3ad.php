<?php /*a:1:{s:74:"D:\largon\laragon\www\ky\application\admin\view\mk_invoice\request_cn.html";i:1615786782;}*/ ?>
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
	<link rel="shortcut icon" href="/static/template/images/logo-icon.ico">
	<link href="/static/template/bills.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="tbShow a4-broadwise">
	<div class="tbWrap">
		<div class="tbContent">
			<div class="tbWatermark">
				<img src="/static/template/images/ky-watermark1.png" >
			</div>
			<div class="tbHeader">
				<ul>
					<li class="header_logo">
						<img src="/static/template/images/ky-logo1.png">
					</li>
					<li class="header_title">
						<dl>
							<dd>info@codex-trans.com/info@codex-sci.com</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="tbArticle">
				<h2 class="art_title">INVOICE</h2>
				<h6 class="art_attach">No.:<?php echo htmlentities($i['Invoice_Number']); ?></h6>
				<div class="artItem">
					<ul>
						<li>
							<b>To: </b>
							<span><?php echo htmlentities($i['To']); ?></span>
						</li>
						<li>
							<b>Attention: </b>
							<span><?php echo htmlentities($i['Attention']); ?></span>
						</li>
						<li>
							<b>Address: </b>
							<span><?php echo htmlentities($i['Company_Address']); ?></span>
						</li>
						<li>
							<b>Email: </b>
							<span><?php echo htmlentities($i['Email']); ?></span>
						</li>
					</ul>
					<ul>
						<li>
							<b>Date:</b>
							<span><?php echo htmlentities($i['Invoicing_Date']); ?></span>
						</li>
						<li>
							<b>Issued by: </b>
							<span><?php echo htmlentities($i['Issued_by']); ?></span>
						</li>
						<li>
							<b>VAT ID: </b>
							<span><?php echo htmlentities($i['VAT_ID']); ?></span>
						</li>
						<li>
							<b>Address: </b>
							<span><?php echo htmlentities($i['Address']); ?></span>
						</li>
					</ul>
				</div>
				<div class="artShow">
					<ul>
						<li>
							<b>Currency: </b>
							<span><?php echo htmlentities($i['Currency']); ?></span>
						</li>
					</ul>
				</div>
				<div class="artTable">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>文件编号</th>
							<th width="60">页数</th>
							<th>文件<br/>类型</th>
							<th>委托<br/>日期</th>
							<th width="60">提交<br/>日期</th>
							<th>文件名称</th>
							<th width="60">服务</th>
							<th width="60">语种</th>
							<th width="90">单位</th>
							<th width="60">交付<br/>数量</th>
							<th width="60">单价</th>
							<th>未税<br/>金额</th>
							<th>增值<br/>税额</th>
							<th>请款<br/>金额</th>
						</tr>

						<?php if(is_array($table) || $table instanceof \think\Collection || $table instanceof \think\Paginator): $i = 0; $__LIST__ = $table;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
						<tr>
							<td><?php echo htmlentities($v['Filing_Code']); ?></td>
							<td><?php echo htmlentities($v['Pages']); ?></td>
							<td><?php echo htmlentities($v['File_Type']); ?></td>
							<td><?php echo htmlentities($v['Assigned']); ?></td>
							<td><?php echo htmlentities($v['Completed']); ?></td>
							<td><?php echo htmlentities($v['Job_Name']); ?></td>
							<td><?php echo htmlentities($v['Service']); ?></td>
							<td width="60"><?php echo htmlentities($v['Language']); ?></td>
							<td width="90"><?php echo htmlentities($v['Units']); ?></td>
							<td><?php echo htmlentities($v['Unit_Quantity']); ?></td>
							<td><?php echo htmlentities($v['Unit_Price']); ?></td>
							<td><?php echo htmlentities($v['Net_Amount']); ?></td>
							<td><?php echo htmlentities($v['VAT_Amount']); ?></td>
							<td><?php echo htmlentities($v['Invoicing_Amount']); ?></td>
						</tr>
						<?php endforeach; endif; else: echo "" ;endif; ?>

					</table>
				</div>
				<div class="artAttach">
					<dl>
						<dd>
							<b>Total Amount without VAT:</b>
							<span><?php echo htmlentities($z['ta']); ?></span>
						</dd>
						<dd>
							<b>Total VAT Amount:</b>
							<span><?php echo htmlentities($z['tv']); ?></span>
						</dd>
						<dt>
							<b>Total Invoicing Amount:</b>
							<span><?php echo htmlentities($z['tq']); ?></span>
						</dt>
					</dl>
				</div>
				<div class="artRemark">
					<h5>银行信息:</h5>
					<textarea id="textarea" class="bank_info" readonly><?php echo htmlentities($bank_info); ?></textarea>
				</div>
				<div class="artThanks">
					<span>THANK YOU!</span>
				</div>
			</div>
			<div class="tbFooter">
				<span>www.codex-trans.com</span>
				<i>/</i>
				<span>www.codex-sci.com</span>
			</div>
		</div>
	</div>

</div>
</body>
</html>
<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script>

    $(function () {

        /**
         * 文本框根据输入内容自适应高度
         * @param                {HTMLElement}        输入框元素
         * @param                {Number}                设置光标与输入框保持的距离(默认0)
         * @param                {Number}                设置最大高度(可选)
         */
        var autoTextarea = function (elem, extra, maxHeight) {
            extra = extra || 0;
            var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
                isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
                addEvent = function (type, callback) {
                    elem.addEventListener ?
                        elem.addEventListener(type, callback, false) :
                        elem.attachEvent('on' + type, callback);
                },
                getStyle = elem.currentStyle ? function (name) {
                        var val = elem.currentStyle[name];

                        if (name === 'height' && val.search(/px/i) !== 1) {
                            var rect = elem.getBoundingClientRect();
                            return rect.bottom - rect.top -
                                parseFloat(getStyle('paddingTop')) -
                                parseFloat(getStyle('paddingBottom')) + 'px';
                        };

                        return val;
                    } : function (name) {
                        return getComputedStyle(elem, null)[name];
                    },
                minHeight = parseFloat(getStyle('height'));

            elem.style.resize = 'none';

            var change = function () {
                var scrollTop, height,
                    padding = 0,
                    style = elem.style;

                if (elem._length === elem.value.length) return;
                elem._length = elem.value.length;

                if (!isFirefox && !isOpera) {
                    padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
                };
                scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

                elem.style.height = minHeight + 'px';
                if (elem.scrollHeight > minHeight) {
                    if (maxHeight && elem.scrollHeight > maxHeight) {
                        height = maxHeight - padding;
                        style.overflowY = 'auto';
                    } else {
                        height = elem.scrollHeight - padding;
                        style.overflowY = 'hidden';
                    };
                    style.height = height + extra + 'px';
                    scrollTop += parseInt(style.height) - elem.currHeight;
                    document.body.scrollTop = scrollTop;
                    document.documentElement.scrollTop = scrollTop;
                    elem.currHeight = parseInt(style.height);
                };
            };

            addEvent('propertychange', change);
            addEvent('input', change);
            addEvent('focus', change);
            change();
        };

        var text = document.getElementById("textarea");
        autoTextarea(text);// 调用

    })

</script>
