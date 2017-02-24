<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程简介内容</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="introduce、简介">
	<!-- 引入css -->
	<link rel="stylesheet" type="text/css" href="css/content.css" />
	
  </head>
  
  <body ng-app="indexApp" ng-controller="contentController">
  	<div class="content">
  		{{datas.content[0]}}
  	</div>
  </body>
  	<script type="text/javascript" src="js/angular.js"></script>
  	<script type="text/javascript" src="js/ng-table.js"></script>
 	<script type="text/javascript" src="js/common.js"></script>
 	<script type="text/javascript" src="js/coursecontent.js"></script>
</html>
