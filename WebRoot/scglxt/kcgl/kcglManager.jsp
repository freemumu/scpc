<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<!DOCTYPE html>
<html>
<head><title>bom表管理</title>
    <script type="text/javascript" src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
    <%--<script type="text/javascript" src="../../js/scglxt/jsgl/bomManage.js"></script>--%>
</head>
<body>
<div class='container container-wrapper'>
    <div class='row' id='content-wrapper'>
        <div class='row rowTop'>
            <div class='box bordered-box ' style='margin-bottom: 0;'>
                <div class='box-header'>
                    <button id="form_add" class="btn btn-success btn-sm"><i class="icon-add"></i> 增加</button>
                    <div class='title'> BOM表</div>
                    <div class='actions'><a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                    </a> <a class="btn box-collapse btn-xs btn-link" href="#"><i></i> </a></div>
                </div>
                <div class='box-content box-no-padding'>
                    <div class='responsive-table'>
                        <div class='scrollable-area'>
                            <table id="bomInfo" class='table table-striped table-bordered tableGrid cell-border'
                                   style='margin-bottom: 0;'>
                                <thead>
                                <tr>
                                    <th> 序号</th>
                                    <th> 操作</th>

                                    <th> ID</th>
                                    <th> 子订单名称</th>
                                    <th> 子订单材质</th>
                                    <th> 工序内容</th>
                                    <th> 料的形状</th>
                                    <th> 料的大小</th>
                                    <th> 料的体积</th>
                                    <th> 料的金额</th>
                                    <th> 加工数量</th>
                                    <th> 表面处理</th>
                                    <th> 子订单开始时间</th>
                                    <th> 子订单结束时间</th>
                                    <th> 子订单工时</th>
                                    <th> 当前备料情况</th>
                                    <th> 备料开始时间</th>
                                    <th> 备料结束时间</th>
                                    <th> 料的状态</th>





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

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:750px;height:500px;">
        <div class="modal-content" style="height:90%;">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true" style="margin-top:-10px">
                    &times;
                </button>
            </div>
            <div class="modal-body" id="modal-body">
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

</body>

<script>

    /** 订单信息 @author apple @constructor @date 20141024 */ (function () {
        var operateFlag = "";
        window.BomManage = (function () {
            var _t = this, _operateFlag = "",

                    /** 初始化函数 */
                    init = function () {
                        var request = $.GetRequest() ;
                        var ssdd = null ;
                        if(request.ssdd){
                            ssdd=request.ssdd ;
                        }
                        tableInit(ssdd);
                        registerEvent();
                        $("#")
                    },

                    /** 注册事件 */
                    registerEvent = function () {
                        $("#form_add").on('click', function () {
                            Main.swapIframUrl('scglxt/jsgl/editBomInfo.jsp');
                            /*跳转iframe页面*/
                        })
                    },
                    /** 初始化表格函数 */
                    tableInit = function (ssdd) {

                        var table = $('#bomInfo').DataTable({
                            /*			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",*/
                            "bLengthChange": false,
                            "oLanguage": {
                                "sProcessing": "正在加载中......",
                                "sLengthMenu": "每页显示 _MENU_ 条记录",
                                "sZeroRecords": "对不起，查询不到相关数据！",
                                "sEmptyTable": "表中无数据存在！",
                                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                                "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                                "sSearch": "搜索",
                                "oPaginate": {"sFirst": "首页", "sPrevious": "上一页", "sNext": "下一页", "sLast": "末页"}
                            },
                            "aLengthMenu": [20, 30],
                            "ajax": "bomInfo_getTableData.action?ssdd="+ssdd,
                            scrollY: "disabled",
                            scrollX: true, /*scrollCollapse: false,*/
                            paging: true,
                            columnDefs: [/*{ width: '20%', targets: 0 }*/],
                            "columnDefs": [{
                                "render": function (data, type, row) {
                                    return '<div class="text-center">' + ' <a class="btn btn-primary btn-xs" href="#" title="工序编排" onclick = "BomManage.showModel(\'' + data + '\')"><i class="icon-ok" ></i>工艺编排</a>' + ' <a class="btn btn-info btn-xs" href="#" title＝"修改" onclick = "BomManage.editRow(\'' + data + '\')"><i class="icon-edit" ></i></a>' + ' <a class="btn btn-danger btn-xs" href="#" title="删除"><i class="icon-remove" onclick = "BomManage.deleteRow(\'' + data + '\')"></i></a></div>';
                                }, "targets": 1
                            }, {"visible": false, "targets": [2]} /*是否显示列*/],
                            "columns": [{"data": null, "sWidth": "60px"}, {
                                "data": 'id',
                                "sWidth": "200px"
                            }, {"data": "id"}, {"data": "zddmc", "sWidth": "120px"}, {
                                "data": "zddcz",
                                "sWidth": "120px"
                            }, {
                                "data": "gxnr",
                                "sWidth": "300px"
                            }, {"data": "clxz"},
                                {"data": "cldx"},
                                {"data": "cltj"},
                                {"data": "clje"},
                                {"data": "jgsl"},
                                {"data": "bmcl"},
                                {
                                    "data": "starttime",
                                    "sWidth": "120px"
                                }, {"data": "endtime", "sWidth": "120px"},
                                {"data": "gs", "sWidth": "120px"},
                                {"data": "blqk", "sWidth": "120px"},
                                {"data": "blkssj", "sWidth": "120px"},
                                {"data": "bljssj", "sWidth": "120px"},
                                {"data": "clzt", "sWidth": "120px"},
                                {"data": "cgry"},
                                {"data": "cgsj"},
                                {"data": "rksj", "sWidth": "120px"},
                                {"data": "ddtz", "sWidth": "120px"},
                                {"data": "bfjs"},
                                {"data": "bhgjs", "sWidth": "120px"},
                            ]

                        });

                        /**加上序号**/
                        table.on('order.dt search.dt', function () {
                            table.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw();
                        new $.fn.dataTable.FixedColumns(table, {leftColumns: 3});

                    },
                    /**
                     * 删除信息
                     */
                    deleteRow = function (id) {
                        var url = "bomInfo_deleteRow.action", successFun = function (resStr) {
                            if (resStr == "SUCCESS") {
                                window.location.reload();
                                $("#sorting-advanced").dataTable().fnPageChange('previous', true);
                                alert("SUCCESS！");
                            }
                        };
                        if (confirm("确定删除？")) {
                            $.asyncAjaxPost(url, {"id": id}, successFun, true);
                        }
                        //判断是否要删除
                        //删除数据库成功后删除表格
                        //1、删除数据库
                        //2、删除表格
                    },
            //跳转页面
                    editRow = function (id) {
                        alert();
                        Main.swapIframUrl('scglxt/jsgl/editBomInfo.jsp?id=' + id);//跳转iframe页面
                    },
                    /**
                     * 更新合同信息
                     */
                    saveHtInfo = function (flag) {

                    },
                    initHtInfo = function (flag) {

                    },
                    /**
                     * 显示modal框
                     */
                    showModel = function (data) {
                        $('#myModal').modal({
                            backdrop: false,
                            show: true
                        });
                        //在modalbody 中家在iframe 内容为 工序编排的内容
                        $content = "<iframe src='gygcManager.jsp?bomid=" + data + "' class='modal_iframe'></iframe>";
                        $container = $('#modal-body');
                        $container.empty().append($content);
                    }

                    ;

            return {
                init: init,
                deleteRow: deleteRow,
                editRow: editRow,
                showModel: showModel
            }
        })();
    })();
    $(document).ready(function () {
        BomManage.init();
    });

</script>
</html>
