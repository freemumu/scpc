/**
 * 默认的配置js 用来初始化导入js以及其他初始化方法
 * 没有保存操作 ，每次保存时候对相应的bomid 进行删除 然后进行保存
 * @author mukun 20140507
 */
(function () {
    this.BomEditManage = (function () {
        var _t = this,
            _flag = "",//标志位 区分当前表单是add模式还是update模式
            /**
             * 初始化表单信息
             */
            init = function () {
                var _this = this;
                //返回按钮
                $("#form_bomInfo_ssdd").select2();
                $("#form_return").click(function () {
                    var $outFrame = $(window.parent.document.body);
                    var $iframe = $outFrame.find("#mainIframe");
                    var src = $iframe.attr("src");
                    $iframe.attr('src', "scglxt/jsgl/BomManager.jsp");
                });
                $('#btn_save').live('click', function () {
                    saveFormInfo(_this._flag);
                });
                $("#form_bomInfo_clxz").on("change", function (e) {
                    if ($(this).val() == 1) {
                        $("#form_bomInfo_cldx_jx").removeAttr("hidden");
                        $("#form_bomInfo_cldx_yx").attr("hidden", true);
                    } else {
                        $("#form_bomInfo_cldx_jx").attr("hidden", true);
                        $("#form_bomInfo_cldx_yx").removeAttr("hidden");
                    }
                });
                registerEvent();
                var urlParam = new Object();
                urlParam = $.GetRequest();
                if (urlParam && urlParam.id) {
                    _this._flag = "UPDATE";
                    //如果是update模式 则加载初始化信息
                    _this.initFormInfo(urlParam.id);
                } else {
                    _this._flag = "ADD";
                }
                //初始化日期控件
                $('#form_bomInfo_starttime').datetimepicker({
                    format: 'yyyy-mm-dd hh:ii'
                });
                $('#form_bomInfo_endtime').datetimepicker({
                    format: 'yyyy-mm-dd hh:ii'
                });
                loadSsddList();
            },
            /**
             * 注册事件
             */
            registerEvent = function () {
                var that = this;
                $("#form_return").on('click', function () {
                    Main.swapIframUrl('scglxt/jsgl/bomManager.jsp');//跳转iframe页面
                })
                $("#btn-calculateValume").on("click", function (e) {
                    calculateVolume();
                });
            },
            initFormInfo = function (id) {
                var url = "bomInfo_getDetailInfo.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        var select = $('#form_bomInfo input[info="fromInfo"]');
                        //循环给表单赋值
                        for (var i = 0; i < select.length; i++) {
                            var s = select[i];
                            var id = $(s).attr("id");
                            id = id.split("_")[2];
                            var key = id.toLowerCase();
                            var value = eval("data[0]." + key);
                            if (value == undefined) {
                                value = "";
                            }
                            for (var j in data[0]) {
                                if (id.toLowerCase() == j) {
                                    console.log(id);
                                    console.log(value);
                                    //$(s).attr("value", value);
                                    $(s).val(value);
                                    $(s).attr("title", value);
                                }
                            }
                        }
                    }

                }
                $.asyncAjax(url, {"id": id}, successFun, true);
            },
            /**
             * 保存或者更改表单信息
             */
            saveFormInfo = function (flag) {
                var formInfo = {
                    flag: flag
                }
                var JSON = $.toJsonString(formInfo);
                var $save = $('#btn_save'), $saving = $('#btn_save');
                var url = "bomInfo_updateInfo.action?flag=" + flag, successFun = function (resStr) {
                    if (resStr == "SUCCESS") {
                        alert('保存成功！');
                    }
                }
                //$.asyncAjaxPost(url, {"JSON": JSON}, successFun, true);
                $.asyncAjaxPost(url, $('#form_bomInfo').serialize(), successFun, true);

            },
            /**
             * 加载相应子订单的工艺过程
             */
            loadGygcList = function (bomid) {
                var url = "ddInfo_loadGygcList.action", successFun = function (resStr) {
                    if (resStr == "SUCCESS") {
                        alert('保存成功！');
                    }
                }
                $.asyncAjaxPost(url, {"JSON": JSON}, successFun, true);
            },
            /**
             * 加载子订单材质列表
             */
            loadZddczList = function () {
                var url = "bomInfo_loadClInfoJson.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        console.log(data);
                        $("#form_bomInfo_zddcz").empty();
                        for (var i = 0; i < data.length; i++) {
                            //$.AddSelectItem(data[i].clmc, data[i].id, "form_bomInfo_zddcz");
                            $("#form_bomInfo_zddcz").append('<option value="' + data[i].id + '" mi="' + data[i].mi + '" cldj="' + data[i].cldj + '" >' + data[i].clmc + '</option>');
                        }
                    }
                };
                $.asyncAjax(url, {}, successFun, true);
            },
            loadSsddList = function () {
                var url = "bomInfo_loadSsddList.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        $("#form_bomInfo_ssdd").empty();
                        for (var i = 0; i < data.length; i++) {
                            $.AddSelectItem(data[i].mc, data[i].id, "form_bomInfo_ssdd");
                        }
                    }
                };
                $.asyncAjax(url, {"pid": "04"}, successFun, true);
            },


            loadDdList = function () {
                var url = "common_loadSjzdList.action", successFun = function (data) {
                    if (data && data.length > 0) {
                        console.log(data);
                        $("#form_bomInfo_zddcz").empty();
                        for (var i = 0; i < data.length; i++) {
                            $.AddSelectItem(data[i].mc, data[i].id, "form_bomInfo_zddcz");
                        }
                    }
                };
                $.asyncAjax(url, {"pid": "04"}, successFun, true);
            },
            calculateVolume = function () {
                var clxz = $("#form_bomInfo_clxz").val(), volume = 0;
                if (clxz == 1) {
                    var l = $("#form_bomInfo_cldx_jx input[name=length]").val();
                    var w = $("#form_bomInfo_cldx_jx input[name=width]").val();
                    var h = $("#form_bomInfo_cldx_jx input[name=height]").val();
                    volume = l * w * h;

                } else if (clxz == 2) {
                    var d = $("#form_bomInfo_cldx_yx input[name=length]").val();
                    var h = $("#form_bomInfo_cldx_yx input[name=height]").val();
                    volume = 3.14 * (d / 2) * h;
                }
                $("#form_bomInfo_cltj").val(volume);
                var clje = null;
                var density = $("#form_bomInfo_zddcz").find("option:selected").attr("mi");
                var price = $("#form_bomInfo_zddcz").find("option:selected").attr("cldj");
                clje = volume * density * price;
                $("#form_bomInfo_clje").val(clje);
            }
            ;
        return {
            init: init,
            initFormInfo: initFormInfo,
            saveFormInfo: saveFormInfo,
            loadZddczList: loadZddczList
        }

    })();
})();
$(document).ready(function () {
//	});
    BomEditManage.init();
    BomEditManage.loadZddczList();
});