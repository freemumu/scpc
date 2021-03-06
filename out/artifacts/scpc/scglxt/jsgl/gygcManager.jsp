<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/topFile.jsp"%>
<style type="text/css">
.tableGrid  tr th {
	width: 100px;
}
</style>
<title>工艺编排</title>
<script type="text/javascript"
	src="../../js/plugin/datatables/dataTables.fixedColumns.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/plugin/tablednd/jquery.tablednd.js"></script>
<script type="text/javascript" src="../../js/scglxt/jsgl/gygcManage.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="  col-md-12">
		<button id="btn-add" type="button" class="btn btn-sm btn-primary">增加</button>
		<button id="btn-save" type="btn-save" class="btn btn-sm btn-success">保存</button>
	</div>
</div>

	<div id='container' class="container-fluid ">

			<div class=' ' id='content-wrapper'>
				<div class='row rowTop'>
					<div class='box bordered-box ' style='margin-bottom: 0;'>
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<table id="gygc" class="cell-border  tableGygc table table-striped table-bordered">
										<thead>
											<tr>
												<th class="serial"></th>
												<th class="serial" style=" ">编辑</th>
												<th class="starttime  hide" disabled="disabled" style="width:20px;">开始加工</th>
												<th class="endtime  hide" style="width:20px;">结束加工</th>
												<th>所用设备</th>
												<th>工序内容</th>
												<th>额定工时（分钟）</th>
												<th style="width:20px;" class=" hide">受图</th>
												<th class="starttime hide ">开始时间</th>
												<th class="endtime  hide">结束时间</th>
												<th>注意事项</th>


											</tr>
										</thead>
										<tbody>
										</tbody>
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
