<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>视频详情介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="details 、 video">
	<link rel="stylesheet" type="text/css" href="css/detailpage.css">
	<script>
		var videoId = <%=request.getParameter("id") %>
	</script>
  </head>
  
  <body>
  		<div class="all" ng-app="indexApp">
  			<div ng-controller="headerController">
  				<jsp:include page="../header.jsp"/>
  			</div>
  			<div class="videobody" ng-controller="detailPage">
  				<div class="show">
  					<div class="showtitletop">
  						图片与标题说明
  					</div>
  					<div class="showimg">
  						<img src="image/{{datas.detailPage[0].url}}" alt="图片">
  					</div>
  					<div class="showfont">
  						<p>标题：{{datas.detailPage[0].title}}</p>
  						<p>主讲人：{{datas.detailPage[0].userName}}</p>
  						<p>发布时间：{{datas.detailPage[0].publishedTime}}</p>
  						<p><a href="{{datas.detailPage[0].downurl}}?adressurl={{datas.detailPage[0].adressurl}}">点击下载</a></p>
  					</div>
  				</div>
  				<div class="detailintroduce">
  					<div class="showtitlebottom">
  						文字详细介绍
  					</div>
  					{{datas.detailPage[0].details}}
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
 	<script type="text/javascript" src="js/detailpage.js"></script>
</html>
