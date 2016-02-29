<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>工艺管理</title>
    <script type="text/javascript" src="../../js/scglxt/jsgl/gxManage.js"></script>
</head>
<body>
<div class='container-fluid'>
    <div class='row' id='content-wrapper'>
        <div class='row rowTop'>
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
                            <th>
                                是否外协
                            </th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
