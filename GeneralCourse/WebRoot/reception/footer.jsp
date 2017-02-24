<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="css/footer.css"/>
  </head>
  
  <body>
  	<div>
  		<div id="footer" class="footer">
  			<div class="line"></div>
  			<div class="set"></div>
  			<div class="bottom">
  				<div class="declare"><p>CQB计算机与工程学院版权所有</p></div>
  				<div class="address"><p>地址：CQB-BJ-LL-LT</p></div>
  			</div>
  			
  		</div>
  	</div>
  </body>
</html>
