<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>jstree</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="tree ">
	<link rel="stylesheet" type="text/css" href="css/style.min.css"/>
  </head>
  
  <body>
  		<div id="jstree" ng-app="myTree" ng-controller="treeController">
  			<ul>
  				<li ng-repeat="column in datas.sysDatas">
  					{{}}
  				</li>
  				
  			</ul>
  		</div>
  </body>
  <script type="text/javascript" src="js/angular.js"></script>
  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="js/jstree.min.js"></script>
  <script type="text/javascript" src="js/tree.js"></script>
  <script>
  	$(function(){
	  	$('#jstree').jstree({
	  			"checkbox": {
	            "keep_selected_style": false
	        },
	            "plugins": ["checkbox"]
	  	});
  	});
  </script>
</html>
