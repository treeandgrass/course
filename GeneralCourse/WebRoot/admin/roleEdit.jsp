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

<script>
	<%String roleId = request.getParameter("roleId");%>
	var roleId = "<%=roleId%>";
</script>
<script src="js/angular.js"></script>
<script src="admin/js/roleEdit.js"></script>
</head>
<body ng-controller="roleEditController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/RoleList">角色管理</a> > <a href="admin/RoleEdit?roleId={{role.roleId}}">编辑角色信息</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<input type="hidden" value="{{role.roleId}}">
		<table width="100%" class="formTable" border="0">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>角色名称</td>
					<td width="150">
						<input type="text" ng-model="role.roleName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						</span>
					</td>
				
				<tr>
					<td width="150"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="roleEdit()">
					</td>
				</tr>
				<tr ng-if="result.editMessage != ''">
					<td width="150"></td>
					<td>
						<font color="red">{{result.editMessage}}</font>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>