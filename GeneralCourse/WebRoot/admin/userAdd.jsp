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
<script src="admin/js/userAdd.js"></script>
</head>
<body ng-controller="userAddController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/UserList">用户管理</a> > <a href="admin/UserAdd">新增用户</a>
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
					<td width="150" align="right"><font color="red">*</font>用户名</td>
					<td width="150">
						<input type="text" name="name" ng-model="user.userName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right"><font color="red">*</font>密码</td>
					<td>
						<input type="password" ng-model="user.password"/>
					</td>
					<td>
						<span ng-if="passwordMessage != ''">
							<font color="red">{{result.passwordMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right"><font color="red">*</font>确认密码</td>
					<td>
						<input type="password" ng-model="user.repassword"/>
					</td>
					<td>
						<span ng-if="repasswordMessage != ''">
							<font color="red">{{result.repasswordMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="150" align="right"><font color="red">*</font>性别</td>
					<td width="150">
						<input type="radio" name="sex" value="1" ng-model="user.sex"/><label>男</label>
						<input type="radio" name="sex" value="2" ng-model="user.sex"/><label>女</label>
					</td>
					<td>
						<span ng-if="sexMessage != ''">
							<font color="red">{{result.sexMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right"><font color="red">*</font>用户类型</td>
					<td width="150">
						<select ng-model="user.roleId" ng-options="role.roleId as role.roleName for role in roles" style="width:150px;">
							<option value="">-请选择-</option>
						</select>
					</td>
					<td>
						<span ng-if="roleMessage != ''">
							<font color="red">{{result.roleMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right">邮箱</td>
					<td width="150">
						<input type="email" name="email" ng-model="user.email"/>
					</td>
				</tr>
				
				<tr>
					<td width="150" align="right">电话</td>
					<td width="150">
						<input name="phone" ng-model="user.phone"/>
					</td>
				</tr>
				
				<tr>
					<td width="30%"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="userAdd()">
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