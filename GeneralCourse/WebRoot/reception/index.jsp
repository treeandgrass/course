<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html ng-app="indexApp">
  <head>
    <base href="<%=basePath%>">
    
    <title>通用课程</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="container">
	
	<!-- 引入css -->
	<link rel="stylesheet" type="text/css" href="css/index.css" />
 	
  </head>
  
  <body>
	<div class="body">
	<!--引入头部  -->
  	  <div ng-controller="headerController">
  		 <jsp:include page="header.jsp"/>
      </div>
      
     <!-- 引入主题 -->
	 <div ng-controller="indexSection" style="width:1000px">
	  		<jsp:include page="indexSection.jsp"/>
  	 </div>
  	  
  	  <!-- 引入脚端 -->
  	  <div>
  		 	<jsp:include page="footer.jsp"/>
  	  </div>
  	  
  	</div>
 </body>
 	<script type="text/javascript" src="js/angular.js"></script>
 	<script type="text/javascript" src="js/ng-table.js"></script>
 	<script type="text/javascript" src="js/common.js"></script>
 	<script type="text/javascript" src="js/header.js"></script>
 	<script type="text/javascript" src="js/indexsection.js"></script>
</html>
