/**
 * 订单信息
 * @author apple
 * @constructor
 * @date 20141024
 */
(function () {
    var operateFlag = "";
    window.DdManage = (function () {
        var _t = this,
            _operateFlag = "",
            /**
             * 初始化函数
             */

            init = function () {
                var urlParam = new Object();
                urlParam = $.GetRequest();
                tableInit(urlParam);
                registerEvent();
            },
            /**
             * 注册事件
             */
            registerEvent = function () {
                $("#form_add").on('click', function () {
                    Main.swapIframUrl('scglxt/jsgl/editDdInfo.jsp');//跳转iframe页面
                })
            },
            /**
             * 初始化表格函数
             */
            tableInit = function (urlParam) {
                var ssht = "";
                if (urlParam != null && urlParam.ssht != "" && urlParam.ssht != undefined) {
                    ssht = urlParam.ssht;
                }
                var table = $('#ddInfo').DataTable({
//			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                    "bLengthChange": false,
                    "oLanguage": {
                        "sProcessing": "正在加载中......",
                        "sLengthMenu": "每页显示 _MENU_ 条记录",
                        "sZeroRecords": "对不起，查询不到相关数据！",
                        "sEmptyTable": "表中无数据存在！",
                        "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                        "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                        "sSearch": "搜索",
                        "oPaginate": {
                            "sFirst": "首页",
                            "sPrevious": "上一页",
                            "sNext": "下一页",
                            "sLast": "末页"
                        }
                    },
                    "aLengthMenu": [20, 30],
                    "ajax": "ddInfo_getTableData.action?ssht=" + ssht,
                    "sScrollY": 450, //DataTables的高
                    "sScrollX": 4000, //DataTables的宽
                    "bAutoWidth": true, //是否自适应宽度
                    scrollY: true,
                    scrollX: true,
                    scrollCollapse: true,
                    paging: true,
                    columnDefs: [
                        {width: '20%', targets: 0}
                    ]
                    ,
//			"ajax":"ddInfo_getTableData.action",
                    "columnDefs": [
                        {
                            "render": function (data, type, row) {
                                return '<div class="text-center">' +
                                    ' <a class="btn btn-success btn-xs" href="#" title＝"修改"><i class="icon-edit" onclick = "DdManage.editRow(\'' + data + '\')"></i></a> ' +
                                    '<a class="btn btn-danger btn-xs" href="#" title="删除"><i class="icon-remove" onclick = "DdManage.deleteRow(\'' + data + '\')"></i></a>' +
                                    ' </div>';
                            },
                            "targets": 1
                        },
                        {
                            "render": function (data, type, row) {
                                return '<div class="text-center">' +
                                    ' <a class="" href="#" title＝"修改" onclick = "DdManage.showModel(\'' + data + '\')" >查看</a> ' +
                                    ' </div>';
                            },
                            "targets": 2
                        },
                        {
                            "render": function (data, type, row) {
                                console.log(data) ;
                                return '<div class="text-center">' +
                                    ' <a class="" href="#"  onclick = "DdManage.showHtInfo(\'' + data + '\')" >所属合同</a> ' +
                                    ' </div>';
                            },
                            "targets": 4
                        },
                        {
                            "targets": [3],
                            "visible": false
                        },
//		        { "visible": true,  "targets": [ 2 ] }
                    ],
                    "columns": [
                        {"data": null,},
                        {"data": 'id',},
                        {"data": "id"},
                        {"data": "id"},
                        {"data": "ssht"},
                        {"data": "xmname"},
                        {"data": "ddlevel"},
                        {"data": "jhdate"},
                        {"data": "planstarttime"},
                        {"data": "planendtime"},
                        {"data": "realstarttime"},
                        {"data": "realendtime"},
                        {"data": "zgs"},
                        {"data": "dqjd"},
                        {"data": "tz"},
                        {"data": "remark"},
                        {"data": "xmlxr"},
                        {"data": "xmfzr"},
                        {"data": "ckzt"},
                        {"data": "ckdate"}

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
                var url = "ddInfo_deleteRow.action", successFun = function (resStr) {
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
            /**
             * @description 点击编辑按钮时候跳转到编辑页面，通过url传参
             */
            editRow = function (id) {
                Main.swapIframUrl('scglxt/jsgl/editDdInfo.jsp?id=' + id);//跳转iframe页面
            },
            /**
             * 更新合同信息
             */
            saveHtInfo = function (flag) {

            },
            initHtInfo = function (flag) {

            },
            /**
             * 显示model框
             */
            showModel = function (data) {
                $('#myModal').modal({
                    backdrop: false,
                    show: true
                });
                //在modalbody 中家在iframe 内容为 工序编排的内容
                $content = "<iframe src='bomManager.jsp?ssdd=" + data + "' class='modal_iframe'></iframe>";
                $container = $('#modal-body');
                $container.empty().append($content);
            },
            showHtInfo = function (data) {
                $('#myModal').modal({
                    backdrop: false,
                    show: true
                });
            }
            ;
        return {
            init: init,
            deleteRow: deleteRow,
            editRow: editRow,
            showModel: showModel,
            showHtInfo:showHtInfo
        }
    })();


})();


$(document).ready(function () {
    DdManage.init();
});
 
 
	
 
 