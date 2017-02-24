<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html ng-app="generalCourse">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="admin/css/index.css" />
<script src="js/angular.js"></script>
<script src="admin/js/index.js"></script>
</head>
<body ng-controller="adminIndexController">
	<a name="top"></a>
	<!-- ${loginOperator.userName} 这样的代码叫做EL表达式 -->
	<div>
		<div id="adminHead">
		</div>
		<p id="adminControl"><!-- |<a href="#">修改密码</a>| --><a href="admin/logout">退出</a>&nbsp;&nbsp;</p>
		<div id="welcomeDiv">
			<text id="welcomeText">
				<img src="image/zs1.png">
				欢迎您,{{currentUser.userName}}
				<img src="image/zs2.png">
			</text>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="index"><text id="generalWeb">通用网站</text></a>
			<a href="admin/welcome.jsp" target="innerFrame" ><img src="image/home.png" style="position:absolute;right:50px;" /></a>
			<a href="javascript:void(0)" ng-click="top()"><img src="image/top.png" style="position:absolute;right:20px;" /></a>
		</div>
		<div class="content">
			<div class="left" ng-show="leftShow">
				<div id="currentTime">
					<img src="image/clock.png" />
					{{currentTime.year }}年{{currentTime.month }}月{{currentTime.date }}日&nbsp;{{currentTime.hour }}:{{currentTime.minute }}:{{currentTime.second }}
				<hr />
				</div>
				<div ng-repeat="ModuleGroup in modules">
					<div class="oneLevelModule" ng-click="open($index)">
						<p style="position:absolute;font-weight:bold;top:3px;left:5px;">
							{{ModuleGroup.oneLevel.moduleName}}
						</p>
						<img ng-show="moduleShow == $index" class="moduleOpenImg" src="image/downArrow.png" />
						<img ng-show="moduleShow != $index" class="moduleOpenImg" src="image/rightArrow.png" />
					</div>
					<div style="background-color:white;" ng-show="moduleShow == $index">
						<div class="twoLevelsPanel" ng-repeat="twoLevel in ModuleGroup.twoLevels">
							<a href="{{twoLevel.url}}" target="innerFrame">
								<p>
									<img src="image/arrow1.png" />
									{{twoLevel.moduleName}}
								</p>
								<img src="image/line1.png" style="margin-top:-20px;" />
							</a>
						</div>
					</div>
				</div>
				
			</div>
			<img src=image/leftControlLeft.png id="leftHidden" ng-show="leftShow" ng-click="leftControl()" />
			<img src=image/leftControlRight.png id="leftShow" ng-hide="leftShow" ng-click="leftControl()" />
			<div id="right">
				<iframe id="iframe" src="admin/welcome.jsp" class="innerFrame" name="innerFrame"
					frameborder="0" scrolling="auto"
					style="margin: 0px auto; height: 100%; -ms-overflow-x: hidden;"></iframe>
			</div>
		</div>
		<div id="bottom">
			<div style="height:5px;background-color:#0da2c1;" />
			<div style="position:absolute;right:100px;color:white;top:5px;font-size:15px;">
				<img src="image/sign1.png" />
				版本信息
			</div>
		</div>
	</div>


</body>
</html>