<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="login">
	<link rel="stylesheet" type="text/css" href="admin/css/login.css"/>
  </head>
  
  <body>
  		<div class="outbody" ng-app="loginApp" ng-controller="loginController">
  			<div class="loginbody">
	  			<div class="login">
	  				<div class="title">
						<p>user login</p>
	  					<p>网站后台管理系统</p>	  				
	  				</div>
	  				<form method="post" action="login">
	  					<ul class="ul_font">
	  						<li><p>用户名：</p></li>
	  						<li><p>密码：</p></li>
	  						<li><p>验证码</p></li>
	  					</ul>
	  					<ul class="ul_input">
	  						<li><input type="text" name="username" /></li>
	  						<li><input type="password" name="password" /></li>
	  						<li><input type="text" name="validecode" /></li>
	  					</ul>
	  					<div class="number">
	  						<img id="img" src="imageValide?id=1" ng-click="methods.changeImg()"/>
	  					</div>
	  					<div class="submit">
	  						<input value="登陆"  type="submit"/>
	  					</div>
	  				</form>
	  			</div>
	  		</div>
  		</div>
  </body>
  <script type="text/javascript" src="js/angular.js"></script>
  <script type="text/javascript" src="admin/js/login.js"></script>
</html>
