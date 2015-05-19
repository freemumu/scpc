/**
 * 默认的配置js 用来初始化导入js以及其他初始化方法
 * @author mukun 20140507
 */
(function(){
	this.HtEditManage = (function(){
		var _t = this , 
		_flag  = "",//标志位 区分当前表单是add模式还是update模式
		_id = "" ;
		/**
		 * 初始化表单信息
		 */
		init = function(){
			var _this = this ;
			//判断当前表单是新增还是更新模式
			var urlParam = new Object();
			urlParam = $.GetRequest();	
			//返回按钮
			$("#form_return").click(function(){
				var $outFrame =  $(window.parent.document.body) ; 
				var $iframe = $outFrame.find("#mainIframe");
				var src = $iframe.attr("src");
				$iframe.attr('src',"scglxt/xsgl/htManager.jsp");
			});
			$('#btn_save').live('click',function(){
				saveFormInfo(_this._flag ,urlParam.id );
			});
			registerEvent();
			if(urlParam && urlParam.id){
				_this._flag = "UPDATE" ; 
				//如果是update模式 则加载初始化信息
				_this.initFormInfo(urlParam.id);
			}else{
				_this._flag = "ADD" ;
			}
			$('#form_khxx_qssj').datepicker();
			loadYwlxList();//加载业务类型列表
		},
		/**
		 * 注册事件
		 */
		registerEvent = function(){
			$("#form_return").on('click',function(){
				Main.swapIframUrl('scglxt/xsgl/htManager.jsp');//跳转iframe页面
			})		
		},
		/**
		 * 初始化业务类型列表
		 * @author apple
		 */
		loadYwlxList  = function(){
			 var url = "htInfo_loadYwlxList.action",successFun = function(data){
				 if(data && data.length > 0 ){
					 $("#form_khxx_ywlx").empty();
					 for(var i = 0 ; i < data.length ; i++){
						 $.AddSelectItem(data[i].mc, data[i].id,"form_khxx_ywlx"); 
					 }
				 }
			 } ;
		 	 $.asyncAjax(url, {"id": "id"}, successFun, true);				
		},
		/**
		 * 初始化表单系信息
		 */
		initFormInfo = function(id){
			var url = "htInfo_getDetailInfo.action",successFun = function(data){
				console.log(data);
				if(data && data.length >0 ){
					var select = $('#form_htInfo input[info="fromInfo"]');
					//循环给表单赋值
					for (var i = 0; i < select.length; i++) {
						var s = select[i];
						var id = $(s).attr("id");
						id = id.split("_")[2];
						var key = id.toLowerCase();
						var value = eval("data[0]." + key);
						if(value == undefined){
							value = "";
						}
						for (var j in data[0]) {
							if (id.toLowerCase() == j) {
								$(s).attr("value", value);
								$(s).attr("title", value);
							}
						}
					}
					$('#form_htInfo_ywlx').select2('val',data[0].ywlx);
				}
				
           }
           $.asyncAjax(url,{"id":id}, successFun, true);
		},
		/**
		 * 保存或者更改表单信息
		 */
		saveFormInfo = function(flag,id){
			var formInfo = {
				mc : $('#form_khxx_mc').attr("value"),
				htbh : $('#form_khxx_htbh').attr("value"),
				ywlx : $('#form_khxx_ywlx').attr("value"),
				htje : $('#form_khxx_htje').attr("value"),
				qssj : $('#form_khxx_qssj').attr("value"),
				dqjd : $('#form_khxx_dqjd').attr("value"),
				fkzt : $('#form_khxx_fkzt').attr("value"),
				jkbfb : $('#form_khxx_jkbfb').attr("value"),
				jkje : $('#form_khxx_jkje').attr("value"),
				jscb : $('#form_khxx_jscb').attr("value"),
				hkzh : $('#form_khxx_hkzh').attr("value"),
				hkkhh : $('#form_khxx_hkkhh').attr("value"),
				remark : $('#form_khxx_remark').attr("value"),
				flag : flag , 
				id : id 
			}
			var JSON = $.toJsonString(formInfo);
			var $save = $('#btn_save'), $saving = $('#btn_save');
            var url = "htInfo_updateInfo.action", successFun = function(resStr){
            	console.log(resStr);
                if (resStr == "1") {
                	alert('保存成功');
                }
            }
            $.asyncAjaxPost(url, {"JSON": JSON}, successFun, true);		

		}
		;
		return {
			init:init,
			initFormInfo : initFormInfo,
			saveFormInfo:saveFormInfo
		}
		
	})();
})();


$(document).ready(function(){
//	$("#form_khxx_qssj").datetimepicker({
//		format: 'yyyy-mm-dd hh:ii',
//		language: 'zh-CN',
//		pickerPosition: "bottom-left",
//	});
	HtEditManage.init();
});