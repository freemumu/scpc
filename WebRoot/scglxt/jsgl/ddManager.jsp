<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
<!DOCTYPE html>

<html>
	<head>
	<style type="text/css">
	.tableGrid  tr th{
		width:100px;
	}
</style>
	<title>订单管理</title>
		<script type="text/javascript"
			src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
	<script type="text/javascript" src="../../js/scglxt/jsgl/ddManage.js"></script>
	</head>
	<body>
		<div id='wrapper'>
			<div class='container'>
				<div class='row' id='content-wrapper'>
						<div class='row rowTop'>
								<div class='box bordered-box orange-border'
									style='margin-bottom: 0;'>
									<div class='box-header'>
											<button id="form_add" class="btn btn-success btn-sm">
                        						<i class="icon-add"></i>
                        						增加
                      						</button>									
										<div class='title'>
											订单信息
										</div>
										<div class='actions'>
											<a class="btn box-remove btn-xs btn-link" href="#"><i
												class='icon-remove'></i> </a>

											<a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
											</a>
										</div>
									</div>
									<div class='box-content box-no-padding'>
										<div class='responsive-table'>
											<div class='scrollable-area'>
												<table id="ddInfo" class='table table-striped table-bordered cell-border tableGrid'  style='margin-bottom: 0;'>
													<thead>
														<tr>
															<th style="width:60px;">
																序号
															</th>
															<th style="width:120px;">
																操作
															</th>
															<th style="width:120px;">
																查看BOM表
															</th>
															<th style="width:100px;">
																ID
															</th>
															<th style="width:100px;">
																所属合同
															</th>
															<th style="wdith:100px;">
																项目编号
															</th>
															<th style="wdith:100px;">
																订单级别
															</th>
															<th style="wdith:200px;">
																交货日期
															</th>
															<th style="wdith:200px;">
																计划开始时间
															</th>
															<th style="wdith:150px;">
																计划结束时间
															</th>
															<th style="wdith:150px;">
																实际开始时间
															</th>
															<th style="wdith:150px;">
																实际结束时间
															</th>
															<th style="wdith:150px;">
																所用总工时
															</th>
															<th style="wdith:100px;">
																当前总进度
															</th>
															<th style="wdith:100px;">
																图纸
															</th>
															<th style="wdith:100px;">
																备注
															</th>
															<th style="wdith:100px;">
																项目联系人
															</th>
															<th style="wdith:100px;">
																项目负责人
															</th>
															<th>
																出库状态
															</th>
															<th style="wdith:100px;">
																出库时间
															</th>
															
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
		</div>
		<!-- 模态框（Modal）-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width:850px;height:550px;">
	      <div class="modal-content" style="height:90%;"  >
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true" style="margin-top:-10px">
	                  &times;
	            </button>
	         </div>
	         <div class="modal-body" id="modal-body">
	         </div>
	<!--          <div class="modal-footer"> -->
	<!--             <button type="button" class="btn btn-default"  -->
	<!--                data-dismiss="modal">关闭 -->
	<!--             </button> -->
	<!--             <button type="button" class="btn btn-primary"> -->
	<!--                提交更改 -->
	<!--             </button> -->
	<!--          </div> -->
	      </div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>			
		
	</body>
</html>
