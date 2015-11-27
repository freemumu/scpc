<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<!DOCTYPE html>
<html>
<head><title>加工人员</title>
    <script type="text/javascript" src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>

	<script type="text/javascript">
	
	function tableInit(){
		
		var table = $('#pcglJgryJg').DataTable( {
		"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
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
        "aLengthMenu":[15,30],
		"ajax":"pcgl_getBomGygcJg.action",
		scrollY:        "300px",
		scrollX:        false,
		scrollCollapse: false,
		paging:         true,
		"columnDefs": [ 
            {
                "render": function ( data, type, row ) {
                    return '<div class="text-center"><a href="">开始</a>&nbsp&nbsp;<a href="">结束</a></div>';
                },
                "targets": 1
            },
            { "visible": true,  "targets": [ 2 ] }
        ],
        "columns": [
             {"data": null,"sWidth": "60px"}, 
             {"data": 'id',"sWidth": "200px"}, 
             {"data": "zddmc", "sWidth": "120px"}, 
             {"data": "bmcl","sWidth": "600px"},
             {"data": "jhkssj"},
             {"data": "jhjssj","sWidth": "120px"}, 
             {"data": "gs", "sWidth": "120px"},
             {"data": "gymc", "sWidth": "120px"},
             {"data": "kjgjs", "sWidth": "120px"},
             {"data": "yjgjs", "sWidth": "120px"},
             {"data": "bfjs", "sWidth": "120px"},
             {"data": "djgjs", "sWidth": "120px"},
             {"data": "sjjs", "sWidth": "120px"}
        ]
       
	} );
	
	  /**加上序号**/
	  table.on( 'order.dt search.dt', function () {
        table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
   	  } ).draw();
	}
	$(document).ready(function() {
	
		tableInit()
	} );
	
	</script>
</head>
<body>
<div class='container container-wrapper'>
    <div class='row' id='content-wrapper'>
        <div class='row rowTop'>
            <div class='box bordered-box ' style='margin-bottom: 0;'>
                <div class='box-header'>
                    <div class='title'>加工</div>
                    <div class='actions'><a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                    </a> <a class="btn box-collapse btn-xs btn-link" href="#"><i></i> </a></div>
                </div>
                <div class='box-content box-no-padding'>
                    <div class='responsive-table'>
                        <div class='scrollable-area'>
                            <table id="pcglJgryJg" class='table table-striped table-bordered tableGrid cell-border'
                                   style='margin-bottom: 0;'>
                                <thead>
                                <tr>
                                    <th> 序号</th>
                                    <th> 操作</th>
                                    <th> 子订单名称</th>
                                    <th> 表面处理</th>
                                    <th> 计划开始时间</th>
                                    <th> 计划完成时间</th>
                                    <th> 额定工时</th>
                                    <th> 工艺名称</th>
                                    <th> 加工件数</th>
                                    <th> 已检件数</th>
                                    <th> 报废件数</th>
                                    <th> 待加工件数</th>
                                    <th> 送检件数</th>
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
<div id="dlg" class="easyui-dialog" title="检验" style="width:400px;height:200px;padding:10px"
			data-options="toolbar: '#dlg-toolbar',buttons: '#dlg-buttons',closed:true">
		
	</div>
	<div id="dlg-toolbar" style="padding:2px">
		
		<span style="margin-left:40px;margin-top:40px;">完成件数：</span><input id="bfjs" width="120px;"></input>
		<span style="margin-left:40px;margin-top:40px;">所用设备：</span><input id="bfjs" width="120px;"></input>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveJggl()">送检</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
</div>
</body>
</html>
