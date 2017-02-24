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
		<%String articleId = request.getParameter("articleId");%>
		var articleId = "<%=articleId%>";
	</script>
	<script src="js/angular.js"></script>
	<script src="admin/js/articleReview.js"></script>
</head>
<body ng-controller="articleReviewController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/ArticleReviewList">审核文章</a> > <a href="admin/ArticleReview?articleId={{article.articleId}}">《{{article.title}}》</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<input type="hidden" value="{{article.articleId}}">
		<table width="100%" class="formTable" border="0">
			<tbody>
				<tr>
					<td width="150" align="center">
						文章标题:
						{{article.title}}
					</td>
					<td width="30%" align="center">
						所属栏目:
						{{article.columnName}}
					</td>
					<td width="30%" align="center">
						截止时间:
						{{article.deadLine}}
					</td>
				</tr>
		</table>
		<div id="content"></div>
		<table>
				<tr>
					<td width="30%"></td>
					<td width="150">
						<input type="submit" value="通过" ng-click="articleReview(3)">
					</td>
					<td width="150">
						<input type="submit" value="不通过" ng-click="articleReview(2)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>