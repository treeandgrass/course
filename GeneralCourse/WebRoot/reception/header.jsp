<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首部导航栏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="精品、课程、理工大学">
	<meta http-equiv="description" content="精品、课程、理工大学">
	
	<link type="text/css" rel="stylesheet" href="css/header.css"/>
  </head>
  
  <body>
	<div class="header" >
		<div class="theme">
			<div class="themep">
			
				<div class="logo">
					<h1>CQB大学</h1>
					<div class="checkbox">
						<a style="text-decoration:none;" href="admin/Index">后台管理</a>
					</div>
				</div>
				
				<div class="title">
					<h1>数据结构精品课程</h1>
				</div>
				
				<div class="search">
					<span>全站搜索</span>
					<input type="text"/>
					<input type="button" value="搜索"/>
				</div>
				
				<div class="column">
					<ul>
						<li ng-repeat=" column in datas.columnData"><a href='location?url={{column.url}}&columnId={{column.columnId}}'>{{column.columnName}}</a></li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>  	
  </body>
  
</html>
