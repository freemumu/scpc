/**
 * 订单信息
 * @author apple
 * @constructor
 * @date 20141024
 */
(function () {
    var operateFlag = "";
    window.Main = (function () {
        var _t = this,
            _operateFlag = "",
            /**
             * 初始化函数
             */
            init = function () {
                var headHeight = $("body > header").height();
                var height = document.body.clientHeight;
                $("#wrapper").css("height", height - headHeight + "px");
                changeNavUrl("");
                addNavEvent();
            },
            addNavEvent = function () {
                //  客户信息管理
                $.addEvent('khxxgl', 'click', function () {
                    Main.changeNavUrl('khxxgl');
                });
                //  合同管理
                $.addEvent('htgl', 'click', function () {
                    Main.changeNavUrl('htgl');
                });
                //订单管理
                $.addEvent('ddgl', 'click', function () {
                    Main.changeNavUrl('ddgl');
                });
                //bom表管理
                $.addEvent('bomgl', 'click', function () {
                    Main.changeNavUrl('bomgl');
                });
                //工序管理
                $.addEvent('gxgl', 'click', function () {
                    Main.changeNavUrl('gxgl');
                });
                //工艺管理
                $.addEvent('gygl', 'click', function () {
                    Main.changeNavUrl('gygl');
                });
                //设备管理
                $.addEvent('sbgl', 'click', function () {
                    Main.changeNavUrl('sbgl');
                });
                //班组管理
                $.addEvent('bzgl', 'click', function () {
                    Main.changeNavUrl('bzgl');
                });
                //人员管理
                $.addEvent('rygl', 'click', function () {
                    Main.changeNavUrl('rygl');
                });
                //排产任务管理
                $.addEvent('pcrwgl', 'click', function () {
                    p
                    Main.changeNavUrl('pcrwgl');
                });
                //生产绩效管理
                $.addEvent('scjxgl', 'click', function () {
                    Main.changeNavUrl('scjxgl');
                });
                //订单采购管理
                $.addEvent('ddcggl', 'click', function () {
                    Main.changeNavUrl('ddcggl');
                });
                //供货商管理
                $.addEvent('ghsgl', 'click', function () {
                    Main.changeNavUrl('gygl');
                });
                //外协管理
                $.addEvent('wxgl', 'click', function () {
                    Main.changeNavUrl('gygl');
                });
                //质量管理
                $.addEvent('zlgl', 'click', function () {
                    Main.changeNavUrl('zlgl');
                });
                //基本零件管理
                $.addEvent('jbljgl', 'click', function () {
                    Main.changeNavUrl('jbljgl');
                });
                //生产材料管理
                $.addEvent('scclgl', 'click', function () {
                    Main.changeNavUrl('scclgl');
                });
                //库存管理
                $.addEvent('kcgl', 'click', function () {
                    Main.changeNavUrl('kcgl');
                });
                //采购管理
                $.addEvent('cggl', 'click', function () {
                    Main.changeNavUrl('cggl');
                });

                //产品管理
                $.addEvent('cpgl', 'click', function () {
                    Main.changeNavUrl('cpgl');
                });
                //业务类型管理
                $.addEvent('ywlxgl', 'click', function () {
                    Main.changeNavUrl('ywlxgl');
                });
                //bom表管理
                $.addEvent('bomgl', 'click', function () {
                    Main.changeNavUrl('bomgl');
                });
                //供货商管理
                $.addEvent('ghsgl', 'click', function () {
                    Main.changeNavUrl('ghsgl');
                });
                //产品质量管理
                $.addEvent('cpzlgl', 'click', function () {
                    Main.changeNavUrl('cpzlgl');
                });

            },
            /**
             * 改变导航iframe的 url
             */
            changeNavUrl = function (key) {
                var url = "";
                switch (key) {
                    case "khxxgl":
                        url = "scglxt/xsgl/khxxManager.jsp";
                        break;
                    case "htgl":
                        url = "scglxt/xsgl/htManager.jsp";
                        break;
                    case "ddgl":
                        url = "scglxt/jsgl/ddManager.jsp";
                        break;
                    case "bomgl":
                        url = "scglxt/jsgl/bomManager.jsp";
                        break;
                    case "sbgl":
                        url = "scglxt/scgl/sbxxIndex.jsp";
                        break;
                    case "bzgl":
                        url = "scglxt/scgl/bzxxIndex.jsp";
                        break;
                    case "rygl":
                        url = "scglxt/scgl/ryxxIndex.jsp";
                        break;
                    case "ghsgl":
                        url = "scglxt/cggl/ghsManager.jsp";
                        break;
                    case "gxgl":
                        url = "scglxt/jsgl/gxManager.jsp";
                        break;
                    case "gygl":
                        url = "scglxt/jsgl/gyManager.jsp";
                        break;
                    //班组管理
                    case "bzgl":
                        url = "scglxt/scgl/bzxxIndex.jsp";
                        break;
                    //排产任务管理
                    case "pcrwgl":
                        url = "scglxt/scgl/pcglIndex.jsp";
                        break;
                    //排产任务管理
                    case "ghsgl":
                        url = "scglxt/cggl/ghsManager.jsp";
                        break;
                    //基本零件管理
                    case "jbljgl":
//				url = "scglxt/kcgl/clManage.jsp";
                        url = "scglxt/kcgl/jbljManage.jsp";
                        break;
                    //生产材料
                    case "scclgl":
                        url = "scglxt/kcgl/clManage.jsp";
                        break;
                    //库存管理
                    case "kcgl":
                        url = "scglxt/kcgl/kcglManager.jsp";
                        break;
                    case "ddcggl":
                        url = "scglxt/cggl/cgglManager.jsp";
                        break;
                    //产品管理
                    case "cpgl":
                        url = "scglxt/kcgl/cpManage.jsp";
                        break;
                    //产品质量管理
                    case "cpzlgl":
                        url = "scglxt/zlgl/zlManager.jsp";
                        break;
                    default:
                        break;
                }
                $('#mainIframe').attr('src', url);
            },
            /**
             * 初始化表格函数
             */
            tableInit = function () {
            },
            /**
             * 删除信息
             */
            deleteRow = function (id) {
            },
            /**
             * 更新合同信息
             */
            saveHtInfo = function (flag) {

            },
            initHtInfo = function (flag) {

            },
            /**
             *
             * @param curPageNum跳转之前所在的页面页数
             * @id 编辑的页面数据id （当为update时候有效）
             * @editmodel 编辑模式，判定是add还是update
             */
            swapIframUrl = function (url, curPageNum, id, editModel) {
                var $outFrame = $(window.parent.document.body);
                var $iframe = $outFrame.find("#mainIframe");
                var src = $iframe.attr("src");
                $iframe.attr('src', url)
            }
            ;
        return {
            init: init,
            changeNavUrl: changeNavUrl,
            swapIframUrl: swapIframUrl
        }
    })();


})();

$(document).ready(function () {
    Main.init();
});
 
	
