<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html ng-app="generalCourse">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这里是标题</title>
<link rel="stylesheet" type="text/css" href="admin/css/permission.css" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/angular.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jstree.js"></script>
<script src="admin/js/permission.js"></script>

</head>
<body ng-controller="permissionController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/Permission">权限管理</a>
			</td>
		</tr>
	</table>
	<hr>
	<div id="allRole">
	</div>
	<div id="allModule">
	</div>
	<div id="message">
		<span ng-if="result.success == 1">修改成功</span>
		<span ng-if="result.errorMessage != null">{{result.errorMessage}}</span>
	</div>
</body>
</html>