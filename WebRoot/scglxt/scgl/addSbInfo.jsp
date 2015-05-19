<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
<head>
	<script type="text/javascript" src="../../js/util/commonFun.js"></script>
	<script>
	 		var flag =  getValueOfURLParamter("flag");
	 		$(document).ready(function() {
				initSbZd();
				if(flag==='edit'){
					var id = getValueOfURLParamter("id");
					initForm(id);
				}
			} );
			
			function initForm(id){
				
				$.ajax({
				  type: "post",
				  url: "scglsb_getSbInfoById.action",
				  dataType: "json",
				  data:{
				  	"id":id,
				  },
				  success:function(dt){
				  	
				  	$('#sbmc').val((dt[0].sbmc));
				  	$('#sblx').val((dt[0].sblx));
				  	$('#cgsj').val((dt[0].cgsj));
				  	$('#wbjz').val((dt[0].bxjssj));
				  	$('#cfdd').val((dt[0].sbszd));
				  	$('#sbzt').val((dt[0].sbzt));
				  	$('#wxjl').val((dt[0].wxjl));
				  	$('#bz').val((dt[0].bz));
				  	
				  }
				}); 
			}
			
			function saveSbInfo(flag){
			
				if(flag==='edit'){
					
					var id = getValueOfURLParamter("id");
					$('#formAction').attr('action','scgl/scglsb_updateSbInfo.action?id='+id)
				}
				
				$("#formAction").submit();
				/*if(flag==='add'){
					//添加
					$.ajax({
					  type: "post",
					  url: "scgl_addSbInfo.action",
					  dataType: "json",
					  data:{
					  	"sbmc" : $('#sbmc').val(),
						"sblx" : $('#sblx').val(),
						"sbzt" : $('#sbzt').val(),
						"cgsj" : $('#cgsj').val(),
						"wxjz" : $('#wbjz').val(),
						"cfdd" : $('#cfdd').val(),
						"bz" : $('#bz').val(),
						"wxjl" : $('#wxjl').val()
					  }
					  
					}); 
				}else{//修正
				
					var id = getValueOfURLParamter("id");
					$.ajax({
					  type: "post",
					  url: "scgl_updateSbInfo.action",
					  dataType: "json",
					  data:{
					  	"sbid" : id,
					  	"sbmc" : $('#sbmc').val(),
						"sblx" : $('#sblx').val(),
						"sbzt" : $('#sbzt').val(),
						"cgsj" : $('#cgsj').val(),
						"wxjz" : $('#wbjz').val(),
						"cfdd" : $('#cfdd').val(),
						"bz" : $('#bz').val(),
						"wxjl" : $('#wxjl').val()
					  }
					  
					}); 
				}
				
				*/
			}
			
			function initSbZd(){
			
				$.ajax({
				  type: "post",
				  url: "scglsb_getSbZdInfo.action",
				  dataType: "json",
				  data:{
				  	"xh":'0101',
				  },
				  success:function(dt){
				  	
				  	for(var i = 0;i<dt.length;i++){
				  		var html = "<option value="+dt[i].id+">"+dt[i].mc+"</option>";
				  		$("#sblx").append(html);
				  	}
				  	
				  }
				}); 
				$.ajax({
				  type: "post",
				  url: "scglsb_getSbZdInfo.action",
				  dataType: "json",
				  data:{
				  	"xh":'0102',
				  },
				  success:function(dt){
				  	
				  	for(var i = 0;i<dt.length;i++){
				  		var html = "<option value="+dt[i].id+">"+dt[i].mc+"</option>";
				  		$("#sbzt").append(html);
				  	}
				  	
				  }
				}); 
			}
	 	</script>
</head>

<div id='wrapper'>
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header blue-background">
					<div class="title">
						<div class="icon-edit"></div>
						设备
					</div>
					
					<div class="actions">
						<a class="btn box-remove btn-xs btn-link" href="#"><i
							class="icon-remove"></i> </a>

						<a class="btn box-collapse btn-xs btn-link" href="#"><i></i> </a>
					</div>
					
				</div>
				<div class="box-content box-no-padding">
					<form class="form form-horizontal form-striped"
						style="margin-bottom: 0;" method="post" id="formAction" action="scpc/scglsb_addSbInfo.action"
						accept-charset="UTF-8">
						<input name="authenticity_token" type="hidden">
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputText2">
								设备名称
							</label>
							<div class="col-md-9">
								<input class="form-control" name="sbmc" id="sbmc" placeholder="请输入设备名称"
									type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputPassword1">
								设备类型
							</label>
							<div class="col-md-9">
								<select class='form-control' name="sblx" id='sblx'>
									
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputTextArea2">
								设备状态
							</label>
							<div class="col-md-9">
								<select class='form-control' name="sbzt" id='sbzt'>
									
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="disabledInput2">
								采购时间
							</label>
							<div class="col-md-9">
								<div class="datepicker input-group">
									<input name="cgsj" id="cgsj" class="form-control" data-format="yyyy-MM-dd"
										placeholder="请选择采购时间" type="text">
									<span class="input-group-addon"> <span
										data-date-icon="icon-calendar" data-time-icon="icon-time"
										class="icon-calendar"></span> </span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="disabledInput2">
								维保截止
							</label>
							<div class="col-md-9">
								<div class="datepicker input-group" id="">
									<input class="form-control" name="wbjz" id="wbjz" data-format="yyyy-MM-dd"
										placeholder="请选择维保截止时间" type="text">
									<span class="input-group-addon"> <span
										data-date-icon="icon-calendar" data-time-icon="icon-time"
										class="icon-calendar"></span> </span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputTextArea2">
								存放地点
							</label>
							<div class="col-md-9">
								<input class="form-control" name="cfdd" id="cfdd" placeholder="请输入存放地"
									type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputTextArea2">
								维修记录
							</label>
							<div class="col-md-9">
								<textarea class="form-control" name="wxjl" id="wxjl" placeholder="请输入维修记录"
									rows="3"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputTextArea2">
								备注
							</label>
							<div class="col-md-9">
								<textarea class="form-control" name="bz" id="bz" placeholder="请输入备注信息"
									rows="3"></textarea>
							</div>
						</div>
						<div class="form-actions" style="margin-bottom: 0;">
							<div class="row">
								<div class="col-md-9 col-md-offset-3">
									<div class="btn btn-primary btn-lg" onclick = "saveSbInfo()">
										<i class="icon-save" ></i> 保存
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>