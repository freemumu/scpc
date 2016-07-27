<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/commonModel/js/zTree/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/commonModel/js/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/commonModel/js/zTree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/commonModel/js/zTree/jquery.ztree.exedit-3.5.js"></script>

<script type="text/javascript">

	$(function() {
	showZTree('ZDID','ZDID_sn','4041','0');
	});
	function showZTree(key,value,columnid,ischecked){
	var setting = {
			check: {
				enable: true,
				
			},
			data: {
				key: {
					name: "NAME"
				},
				simpleData: {
					enable: true,
					idKey: "ID",
					pIdKey: "PID",
				}
			}
		};
	 $.ajax({
				type:'POST',
				url:'maintable_getZTreeData.action?columnid='+columnid,
				dataType:'json',
				success:function(data){
					$.fn.zTree.init($("#treeDemo"), setting, data);
				},
				error:function(error){
					alert(error);
				}
			});
	 
	
	 }
</script>


  </head>
  
  <body>
      <div id='tt' align="left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
  </body>
</html>
