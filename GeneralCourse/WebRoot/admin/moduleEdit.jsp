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
	<%String moduleId = request.getParameter("moduleId");%>
	var moduleId = "<%=moduleId%>";
</script>
<script src="js/angular.js"></script>
<script src="admin/js/moduleEdit.js"></script>
</head>
<body ng-controller="moduleEditController">
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/ModuleList">模块管理</a> > <a href="admin/ModuleEdit?moduleId={{module.moduleId}}">编辑模块信息</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form>
		<input type="hidden" value="{{module.moduleId}}" name="moduleId">
		<table width="100%" class="formTable" border="0">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>模块名</td>
					<td width="150">
						<input type="text" ng-model="module.moduleName"/>
					</td>
					<td>
						<span ng-if="result.nameMessage != ''">
							<font color="red">{{result.nameMessage}}</font>
						</span>
					</td>
					<!-- <td rowspan="6" valign="top" style="margin: 0;padding:0;">
						<div style="width:100%;height:220px; position: relative;overflow: atuo;">
							<iframe src="admin/photoUpload.jsp?moduleId={{module.moduleId}}&photo={{module.photoId}}" border="0" frameborder="0" style="height: 200px;"></iframe>
						</div>
					</td> -->
				</tr>
				
				<tr>
					<td width="150" align="right"><font color="red">*</font>链接地址</td>
					<td width="150">
						<input type="text" ng-model="module.url"/>
					</td>
					<td>
						<font color="red">{{result.urlMessage}}</font>
					</td>
				</tr>
				
				<tr>
					<td width="150" align="right">上级模块</td>
					<td width="150">
						<select ng-model="module.upid" ng-options="module.moduleId as module.moduleName for module in oneLevelModules" style="width:150px;">
							<option value="">无</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="150"></td>
					<td width="150">
						<input type="submit" value="提交" ng-click="moduleEdit()">
					</td>
				</tr>
				<tr ng-if="result.editMessage != ''">
					<td width="150"></td>
					<td>
						<font color="red">{{result.editMessage}}</font>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>