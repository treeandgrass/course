<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据结构精品课程</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="课程、数据结构">
	<meta http-equiv="description" content="这是课程网站首页">
	<link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  
  <body>
    <table>
    	<tr id="firstRow">
    		<td class="firstColumn">
    			<img class="titleImg" src="image/img1.png"/>
    			<font class="indexTitle">课程简介</font>
    			<font class="titleEn">&nbsp;Introduce</font>
    			<div style="background-color:#d7d4d4;height:1px;margin-top:5px;"></div>
    		</td>
    		<td>
    			<img class="titleImg" src="image/img1.png"/>
    			<font class="indexTitle">课程负责人</font>
    			<font class="titleEn">&nbsp;Principal</font>
    			<div style="background-color:#d7d4d4;height:1px;margin-top:5px;"></div>
    		</td>
    	</tr>
    	<tr id="secondRow">
    		<td class="firstColumn">
    			<div id="introduction" class="content">
    			&nbsp;&nbsp;&nbsp;&nbsp;例如：ImageView的大小是100×100像素，而图片的原始大小为200×300，那么宽的缩放比是2，高的缩放比是3。如果最终inSampleSize=2，那么缩放后的图片大小100×150，仍然合适ImageView。如果inSampleSize=3，那么缩放后的图片大小小于ImageView所期望的大小，这样...
    			</div>
    		</td>
    		<td>
    			<font class="content">
	    		&nbsp;&nbsp;&nbsp;&nbsp;通常是根据图片宽高实际的大小/需要的宽高大小，分别计算出宽和高的缩放比。但应该取其中最小的缩放比，避免缩放图片太小，到达指定控件中不能铺满，需要拉伸从而导致模糊。...
    			</font>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<div style="width:540px;height:220px;border:1px solid #fadbdb;border-radius:10px;background-image:url(image/background.png);">
	    			<div style="position:relative;margin:10px;">
		    			<img class="titleImg" src="image/img1.png"/>
		    			<font class="indexTitle">课程动态</font>
		    			<font class="titleEn">&nbsp;Dynamic State</font>
		    			<a href="courseDynamic.jsp"><font style="position:absolute;right:10px;top:5px;font-size:1px;color:#5e5e5e;">MORE▶</font></a>
		    			<div style="background-color:#d7d4d4;height:1px;margin-top:5px;"></div>
	    			</div>
	    			<div>
	    				<div style="padding-left:10px;font-size:5px;" ng-repeat="article in articles">
		    				<font style="color:red;">▶</font>
		    				<a href="JSP/localjsp/articledetail.jsp?articleId={{article.articleId}}"><font>{{article.title}}</font></a>
		    				<font style="float:right;margin-right:10px;">{{article.publishTime}}</font>
	    				</div>
	    			</div>
    			</div>
    		</td>
    		<td>
    			<div style="height:220px;border:1px solid #fadbdb;border-radius:10px;background-image:url(image/background.png);">
	    			<div style="position:relative;margin:10px;">
		    			<img class="titleImg" src="image/img1.png"/>
		    			<font class="indexTitle">教学资源</font>
		    			<font class="titleEn">&nbsp;Resource</font>
		    			<a href="#"><font style="position:absolute;right:10px;top:5px;font-size:1px;color:#5e5e5e;">MORE▶</font></a>
		    			<div style="background-color:#d7d4d4;height:1px;margin-top:5px;"></div>
	    			</div>
	    			<div>
	    				<img class="resourceImg" src="image/teachFile.png" />
	    				<img class="resourceImg" src="image/teachVideo.png" />
	    			</div>
    			</div>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div style="position:relative;margin:10px;">
		    		<img class="titleImg" src="image/img1.png"/>
		    		<font class="indexTitle">课程组成员</font>
		    		<font class="titleEn">&nbsp;Members</font>
		    		<a href="#"><font style="position:absolute;right:10px;top:5px;font-size:1px;color:#5e5e5e;">MORE▶</font></a>
		    		<div style="background-color:#d7d4d4;height:1px;margin-top:5px;"></div>
	    		</div>
	    		<div style="margin:0 auto;width:935px;height:165px;border:1px solid #fadada;border-radius:10px;position:relative;">
	    			<img style="position:absolute;top:45px;left:0;cursor:pointer;" src="image/leftArrow2.png" ng-click="previousPage()"/>
	    			<div style="margin:15px auto;width:874px;height:134px;border:1px solid #e3e3e3;">
	    				<img style="width:136px;height:134px;margin-left:9px;" src="{{teamer.url}}" ng-repeat="teamer in teamers" ng-if="$index>=teamersPage*countPerPage && $index<(teamersPage+1)*countPerPage" />
	    			</div>
	    			<img style="position:absolute;top:45px;right:0;cursor:pointer;" src="image/rightArrow2.png" ng-click="nextPage()"/>
	    		</div>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2"></td>
    	</tr>
    </table>
  </body>
</html>
