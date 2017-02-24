<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="introduce">
	<link rel="stylesheet" type="text/css" href="css/introduce.css">
  </head>
  
  <body>
  	 <div class="introduce">
  	 <div class="introducecolumn">
  	 	<img src="image/0001.png" alt="图片">
  	 	<span>{{datas.introduceData[0].columnName}}</span>
  	 	<span></span>
  	 	<span>{{datas.introduceData[0].columnName}}</span>
  	 	<span>{{datas.title[0].columnName}}></span>
  	 	<span>您当前位置：</span>
  	 </div>
  	 <div class="line">
  	 </div>
  	 </div>
  </body>
</html>
