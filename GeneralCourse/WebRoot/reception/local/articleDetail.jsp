<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章详情介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="details 、 video">
	<link rel="stylesheet" type="text/css" href="css/detailpage.css">
	<script>
		var articleId = <%=request.getParameter("articleId") %>
	</script>
  </head>
  
  <body>
  		<div class="all" ng-app="indexApp">
  			<div ng-controller="headerController">
  				<jsp:include page="../header.jsp"/>
  			</div>
  			<div class="videobody" ng-controller="articleDetail">
  				<div class="show">
  					<div class="showtitletop">
  						图片与标题说明
  					</div>
  					<div class="showimg">
  						<img src="image/{{datas.articleDetail[0].url}}" alt="图片">
  					</div>
  					<div class="showfont">
  						<p>标题：{{datas.articleDetail[0].title}}</p>
  						<p>用户名：{{datas.articleDetail[0].userName}}</p>
  						<p>发布时间：{{datas.articleDetail[0].publishTime}}</p>
  					</div>
  				</div>
  				<div class="detailintroduce">
  					<div class="showtitlebottom">
  						文字详细介绍
  					</div>
  					{{datas.articleDetail[0].content}}
  				</div>
  			</div>
  			<div>
  				<jsp:include page="../footer.jsp"/>
  			</div>
  		</div>
  </body>
  	<script type="text/javascript" src="js/angular.js"></script>
 	<script type="text/javascript" src="js/ng-table.js"></script>
 	<script type="text/javascript" src="js/common.js"></script>
 	<script type="text/javascript" src="js/header.js"></script>
 	<script type="text/javascript" src="js/articledetail.js"></script>
</html>
