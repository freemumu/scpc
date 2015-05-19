<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<title>材料管理</title>
		<script type="text/javascript"
			src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
	<script type="text/javascript" src="../../js/scglxt/kcgl/clManage.js"></script>
	</head>
	<body>
		<div id='wrapper'>
			<div class='container'>
				<div class='row' id='content-wrapper'>
						<div class='row rowTop'>
								<div class='box bordered-box '
									style='margin-bottom: 0;'>
									<div class='box-header'>
										<button id="form_add" class="btn btn-success btn-sm">
											<i class="icon-add"></i> 增加
										</button>
									<div class='title'>
											材料管理
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
												<table id="clInfo" class='display tableGrid cell-border' style='margin-bottom: 0;'>
													<thead>
														<tr>
															<th>
																序号
															</th>
															<th>
																操作
															</th>
															<th>
																ID
															</th>
															<th>
																材料名称
															</th>
															<th>
																材料材质
															</th>
															<th>
																材料数量
															</th>
															<th>
																材料单价
															</th>
															<th>
																材料类型
															</th>
															<th>
																供货商
															</th>
															<th>
																密度
															</th>
															
															<th>
																材料形状
															</th>
															<th>
																宽度
															</th>
															<th>
																高度
															</th>
															<th>
																长度
															</th>
															<th>
																材料来源
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
		
		<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="width:750px;height:500px;">
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
		
		
	</body>
</html>
