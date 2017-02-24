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
	<link rel="stylesheet" type="text/css" href="css/angular-datepicker.css" />

	<script src="js/angular.js"></script>
	<script src="js/angular-datepicker.js"></script>
	<!-- 配置文件 -->
	<script type="text/javascript" src="admin/js/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="admin/js/ueditor/ueditor.all.js"></script>
	<script src="admin/js/articleAdd.js"></script>
</head>
<body ng-controller="articleAddController">
	<a name="top"></a>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/ArticleList">文章管理</a> > <a href="admin/ArticleAdd">新增文章</a>
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
					<td width="150" align="center"><font color="red">*</font>文章标题
						<input type="text" ng-model="article.articleName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						<span>
					</td>
					<td width="30%" align="center"><font color="red">*</font>所属栏目
						<select ng-model="article.columnId" ng-options="column.columnId as column.columnName group by column.upColumnName for column in columns">
						</select>
					</td>
					<td>
						<span ng-if="result.columnMessage != ''">
							<font color="red">{{result.columnMessage}}</font>
						<span>
					</td>
					<td width="30%" align="center">截止时间
						<datepicker date-format="yyyy-MM-dd">
						    <input ng-model="article.deadLine"/>
						</datepicker>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						<script id="editor" type="text/plain" style="height:200px;"></script>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						<span ng-if="result.contentMessage != ''">
							<font color="red">{{result.contentMessage}}</font>
						<span>
					</td>
				</tr>
				
				<tr>
					<td width="30%"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="articleAdd()">
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