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
			var urlParam = new Object();
			urlParam = $.GetRequest();
			tableInit(urlParam);
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
		tableInit = function(urlParam){
			var khid ="";
			if(urlParam &&urlParam.khid){
				khid = urlParam.khid ;
			}
			var table = $('#htInfo').DataTable( {
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
			"ajax":"htInfo_getTableData.action?khid="+khid,
			 "sScrollY" : 450, //DataTables的高  
            "sScrollX" : 600, //DataTables的宽 
//            "bAutoWidth" : false, //是否自适应宽度 
			scrollY:        true,
			scrollX:        true,
			scrollCollapse: true,
			paging:         true,
//			"columnDefs": [
//				{ width: '20%', targets: 0 },
//				 
//			]
//			,
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
		        {
		            "render": function ( data, type, row ) {
		                return '<div class="text-center">'+
		                ' <a class="" href="#" title＝"查看" onclick = "HtManage.showModel(\''+data+'\')">查看</a> '+
		                ' </div>';
		            },
		            "targets": 2
		        },

		        {
	                "targets": [ 3 ],
	                "visible": false
	            },
		        { "visible": true,  "targets": [ 2 ] },

				{
					"render": function ( data, type, row ) {
						if(data !=null  && data !="" ){
							return data + "%" ;
						}else{
							return data ;
						}
					},
					"targets": 11
				},

		    ],
		    "columns": [
		    	{"data":null},
		    	{"data":'id'},
		    	{"data":'id'},
		    	{ "data": "id" },
		        { "data": "mc" },
		        { "data": "htbh" },
		        { "data": "ywlx" },
		        { "data": "htje" },
		        { "data": "qssj" },
		        { "data": "jssj" },
		        { "data": "dqjd" },
		        { "data": "fkzt" },
		        { "data": "jkbfb" },
		        { "data": "jkje" },
		        { "data": "jscb" },
		        { "data": "hkzh" },
		        { "data": "hkkhh" },
		        { "data": "htmx" }
		    ]
		   
		} );

		  /**加上序号**/
		  table.on( 'order.dt search.dt', function () {
		    table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		        cell.innerHTML = i+1;
		    } );
			  } ).draw();
//		  new $.fn.dataTable.FixedColumns( table );
			new $.fn.dataTable.FixedColumns( table, {leftColumns:3});


		},
		/**
		 * 删除信息
		 */
		deleteRow = function(id){
			 var url = "htInfo_deleteRow.action",successFun = function(resStr){
                 if (resStr == "SUCCESS") {
	     			  	window.location.reload(); 
	    			  	$("#sorting-advanced").dataTable().fnPageChange( 'previous', true );
						alert("删除成功！");
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
			
		},
		/**
		 * 显示modal框
		 */
		showModel = function(data){
			$('#myModal').modal({
				backdrop:false,
				show:true
			});
			//在modalbody 中家在iframe 内容为 工序编排的内容
			$content = "<iframe src='../jsgl/ddManager.jsp?bomid="+data+"' class='modal_iframe'></iframe>" ; 
			$container = $('#modal-body');
			$container.empty().append($content);
		}
		;
		 return{
			 init:init ,
			 deleteRow:deleteRow,
			 editRow:editRow,
			 showModel:showModel
		 }
	})();
	
	
})();



$(document).ready(function(){
	HtManage.init();
});
 
 
	
 
 