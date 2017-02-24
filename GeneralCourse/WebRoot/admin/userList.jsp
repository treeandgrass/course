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
<link rel="stylesheet" type="text/css" href="css/angular-datepicker.css" />
<link rel="stylesheet" type="text/css" href="admin/css/listTable.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/angular.js"></script>
<script src="js/angular-datepicker.js"></script>
<script src="js/tm.pagination.js"></script>
<script src="admin/js/userList.js"></script>
</head>
<body ng-controller="userListController">
	<a name="top"></a>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/UserList">用户管理</a>
			</td>
			<td width="50%" align="right" valign="middle">
				<a href="admin/UserAdd">新增</a>
			</td>
		</tr>
	</table>
	<hr>
		<table>
			<tr>
				<td>用户名:</td>
				<td><input ng-model="selectName" /></td>
				<td>用户类型:</td>
				<td>
					<select ng-model="selectRoleId" ng-options="role.roleId as role.roleName for role in roles" style="width:150px;">
						<option value="">不限</option>
					</select>
				</td>
				<td>注册时间:</td>
				<td>
					<datepicker date-format="yyyy-MM-dd">
					    <input ng-model="selectRegisterTimeStart" style="width:100px;"/>
					</datepicker>
					-
					<datepicker date-format="yyyy-MM-dd">
					    <input ng-model="selectRegisterTimeEnd" style="width:100px;"/>
					</datepicker>
				</td>
			</tr>
			<tr>
				<td>邮&nbsp;&nbsp;箱:</td>
				<td>
					<input ng-model="selectEmail" />
				</td>
				<td>电&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
				<td>
					<input ng-model="selectPhone" style="width:146px;" />
				</td>
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td>
					<select ng-model="selectSex" style="width:104px;">
						<option value="">不限</option>
						<option value="1">男</option>
						<option value="2">女</option>
					</select>
					<input type="button" ng-click="selectUsers()" value="查询" style="width:104px;margin-left:12px;" />
				</td>
			</tr>
		</table>
	
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="15%">用户名</td>
				<td width="5%">性别</td>
				<td width="15%">注册时间</td>
				<td width="15%">用户类型</td>
				<td width="15%">邮箱</td>
				<td width="15%">电话</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
				<tr ng-repeat="user in users" ng-if="$index >= (paginationConf.currentPage-1)*paginationConf.itemsPerPage && $index < paginationConf.currentPage*paginationConf.itemsPerPage">
					<td>{{user.userName}}</td>
					<td>{{user.sex}}</td>
					<td>{{user.registerTime}}</td>
					<td>{{user.roleName}}</td>
					<td>{{user.email}}</td>
					<td>{{user.phone}}</td>
					<td>
						<a href="admin/UserDetail?userId={{user.userId}}">详细</a> | 
						<a href="admin/UserEdit?userId={{user.userId}}">编辑</a> | 
						<a href="javascript:void(0)" ng-click="deleteUser($index)">删除</a>
					</td>
				</tr>
		</tbody>
	</table>
	<tm-pagination conf="paginationConf"></tm-pagination>
</body>
</html>