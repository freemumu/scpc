 
 
/**
 * @author apple
 * @constructor 
 * @date 20141024
 */
(function(){
	var operateFlag = ""; 
	window.HtManage = (function(){
		var _t = this ,
		_operateFlag = "",
		/**
		 * 初始化函数
		 */
		
		init = function(){
			tableInit();
			registerEvent();
		},
		/**
		 * 注册事件
		 */
		registerEvent = function(){
			$("#form_add").on('click',function(){
				Main.swapIframUrl('scglxt/xsgl/editHtInfo.jsp');//跳转iframe页面
			})			
		},
		/**
		 * 初始化表格函数
		 */
		tableInit = function(){
			var table = $('#bomInfo').DataTable( {
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
		    "aLengthMenu":[20,30],
		    "ajax":"jblj_getTableData.action",
			 "sScrollY" : 450, //DataTables的高  
            "sScrollX" : 600, //DataTables的宽 
//            "bAutoWidth" : false, //是否自适应宽度 
			scrollY:        true,
			scrollX:        true,
			scrollCollapse: true,
			paging:         true,
			columnDefs: [
				{ width: '20%', targets: 0 }
			]
			,
			"columnDefs": [ 
		        {
		            "render": function ( data, type, row ) {
		                return '<div class="text-center">'+
		                ' <a class="btn btn-success btn-xs" href="#" title＝"修改"><i class="icon-edit" onclick = "HtManage.editRow(\''+data+'\')"></i></a> '+
		                '<a class="btn btn-danger btn-xs" href="#" title="删除"><i class="icon-remove" onclick = "HtManage.deleteRow(\''+data+'\')"></i></a>'+
		                ' </div>';
		            },
		            "targets": 1
		        },
		        { "visible": true,  "targets": [ 2 ] }
		    ],
		    "columns": [
		    	    	{"data":null,"sWidth":"60px"},
				    	{"data":'id', "sWidth":"200px"},
				    	{ "data": "id" },
				        { "data": "mc" } ,
				        { "data": "lx" },
				        { "data": "cc" },
				        { "data": "zsl" },
				        { "data": "kcsl" },
				        { "data": "dj" },
				        { "data": "ghs" },
		        
		    ]
		   
		} );

		  /**加上序号**/
		  table.on( 'order.dt search.dt', function () {
		    table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		        cell.innerHTML = i+1;
		    } );
			  } ).draw();
		  new $.fn.dataTable.FixedColumns( table );
			
		},
		/**
		 * 删除信息
		 */
		deleteRow = function(id){
			 var url = "htInfo_deleteRow.action",successFun = function(resStr){
                 if (resStr == "SUCCESS") {
	     			  	window.location.reload(); 
	    			  	$("#sorting-advanced").dataTable().fnPageChange( 'previous', true );
						alert("SUCCESS！");
                 }
         } ;
         if(confirm("是否删除？")){
        	 $.asyncAjaxPost(url, {"id": id}, successFun, true);
         }
		},
		//跳转页面
		editRow = function(id){
			Main.swapIframUrl('scglxt/xsgl/editHtInfo.jsp?id='+id);//跳转iframe页面
		},
		/**
		 * 更新合同信息
		 */
		saveHtInfo = function(flag){
			
		},
		initHtInfo = function(flag){
			
		}
		;
		 
		 return{
			 init:init ,
			 deleteRow:deleteRow,
			 editRow:editRow
		 }
	})();
	
	
})();



$(document).ready(function(){
	HtManage.init();
});
 
 
	
 
 