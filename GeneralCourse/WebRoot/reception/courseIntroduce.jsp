<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html ng-app="indexApp">
  <head>
    <base href="<%=basePath%>">
    
    <title>课程介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="container">
	
	<!-- 引入css -->
	<link rel="stylesheet" type="text/css" href="css/index.css" />
 	<link rel="stylesheet" type="text/css" href="css/courseintroduce.css" />
 	
 	<!-- 获取传过来的参数 -->
 	<script>
 		var indexcolumnId = <%=request.getParameter("columnId")%>
 	</script>
 	
  </head>
  
  <body>
	<div class="body">
	
	<!--引入头部  -->
  	  <div ng-controller="headerController">
  		 <jsp:include page="header.jsp"/>
      </div>
      
    <!-- 引入主体 --> 
    <div class="section" ng-controller="courseIntroduce">
	  		<div class="lefttheme">
	  			<jsp:include page="leftIndex.jsp"/>
	  		</div>
	  		
  			<div class="righttheme">
  				<div class="introduce">
	  				<jsp:include page="introduce.jsp"/>
	  			</div>
	  			<iframe id="oneframe" class="localframe" src="">
	  				
	  			</iframe>
  			</div>
  	  </div>
  	  
  	  <!-- 引入脚端 -->
  	  <div>
  		 	<jsp:include page="footer.jsp"/>
  	  </div>
  	  
  	</div>
 </body>
 	<script type="text/javascript" src="js/angular.js"></script>
 	<script type="text/javascript" src="js/ng-table.js"></script>
 	<script type="text/javascript" src="js/common.js"></script>
 	<script type="text/javascript" src="js/header.js"></script>
 	<script type="text/javascript" src="js/leftindex.js"></script>
</html>
