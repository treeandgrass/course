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
<style type="text/css">
.formTable td{
	height: 30px;
	vertical-align: middle;
}

</style>
<script src="js/angular.js"></script>
<script src="admin/js/moduleAdd.js"></script>
</head>
<body ng-controller="moduleAddController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/moduleList">模块管理</a> > <a href="admin/moduleAdd">新增模块</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<table width="100%" class="formTable">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>模块名</td>
					<td width="150">
						<input type="text" ng-model="module.moduleName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right"><font color="red">*</font>链接地址</td>
					<td width="150">
						<input type="text" ng-model="module.url"/>
					</td>
					<td>
						<span ng-if="urlMessage != ''">
							<font color="red">{{result.urlMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="150" align="right">上级模块</td>
					<td>
						<select ng-model="module.upid" ng-options="module.moduleId as module.moduleName for module in oneLevelModules" style="width:150px;">
							<option value="">无</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="30%"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="moduleAdd()">
					</td>
					<td>
						<span ng-if="addMessage != ''">
							<font color="red">{{result.addMessage}}</font>
						<span>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>