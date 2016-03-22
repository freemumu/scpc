<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/include/topFile.jsp" %>
<!DOCTYPE html>
<html>
<head><title>加工人员加工</title>
    <script type="text/javascript" src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
    <link rel="stylesheet" href="../../js/plugin/bootstrap/css/bootstrap.css" type="text/css"></link>
    <!-- bootstrap css 引入 -->
	<link href="../../js/plugin/bootstrap/css/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
	<!-- bootstrap Datatables样式引入 -->
	<link rel="stylesheet" href="../../js/datatablesExtends/dataTables.bootstrap.css" type="text/css"></link>
	<!-- jquery ui css 引入 -->
	
	<link rel="stylesheet" href="../../js/plugin/jquery-easyui-1.4.3/themes/bootstrap/easyui.css" type="text/css"></link>
	<!-- jquery-ui的JS -->
	<script type="text/javascript" src="../../js/plugin/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../js/plugin/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	
	var gygcid = "";
	
	function jgryksjgWindowOpen(data){
		
		$('#ksjg').dialog('open');
		
		gygcid = data;
		
		initBzRy();

		disableButtonByJgr(data);
	}
	function initSbzd(){
		
		$.ajax({
            type: "post",
            url: "pcgl_getJgSbInfo.action",
            dataType: "json",
            success: function (dt) {

                for (var i = 0; i < dt.length; i++) {
                    var html = "<option value=" + dt[i].id + ">" + dt[i].sbmc + "</option>";
                    $("#jgsb").append(html);
                }

            }
        });
	}
	
	
	function initBzRy(){
		
		$.ajax({
            type: "post",
            url: "pcgl_getRyByBz.action",
            dataType: "json",
            data:{
            	
            	ssbz:'01'
            },
            async:false,
            success: function (dt) {

            	$("#ksjg").html('');
                for (var i = 0; i < dt.length; i++) {
                    var html = "<a href='#' onclick='ryKsJg(event)' class='btn' id=ks"+dt[i].id+">"+dt[i].mc+"</a>";
                    $("#ksjg").append(html);
                }
                
                

            }
        });
	}
	
	function disableButtonByJgr(data){
		
		
		$.ajax({
            type: "post",
            url: "pcgl_getYksGyJgry.action",
            dataType: "json",
            data:{
            	
            	gygcid:data
            },
            success: function (dt) {

            	if(dt!=null){
            		
            		for (var i = 0; i < dt.length; i++) {
               		 
                	 	$("#ks"+dt[i].id).removeClass("btn");
                	 	$("#ks"+dt[i].id).addClass("btn disabled");
                     }	
            	}
            }
        });
	}
	
	function ryKsJg(event){
		
		var ksjgry = $(event.target).attr("id")
		ksjgry=ksjgry.substr(2,ksjgry.length);
		
		jgryJgks(ksjgry,gygcid);
	}
	
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
		scrollY:        "380px",
		scrollX:        true,
		scrollCollapse: false,
		paging:         true,
		"columnDefs": [ 
            {
                "render": function ( data, type, row ) {
                    return '<div class="text-center"><a href="#" onclick="jgryksjgWindowOpen('+"\'"+data+"\'"+')">开始</a>&nbsp&nbsp;<a href="#" onclick="jgryJgJs('+"\'"+data+"\'"+')">结束</a></div>';
                },
                "targets": 1
            },
            { "visible": true,  "targets": [ 2 ] }
        ],
        "columns": [
             {"data": null,"sWidth": "40px"}, 
             {"data": 'id',"sWidth": "80px"}, 
             {"data": "zddmc", "sWidth": "120px"}, 
             {"data": "bmcl","sWidth": "80px"},
             {"data": "jhkssj","sWidth": "120px"},
             {"data": "jhjssj","sWidth": "120px"}, 
             {"data": "gs", "sWidth": "120px"},
             {"data": "gymc", "sWidth": "100px"},
             {"data": "kjgjs", "sWidth": "100px"},
             {"data": "yjgjs", "sWidth": "100px"},
             {"data": "bfjs", "sWidth": "100px"},
             {"data": "djgjs", "sWidth": "100px"},
             {"data": "sjjs", "sWidth": "100px"}
        ]
       
	} );
	
	  /**加上序号**/
	  table.on( 'order.dt search.dt', function () {
        table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
   	  } ).draw();
	  new $.fn.dataTable.FixedColumns( table, {leftColumns:4});
	}
	
	
	function jgryJgJs(data){
		
		
		yksjgryjs(data);	
		$('#dlg').dialog('open');
		gygcid = data;
		$('#jgsb').val('')
		
	}
	
	function yksjgryjs(data){
		
		
		$.ajax({
            type: "post",
            url: "pcgl_getYksGyJgry.action",
            dataType: "json",
            data:{
            	
            	gygcid:data
            },
            success: function (dt) {

            	 $("#dlg-buttons").html('');
            	 $('#jgsb').val('')
            	 for (var i = 0; i < dt.length; i++) {
            		 
            		  var html = "<a href='#' onclick='saveSj(event)' class='btn' id=js"+dt[i].id+">"+dt[i].mc+"</a>";
                      $("#dlg-buttons").append(html);
                 }
            	
            }
        });
	}
	
	function saveSj(event){
		
		var jsjgry = $(event.target).attr("id");
		
		jsjgry = jsjgry.substr(2,jsjgry.length);
		var jgsb = $('#jgsb').val();
		
		
		var jgjs = $('#jgjs').val();
		
		if(jgjs==""){
			
			alert('请输入本次加工件数！');
			return;
		}
		$.ajax({
            type: "post",
            url: "pcgl_jgryJs.action",
            dataType: "text",
            data: {
                "gygcid": gygcid,
                "wcjs":jgjs,
                "sbid":jgsb,
                "jsjgry":jsjgry
                
            },
            success: function (dt) {
	              	
            	$('#dlg').dialog('close');
            	$('#pcglJgryJg').DataTable().ajax.reload(function(){},true);
            }
        });
	}
	
	
	
	function jgryJgks(jgry,gygcid){
		
		
		$.ajax({
            type: "post",
            url: "pcgl_jgryKs.action",
            dataType: "text",
            data: {
                "gygcid": gygcid,
                "jgryid":jgry
                
            },
            success: function (dt) {

				if(dt=='success'){
				
					alert('加工开始成功,已开始计时');
					disableButtonByJgr(gygcid);
					
				}else{
				
					alert("对不起发生错误，请联系管理员！");
				}
	              	
            }
        });
	}
	$(document).ready(function() {
	
		tableInit();
		initSbzd();
		initBzRy();
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
                            <table id="pcglJgryJg" class='table table-striped table-bordered' style='margin-bottom: 0;'>
                                <thead>
                                <tr>
                                    <th></th>
                                    <th> 操作</th>
                                    <th> 子订单</th>
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
<div id="dlg" class="easyui-dialog" title="加工完成" style="width:400px;height:200px;padding:15px"
			data-options="closed:true">
		
		<span style="margin-left:40px;margin-top:40px;">完成件数：</span><input id="jgjs"  style="width:175px; height:28px"></input>
		<p style="margin-top:15px;">
		<span style="margin-left:40px;margin-top:40px;">所用设备：</span><select style="height:28px;width:175px;" id='jgsb'></select>

	<div id="dlg-buttons">
		
	</div>
</div>

	<div id="ksjg" class="easyui-dialog" title="开始加工" style="width:400px;height:200px;padding:10px"	data-options="closed:true">
	
	
	</div>
</body>
</html>
