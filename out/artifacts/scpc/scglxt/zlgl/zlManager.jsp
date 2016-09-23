<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/topFile.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<title>产品质量管理</title>
		<script type="text/javascript"
			src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
	<script type="text/javascript" src="../../js/scglxt/zlgl/zlManage.js"></script>
	</head>
	<body>
			<div class='container container-wrapper'>
				<div class='row' id='content-wrapper'>
						<div class='row rowTop'>
								<div class='box bordered-box'
									style='margin-bottom: 0;'>
									<div class='box-header'>
<!-- 											<button id="form_add" class="btn btn-success btn-sm"> -->
<!--                         						<i class="icon-add"></i> -->
<!--                         						增加 -->
<!--                       						</button> -->
										<div class='title'>
											产品质量管理
										</div>
										<div class='actions'>
											<a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
											</a>
										</div>
									</div>
									<div class='box-content box-no-padding'>
												<table id="htInfo" class='display tableGrid' style='margin-bottom: 0;'>
													<thead>
														<tr>
															<th >

															</th>
															<th style="width:80px;">
																操作
															</th>
															<th style="width:80px;">
																ID
															</th>
															<th style="width:100px;">
																所属订单
															</th>
															<th style="width:100px;">
																所属子订单
															</th>
															<th style="width:100px;">
																工作人员
															</th>
															<th style="width:100px;">
																检验时间
															</th>
															<th style="width:100px;">
																检验件数
															</th>
															<th  style="width:100px;">
																不合格件数
															</th>
															<th  style="width:100px;">
																不合格原因
															</th>
															<th  style="width:100px;">
																报废件数
															</th>
															<th  style="width:100px;">
																报废原因
															</th>
															<th  style="width:100px;">
																合格产品件数
															</th>
															<th  style="width:100px;">
																让步接收件数
															</th>
															<th  style="width:100px;">
																让步人
															</th>
															 
														</tr>
													</thead>

												</table>
									</div>
								</div>
						</div>
				</div>
			</div>
	</body>
</html>
