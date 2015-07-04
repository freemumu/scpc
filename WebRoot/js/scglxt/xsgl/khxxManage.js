/**khxxManager
 * @author apple
 */
$(document).ready(function(){
	tableInit();
	init();
});
 /**
  * 初始化函数
  */
function init(){
	loadKhlxList();
	$("#form_add").on('click',function(){
		skipToFormPage('scglxt/xsgl/editKhInfo.jsp');//跳转iframe页面
	})
}
function loadKhlxList(){
	 var url = "khInfo_loadKhlxList.action",successFun = function(json){
		 console.log(json);
	 } ;
 	 $.asyncAjax(url, {"id": "id"}, successFun, true);	
}

function deleteRow(id){
	var flag = confirm("是否删除？");
	if(flag){
		$.ajax({
			  type: "post",
			  url: "khInfo_deleteKhInfo.action",
			  dataType: "text",
			  data:{
			  	"id":id,
			  },
			  success:function(str){
			  	window.location.reload(); 
			  	$("#sorting-advanced").dataTable().fnPageChange( 'previous', true );
			  }
			}); 
	}
}
//跳转页面
function editRow(id){
	skipToFormPage('scglxt/xsgl/editKhInfo.jsp?id='+id);//跳转iframe页面s
}

function tableInit(){

	var table = $('#ryxx').DataTable( {
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
    "aLengthMenu":[20,40,60],
	//"ajax":"xsgl_getRyInfo.action",
	"ajax":"khxxgl_getKhxxData.action",
        scrollY:        "200px",
        scrollX:        true,

	scrollCollapse: false,
	paging:         true,
	
	"columnDefs": [ 
        {
            "render": function ( data, type, row ) {
                return '<div class="text-center">'+
                '<a class="btn btn-info btn-xs"  title="编辑"  href="#"><i class="icon-edit"onclick = "editRow(\''+data+'\')"></i></a>'+
                '&nbsp; <a class="btn btn-danger btn-xs" title="删除" href="#"><i class="icon-remove" onclick = "deleteRow(\''+data+'\')"></i></a></div>';
            },
            "targets": 1
        },
        {
            "render": function ( data, type, row ) {
                return '<div class="text-center">'+
                ' <a class="btn btn-info btn-xs" title="删除" href="#">查看合同</a></div>';
            },
            "targets": 2
        },
        { "visible": true,  "targets": [ 2 ] }
    ],
    "columns": [
    	{"data":null,
    	},
    	{"data":'id',
    	},
    	{ "data": "id" }
    	,
        { "data": "mc" },
        { "data": "lx" },
        { "data": "dw" },
        { "data": "dz" },
        { "data": "gx" },
        { "data": "iscj" },
        { "data": "remark" }
    	 
    ]
   
} );

  /**加上序号**/
  table.on( 'order.dt search.dt', function () {
    table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
	  } ).draw();
  new $.fn.dataTable.FixedColumns( table );
}
/**
 * 
 * @param curPageNum跳转之前所在的页面页数
 * @id 编辑的页面数据id （当为update时候有效）
 * @editmodel 编辑模式，判定是add还是update
 */
function skipToFormPage(url,curPageNum,id,editModel){
	var $outFrame =  $(window.parent.document.body)  ; 
	var $iframe = $outFrame.find("#mainIframe");
	var src = $iframe.attr("src");
	$iframe.attr('src',url)
}
 