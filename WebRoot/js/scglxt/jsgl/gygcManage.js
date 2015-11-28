/**
 * 订单信息
 * @author apple
 * @constructor
 * @date 20141024
 */
(function () {
    var operateFlag = "";
    window.GygcManage = (function () {
        var _t = this,
            _operateFlag = "",
            _bomid = "";
        _showModel = "";
        /**
         * 初始化函数
         */
        init = function () {
            $("#gygc").tableDnD();
            //注册事件
            registerEvent();
            //获取参数
            var urlParam = new Object();
            urlParam = $.GetRequest();
            _showModel = urlParam.showModel;
            tableInit(urlParam.bomid);
            _bomid = urlParam.bomid;
            loadBomGybpList(_bomid);


        },

        /**
         * 注册事件
         */
            registerEvent = function () {

                $('#btn-add').on("click", function () {
                    GygcManage.addRow();
                });
                $('#btn-save').on("click", function () {
                    GygcManage.saveFormInfo();
                });

            },
        /**
         * 初始化表格函数
         */
            tableInit = function (bomid) {
                /*var url = "bomInfo_getGygcData.action", successFun = function(data){
                 console.log(data);
                 }
                 $.asyncAjax(url, {"JSON": JSON}, successFun, true);	*/
            },
        /**
         * 删除信息
         */
            deleteRow = function (t) {
                if (confirm("确定删除？")) {
                    $(t).parent().parent().parent().remove();
                    GygcManage.changeRowSerialNum('gygc');
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
         * 保存表格信息
         * 算法：逐行保存表单信息
         */
            saveFormInfo = function (flag) {
                var rowNum = $("#gygc tbody tr").size();
                var url = "bomInfo_saveGxbpData.action", successFun = function (data) {
                    console.log(data);
                }
                var formInfo = {};
                deleteFormInfo(_bomid);
                for (var i = 0; i < rowNum; i++) {
                    formInfo.bomid = _bomid;
                    formInfo.sysb = $($("#gygc tbody>tr")[i]).find('select[info="sysb"]').attr('value');
                    formInfo.gxnr = $($("#gygc tbody>tr")[i]).find('input[info="gxnr"]').attr('value');
                    formInfo.edgs = $($("#gygc tbody>tr")[i]).find('input[info="edgs"]').attr('value');
                    formInfo.stsj = $($("#gygc tbody>tr")[i]).find('input[info="stsj"]').attr('value');
                    formInfo.serial = i;
                    var JSON = $.toJsonString(formInfo),
                        successFun = function (str) {
                            console.log(i == (rowNum - 1));
                            console.log(i);
                            console.log((rowNum - 1));
                            if (i == (rowNum ) && str == "1") {
                                alert("保存成功！");
                            }
                        }
                    $.asyncAjaxPost(url, {"JSON": JSON}, successFun, true);
                }
            },
        /**
         *  删除跟bomid 相关的工序编排  然后重新排列
         */
            deleteFormInfo = function (bomid) {
                var url = "bomInfo_deleteGxbpData.action", successFun = function (data) {
                }
                $.asyncAjaxPost(url, {"bomid": bomid}, successFun, true);
            } ,
            initHtInfo = function (flag) {

            },
        /**
         * 增加行
         */
            addRow = function () {
                var uuid = Math.uuid();
                var rowNum = $("#gygc tbody tr").size();
                var tab = document.getElementById("gygc");
                var num = tab.rows.length;
                var id = "";
                var domstr = '<tr id="' + uuid + '"> <td class="sorting_1">' + rowNum + '</td> ' +
                    '<td><div class="text-center"> <a class="btn btn-danger btn-xs" href="#" title="删除" onclick="GygcManage.deleteRow(this)"><i class="icon-remove"></i> </a></div></td>' +
                    '<td>  ' +
                    ' <select  info= "sysb" type="text" linked＝"' + uuid + '" class="grid-form-input" style="width:100%" >' +
                    '</select></td>' +
                    '<td><input class="" info="gxnr" type="text" style="width:100%" class="form-gxnr"  name="form-gxnr" ></td>' +
                    '<td><input class="" info="edgs" type="text" style="width:100%" value=""></td>' +
                    '<td><input class="" info="stsj" type="text" style="width:100%" value=""></td>' +
                    '</tr>';
                $("#gygc tbody").append(domstr);
                var selector = "#" + uuid + " select[info='sysb']";
                //  添加后重新对表格进行拖动初始化
                $("#gygc").tableDnD({
                    onDrop: function (table, row) {
                        var rows = table.tBodies[0].rows;
                        var debugStr = "Row dropped was " + row.id + ". New order: ";
                        for (var i = 0; i < rows.length; i++) {
                            debugStr += rows[i].id + " ";
                        }
//		            $(#debugArea).html(debugStr);
                        GygcManage.changeRowSerialNum("gygc");
                    },
                });
                loadGygcList(selector);
            },
        /**
         *  的那个拖动表格时候重新更改表格序号
         */
            changeRowSerialNum = function (id) {
                var $tr = $('#' + id + " tbody>tr");
                $tr.each(function (i) {
                    $(this).attr('sortnum', i);
                });
                $('#gygc tbody>tr>.sorting_1').each(function (i) {
                    $(this).html(i);
                });
            },
        /**
         *  加载加工工艺下啦列表
         */
            loadGygcList = function (selector) {
                var url = "bomInfo_getJggyData.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        $.AddSelectItemBySelector("空", '', selector);
                        for (var i = 0; i < data.length; i++) {
                            $.AddSelectItemBySelector(data[i].name, data[i].id, selector);
                        }
                    }
                }
                $.syncAjax(url, {}, successFun, true);
            },
        /**
         * 加载工艺编排列表
         */
            loadBomGybpList = function (bomid) {
                var url = "bomInfo_loadBomGybpList.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        var domstr = "";
                        $("#gygc tbody").empty();
                        for (var i = 0; i < data.length; i++) {
                            domstr = '<tr id="' + $.decodeEmptyValue(data[i].id) + '"> <td class="sorting_1">' + i + '</td> ' +
                            '<td><div class="text-center"> <a class="btn btn-danger btn-xs" href="#" title="删除" onclick="GygcManage.deleteRow(this)"><i class="icon-remove"></i> </a></div></td>' +
                            '<td class="text-center starttime hide"><div > <a class="btn btn-success btn-xs" href="#" title="删除" onclick="GygcManage.updateStarttime(this)">开 始</a></div></td>' +
                            '<td class="text-center endtime hide"><div > <a class="btn btn-success btn-xs" href="#" title="删除" onclick="GygcManage.updateEndtime(this)">结 束</a></div></td>' +
                            '<td>  ' +
                            ' <select  info= "sysb" type="text" linked＝"' + $.decodeEmptyValue(data[i].id) + '" class="grid-form-input" style="width:100%" >' +
                            '</select></td>' +
                            '<td><input class="" info="gxnr" type="text" style="width:100%" class="form-gxnr"  name="form-gxnr" value="' + $.decodeEmptyValue(data[i].gynr) + '"></td>' +
                            '<td><input class="" info="edgs" type="text" style="width:100%" value="' + $.decodeEmptyValue(data[i].edgs) + '"></td>' +
                            '<td><input class="" info="stsj" type="text" style="width:100%" value="' + $.decodeEmptyValue(data[i].stsj) + '"></td>' +
                            '<td class="starttime hide"> <input  info="stsj" type="text" style="width:100%" value="2015/07/01 12:00"></td>' +
                            '<td class="endtime hide" > <input info="stsj" type="text" style="width:100%" value="2015/07/01 12:00"></td>' +
                            '</tr>';
                            $("#gygc tbody").append(domstr);


//                        var selector = "#"+$.decodeEmptyValue(data[i].id)＋" select[info='sysb']";
                            var selector = "#" + $.decodeEmptyValue(data[i].id);
                            selector = selector.toString() + (" select[info='sysb']").toString();
                            loadGygcList(selector);
                            $(selector).find("option[value='" + $.decodeEmptyValue(data[i].gyid) + "']").attr("selected", true);
                        }


                        //加载拖动程序
                        $("#gygc").tableDnD({
                            onDrop: function (table, row) {
                                var rows = table.tBodies[0].rows;
                                var debugStr = "Row dropped was " + row.id + ". New order: ";
                                for (var i = 0; i < rows.length; i++) {
                                    debugStr += rows[i].id + " ";
                                }
                                GygcManage.changeRowSerialNum("gygc");
                            },
                        });

                        if (_showModel == 1) {
                            $('.starttime').removeClass("hide");
                            $('.endtime').removeClass("hide");
                        }
                    }


                }
                $.asyncAjax(url, {bomid: bomid}, successFun, true);


            }


        ;


        return {
            init: init,
            tableInit: tableInit,
            deleteRow: deleteRow,
            saveFormInfo: saveFormInfo,
            editRow: editRow,
            addRow: addRow,
            changeRowSerialNum: changeRowSerialNum,
            loadGygcList: loadGygcList
        }
    })();


})();


$(document).ready(function () {
    GygcManage.init();
});
 
 
	
 
 