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
<script src="admin/js/roleAdd.js"></script>
</head>
<body ng-controller="roleAddController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/RoleList">角色管理</a> > <a href="admin/RoleAdd">新增角色</a>
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<table width="100%" class="formTable">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>角色名称</td>
					<td width="150">
						<input type="text" name="name" ng-model="role.roleName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						<span>
					</td>
				</tr>
				<tr>
					<td width="30%"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="roleAdd()">
					</td>
				</tr>
				<tr ng-if="addMessage != ''">
					<font color="red">{{result.addMessage}}</font>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>