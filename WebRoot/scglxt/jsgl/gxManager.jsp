<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>工艺管理</title>
    <!-- 	    <link href="${pageContext.request.contextPath}/stylesheets/light-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" /> -->
    <!--     <link href="${pageContext.request.contextPath}/stylesheets/theme-colors.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" /> -->
    <!--     <link href="${pageContext.request.contextPath}/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" /> -->
    <!--   	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery/datatables/css/jquery.dataTables.css" type="text/css"></link> -->
    <!-- 	<link href="${pageContext.request.contextPath}/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css" media="all" rel="stylesheet" type="text/css" /> -->
    <!--     <link href="${pageContext.request.contextPath}/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" /> -->
    <!-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/plugins/datatables/dataTables.fixedColumns.css" type="text/css"></link> -->
    <!--   	<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/bootstrap/bootstrapdatatabales.css" type="text/css"></link> -->
    <!--     <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/bootstrap/bootstrpext.css" type="text/css"></link> -->
    <!--     <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/scglxt/main.css" type="text/css"></link> -->

    <!--   	<script src="${pageContext.request.contextPath}/js/jquery/jquery.min.js" type="text/javascript"></script> -->
    <!--     <script src="${pageContext.request.contextPath}/js/jquery/jquery-migrate.min.js" type="text/javascript"></script> -->
    <!--     <script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.min.js" type="text/javascript"></script> -->
    <!-- 控制主页面左侧及头部导航、控制收缩空间 -->
    <!--     <script src="${pageContext.request.contextPath}/js/theme.js" type="text/javascript"></script> -->
    <!--  引入的js common函数库  mukun 20141021-->
    <!--     <script src="${pageContext.request.contextPath}/js/util/CommonUtils.js" type="text/javascript"></script>     -->
    <!--   	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/datatables/js/jquery.dataTables.js"></script> -->
    <!--   	 <script src="${pageContext.request.contextPath}/js/plugin/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script> -->
    <script type="text/javascript" src="../../js/scglxt/jsgl/gxManage.js"></script>
</head>
<body>
<div class='container container-wrapper'>
    <div class='row' id='content-wrapper'>
        <div class='col-xs-12'>
            <div class='row rowTop'>
                <div class='col-sm-12'>
                    <div class='box bordered-box orange-border'
                         style='margin-bottom: 0;'>
                        <div class='box-header'>
                            <button id="form_add" class="btn btn-success btn-sm">
                                <i class="icon-add"></i>
                                增加
                            </button>
                            <div class='title'>
                                工序信息
                            </div>
                            <div class='actions'>
                                <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                                </a>
                            </div>
                        </div>
                        <div class='box-content box-no-padding'>
                            <table id="gxInfo" class='table table-striped table-bordered' style='margin-bottom: 0;'>
                                <thead>
                                <tr>
                                    <th>
                                        序号
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        工艺名称
                                    </th>
                                    <th>
                                        工序代号
                                    </th>
                                    <th>
                                        负责班组
                                    </th>
                                    <!-- 															<th> -->
                                    <!-- 																工序顺序 -->
                                    <!-- 															</th> -->
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
