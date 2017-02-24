<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程动态</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="动态">
	<!-- 引入css -->
	<link rel="stylesheet" type="text/css" href="css/ng-table.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
  </head>
  
  <body ng-app="indexApp" ng-controller="courseDynamic">
	 
	  <div>
	  	<table ng-table="datas.tableParams" class="table">
  			<thead>
  				<tr>标题</tr>
  				<tr>用户</tr>
  				<tr>发布时间</tr>
  				<tr>详细</tr>
  			</thead>
  			<tbody>
  				<tr ng-repeat="column in $data">
  					<td>{{column.title}}</td>
  					<td>{{column.userName}}</td>
  					<td>{{column.publishTime}}</td>
  					<td><a style="color:blue;" href="reception/local/articleDetail.jsp?articleId={{column.articleId}}" target="_bank">详情</a></td>
  				</tr>
  			</tbody>
  		</table>
	  </div>
  </body>
  	<script type="text/javascript" src="js/angular.js"></script>
 	<script type="text/javascript" src="js/ng-table.js"></script>
 	<script type="text/javascript" src="js/common.js"></script>
 	<script type="text/javascript" src="js/courseDynamic.js"></script>
</html>
