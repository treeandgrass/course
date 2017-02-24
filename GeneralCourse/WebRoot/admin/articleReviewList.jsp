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
<link rel="stylesheet" type="text/css" href="css/angular-datepicker.css" />
<script src="js/angular.js"></script>
<script src="js/tm.pagination.js"></script>
<script src="js/angular-datepicker.js"></script>
<script src="admin/js/articleReviewList.js"></script>
</head>
<body ng-controller="articleReviewListController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/ArticleList">审核文章</a>
			</td>
		</tr>
	</table>
	<hr>
		<table>
			<tr>
				<td>文章标题:</td>
				<td><input ng-model="selectName" /></td>
				<td>所属栏目:</td>
				<td>
					<select ng-model="selectColumnId" ng-options="column.columnId as column.columnName group by column.upColumnName for column in columns" style="width:150px;">
						<option value="">-请选择-</option>
					</select>
				</td>
				<td>截止时间:</td>
				<td>
					<datepicker date-format="yyyy-MM-dd">
					    <input ng-model="selectDeadLineStart" style="width:100px;"/>
					</datepicker>
					-
					<datepicker date-format="yyyy-MM-dd">
					    <input ng-model="selectDeadLineEnd" style="width:100px;"/>
					</datepicker>
				</td>
			</tr>
			<tr>
				<td>作&nbsp;&nbsp;者:</td>
				<td>
					<input ng-model="selectAuthor" />
				</td>
				<td>浏览次数:</td>
				<td>
					<input type="text" ng-model="selectScanCountStart" style="width:59px;"/>
					-
					<input type="text" ng-model="selectScanCountEnd" style="width:59px;"/>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" ng-click="selectArticles()" value="查询" />
				</td>
			</tr>
		</table>
	
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="18%">文章标题</td>
				<td width="16%">所属栏目</td>
				<td width="15%">截止时间</td>
				<td width="10%">作者</td>
				<td width="10%">状态</td>
				<td width="5%">浏览次数</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
				<tr ng-repeat="article in articles" ng-if="$index >= (paginationConf.currentPage-1)*paginationConf.itemsPerPage && $index < paginationConf.currentPage*paginationConf.itemsPerPage">
					<td>{{article.title}}</td>
					<td>{{article.columnName}}</td>
					<td>{{article.deadLine}}</td>
					<td>{{article.userName}}</td>
					<td>{{article.status}}</td>
					<td>{{article.scanCount}}</td>
					<td>
						<a href="admin/ArticleReview?articleId={{article.articleId}}">审核</a>
					</td>
				</tr>
		</tbody>
	</table>
	<tm-pagination conf="paginationConf"></tm-pagination>
</body>
</html>