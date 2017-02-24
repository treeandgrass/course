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
<link rel="stylesheet" type="text/css" href="admin/css/listTable.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/angular.js"></script>
<script src="js/tm.pagination.js"></script>
<script src="admin/js/columnList.js"></script>
</head>
<body ng-controller="columnListController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/ColumnList">栏目管理</a>
			</td>
			<td width="50%" align="right" valign="middle">
				<a href="admin/ColumnAdd">新增</a>
			</td>
		</tr>
	</table>
	<hr>
		<!-- <table>
			<tr>
				<td>栏目名:</td>
				<td><input ng-model="selectName" /></td>
				<td>栏目类型:</td>
				<td>
					<select ng-model="selectRoleId" ng-options="role.roleId as role.roleName for role in roles" style="width:150px;">
						<option value="">-请选择-</option>
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
						<option value="">-请选择-</option>
						<option value="1">男</option>
						<option value="2">女</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" ng-click="selectcolumns()" value="查询" />
				</td>
			</tr>
		</table> -->
	
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="25%">栏目名</td>
				<td width="25%">链接地址</td>
				<td width="25%">上级栏目</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
				<tr ng-repeat="column in columns" ng-if="$index >= (paginationConf.currentPage-1)*paginationConf.itemsPerPage && $index < paginationConf.currentPage*paginationConf.itemsPerPage">
					<td>{{column.columnName}}</td>
					<td>{{column.url}}</td>
					<td>{{column.upColumnName}}</td>
					<td>
						<a href="admin/ColumnEdit?columnId={{column.columnId}}">编辑</a> | 
						<a href="javascript:void(0)" ng-click="deleteColumn($index)">删除</a>
					</td>
				</tr>
		</tbody>
	</table>
	<tm-pagination conf="paginationConf"></tm-pagination>
</body>
</html>