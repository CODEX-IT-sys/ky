<?php /*a:2:{s:69:"D:\largon\laragon\www\ky\application\admin\view\statistics\index.html";i:1615786782;s:18:"./layout/list.html";i:1615863909;}*/ ?>
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
                    <a href="<?php echo url('Statistics/index'); ?>" class="on"><?php echo session('language') == '中文'? '数据统计' : 'Statistics Management'; ?></a>
                </div>
            </div>
            <div class="mainLead">
                <div class="stati">

                    <ul>
                    <?php if(is_array($report_menu) || $report_menu instanceof \think\Collection || $report_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $report_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>

                        <li title="<?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?>">
                            <a href="<?php echo url($v['url']); ?>">
                                <i class="iconfont icon-shuju"></i>
                                <h6><?php echo session('language') == '中文'? $v['cn_name'] : $v['en_name']; ?></h6>
                            </a>
                        </li>

                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>

                    <!--<ul>
                        <li title="翻译量对比统计">
                            <a href="translation_volume_contrast.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>翻译量对比统计</h6>
                            </a>
                        </li>
                        <li title="翻译金额对比统计">
                            <a href="translation_money_contrast.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>翻译金额对比统计</h6>
                            </a>
                        </li>
                        <li title="年度翻译量汇总">
                            <a href="annual_translation_summary.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>年度翻译量汇总</h6>
                            </a>
                        </li>
                        <li title="销售人员销售额汇总">
                            <a href="salesman_sales_summary.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>销售人员销售额汇总</h6>
                            </a>
                        </li>
                        <li title="工作绩效统计">
                            <a href="work_performance_statistics.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>工作绩效统计</h6>
                            </a>
                        </li>
                        <li title="翻译人员质量评估">
                            <a href="translator_quality_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>翻译人员质量评估</h6>
                            </a>
                        </li>
                        <li title="合同记录表">
                            <a href="contract_record_form.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>合同记录表</h6>
                            </a>
                        </li>
                        <li title="校对人员质量评估">
                            <a href="proofreader_quality_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>校对人员质量评估</h6>
                            </a>
                        </li>
                        <li title="排版人员质量评估">
                            <a href="typesetter_quality_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>排版人员质量评估</h6>
                            </a>
                        </li>
                        <li title="质量分析">
                            <a href="quality_analysis.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>质量分析</h6>
                            </a>
                        </li>
                        <li title="翻译校对人员综合考核">
                            <a href="translation_proofreader_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>翻译校对人员综合考核</h6>
                            </a>
                        </li>
                        <li title="排版人员综合考核">
                            <a href="typesetter_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>排版人员综合考核</h6>
                            </a>
                        </li>
                        <li title="项目助理综合考核">
                            <a href="project_assistant_assessment.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>项目助理综合考核</h6>
                            </a>
                        </li>
                        <li title="项目通道">
                            <a href="project_access.html">
                                <i class="iconfont icon-shuju"></i>
                                <h6>项目通道</h6>
                            </a>
                        </li>
                    </ul>-->
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



</body>
</html>