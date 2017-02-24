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
	<%String userId = request.getParameter("userId");%>
	var userId = "<%=userId%>";
</script>
<script src="js/angular.js"></script>
<script src="admin/js/userEdit.js"></script>
</head>
<body ng-controller="userEditController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/UserList">用户管理</a> > <a href="admin/UserEdit?userId={{user.userId}}">编辑用户信息</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<input type="hidden" value="{{user.userId}}" name="userId">
		<table width="100%" class="formTable" border="0">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>用户名</td>
					<td width="150">
						<input type="text" ng-model="user.userName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						</span>
					</td>
					<!-- <td rowspan="6" valign="top" style="margin: 0;padding:0;">
						<div style="width:100%;height:220px; position: relative;overflow: atuo;">
							<iframe src="admin/photoUpload.jsp?userId={{user.userId}}&photo={{user.photoId}}" border="0" frameborder="0" style="height: 200px;"></iframe>
						</div>
					</td> -->
				</tr>
				
				<tr>
					<td width="150" align="right">性别</td>
					<td width="150">
						<input type="radio" name="sex" value="1" ng-checked="user.sex == 1" ng-model="user.sex"/><label>男</label>
						<input type="radio" name="sex" value="2" ng-checked="user.sex == 2" ng-model="user.sex"/><label>女</label>
					</td>
				</tr>
				
				<tr>
					<td width="150" align="right">邮箱</td>
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
					<td width="150" align="right">用户类型</td>
					<td width="150">
						<select ng-model="user.roleId" ng-options="role.roleId as role.roleName for role in roles" style="width:150px;">
						</select>
					</td>
				</tr>
	
 					<td width="150" align="right">旧密码</td>
 					<td>
 						<input type="password" ng-model="user.oldPassword"/>
					</td>
					<td>
 						<span ng-if="result.oldPasswordMessage == null">
							<font>不修改密码则为空</font>
						</span>
 						<span ng-if="result.oldPasswordMessage != ''">
							<font color="red">{{result.oldPasswordMessage}}</font>
						</span>
					</td>
 				</tr>
				
 				<tr>
					<td width="150" align="right">新密码</td>
 					<td>
 						<input type="password" ng-model="user.newPassword"/>
					</td>
					<td>
 						<span ng-if="result.newPasswordMessage != ''">
							<font color="red">{{result.newPasswordMessage}}</font>
						</span>
					</td>
 				</tr>
				
 				<tr>
					<td width="150" align="right">确认新密码</td>
 					<td>
 						<input type="password" ng-model="user.reNewPassword"/>
					</td>
					<td>
 						<span ng-if="result.reNewPasswordMessage != ''">
							<font color="red">{{result.reNewPasswordMessage}}</font>
						</span>
					</td>
 				</tr>
				
				<tr>
					<td width="150"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="userEdit()">
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