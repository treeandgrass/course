<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>副导航栏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="导航">
	<link rel="stylesheet" type="text/css" href="css/leftIndex.css">
  </head>
  
  <body>
  	<div id="leftIndexColumn" class="leftIndexColumn">
  		<div class="leftsearch">
  			<input type="text" id="leftsearch"><span class="span"><span class="spanchild">搜索</span></span>
  		</div>
  		<h1 ng-repeat="column in datas.title">{{column.columnName}}</h1>
  		<ul ng-if="datas.leftIndexData.length>0">
  		 	<li  ng-repeat=" column in datas.leftIndexData"><a ng-click="methods.listenLeftIndex(column.columnId,column.url)">{{column.columnName}}</a></li>
  		</ul>
  	</div>	
  </body>
</html>
