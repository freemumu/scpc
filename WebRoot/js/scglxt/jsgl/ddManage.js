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
                    //"bAutoWidth": true, //是否自适应宽度
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
                                console.log(row)
                                return '<div class="">' +
                                    ' <a class=" " href="#"   onclick = "DdManage.editRow(\'' + data + '\')" title＝"修改"> 修改</a> ' +
                                    '<a class=" " href="#" onclick = "DdManage.deleteRow(\'' + data + '\')" title="删除"> 删除</a>' +
                                    ' <a class="" href="#" title＝"修改" onclick = "DdManage.showModel(\'' + data + '\')" >BOM</a> ' +
                                    ' <a class="" href="#"  onclick = "DdManage.showHtInfo(\'' + row.ssht + '\')" >合同</a> ' +
                                    ' </div>';
                            },
                            "targets": 1
                        },



		        { "visible": false,  "targets": [ 2 ] }
                    ],
                    "columns": [
                        {"data": null},
                        {"data": "id"},
                        {"data": "id"},
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
                new $.fn.dataTable.FixedColumns( table, {leftColumns:4});
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
                $content = "<iframe src='bomManager.jsp?model=linked&ssdd=" + data + "' class='modal_iframe'></iframe>";
                $container = $('#modal-body');
                $container.empty().append($content);
            },
            showHtInfo = function (id) {
                console.log(id);
                var url = "htInfo_getTableData.action?id=" + id, successFun = function (data) {
                    console.log(data);
                    if (data) {
                        var obj = data.data[0];
                        var str = '<dl class="dl-horizontal" style="font-size:14px"> ' +
                            '<dt>名称</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.mc)  + '</dd>' +
                            '<dt>合同编号</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.htbh) + '</dd>' +
                            '<dt>合同金额</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.htje) + '</dd>' +
                            '<dt>签署时间</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.qssj) + '</dd>' +
                            '<dt>付款状态</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.fkzt) + '</dd>' +
                            '<dt>汇款账号</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.hkzh) + '</dd>' +
                            '<dt>汇款开户行</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.hkkhh) + '</dd>' +
                            '<dt>合同明细</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.htmx) + '</dd>' +
                            '<dt>预计完成时间</dt>' +
                            '<dd>' + $.decodeEmptyValue(obj.htmx) + '</dd>' +
                            '</dl>';

                        $("#myModal .modal-body").html(str);
                    }
                };
                $.asyncAjax(url, {"id": id}, successFun, true);
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
            showHtInfo: showHtInfo
        }
    })();


})();


$(document).ready(function () {
    DdManage.init();
});
 
 
	
 
 