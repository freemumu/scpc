<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<title>客户信息</title>
		<script type="text/javascript"
			src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
	<script type="text/javascript" src="../../js/scglxt/xsgl/khxxManage.js"></script>
	</head>
	<body>
			<div class='container'>
				<div class='row' id='content-wrapper'>
						<div class='row rowTop' >
								<div class='box bordered-box'
									style='margin-bottom: 0;'>
									<div class='box-header'>
										<button id="form_add" class="btn btn-success btn-sm" >
                    						<i class="icon-add"></i>
                    						增加
                  						</button>										
										<div class='title'>
											客户信息
										</div>
										<div class='actions'>
											<a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
											</a>
										</div>
									</div>
									<div class='box-content box-no-padding'>
										<div class='responsive-table'>
											<div class='scrollable-area'>
												<table id="ryxx" class='display tableGrid' style='margin-bottom: 0;'>
													<thead>
														<tr>
															<th  class="serial" style="width:60px;">
																序号
															</th>
															<th class="operate" style="width:100px;">
																操作
															</th>
															<th style="width:100px;">
																合同信息
															</th>
															<th style="width:100px;">
																名称
															</th>
															<th style="width:100px;">
																类型
															</th>
															<th style="width:100px;">
																单位
															</th>
															<th style="width:100px;">
																单位地址
															</th>
															<th>
																客户关系
															</th>
															<th>
																是否成交
															</th>
															<th>
																备注
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
	</body>
</html>
