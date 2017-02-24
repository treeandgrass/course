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
</head>
<body ng-controller="userDetailController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/UserList">用户管理</a> > <a href="admin/UserDetail?userId={{user.userId}}">用户详细信息</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	
	<table width="100%" class="formTable">
		<tbody>
			<tr>
				
				<td width="30%" align="right">姓名:</td>
				<td>
					&nbsp;<span>{{user.userName}}</span>
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">性别:</td>
				<td>
					&nbsp;<span>{{user.sex}}</span>
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">注册时间:</td>
				<td>
					&nbsp;<span>{{user.registerTime}}</span>
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">邮箱:</td>
				<td>
					&nbsp;<span>{{user.email}}</span>
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">电话:</td>
				<td>
					&nbsp;<span>{{user.phone}}</span>
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">用户类型:</td>
				<td>
					&nbsp;<span>{{user.roleName}}</span>						
				</td>
			</tr>
			
			<tr>
				<td width="30%" align="right">头像:</td>
				<td>
					<img alt="" src="{{user.url}}" style="width:100px;height:100px;"/>
				</td>
			</tr>
		</tbody>
	</table>
</body>
<script src="js/angular.js"></script>
<script src="admin/js/userDetail.js"></script>
</html>