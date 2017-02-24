var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("permissionService",["$q","$http",function($q,$http){
	var permissionService = {};
	permissionService.getData = function(url,params){
		var deferred = $q.defer();
		var promise = deferred.promise;
		
		$http(
				{method:"POST",
				url:url,
				params:params}
		).success(function(data){
			deferred.resolve(data);
		}).error(function(error){
			deferred.reject(error);
		});
		return promise;
	};
	//获取所有角色
	permissionService.getRoles = function(){
		return this.getData("RoleServlet",{method:"getRoles"});
	};
	//根据角色获取可用模块
	permissionService.getModulesByRoleId = function(id){
		return this.getData("ModuleServlet",{method:"getModulesByRoleId",id:id});
	};
	//获取所有模块
	permissionService.getModules = function(){
		return this.getData("ModuleServlet",{method:"getAllModule"});
	};
	//新增权限
	permissionService.addPermission = function(permission){
		return this.getData("PermissionServlet", {method:"addPermission",permission:permission});
	};
	//删除权限
	permissionService.deletePermission = function(permission){
		return this.getData("PermissionServlet", {method:"deletePermission",permission:permission});
	};
	
	return permissionService;
}]);

generalCourseModule.controller("permissionController",function($scope,$filter,permissionService){
	$scope.init = function(){
		$scope.permission = {
				roleId : ""
		};
		$scope.getRoles();
		$scope.getModules();
	};
	//获取所有角色
	$scope.getRoles = function(){
		permissionService.getRoles().then(function(res){
			$scope.roles = res;
			//初始化树节点的属性
			for(var i = 0;i < res.length;i++){
				$scope.roles[i].text = res[i].roleName;
				$scope.roles[i].icon = "jstree-file";
			}
			//创建角色树
			$('#allRole').jstree({
				  "core" : {
					    'data' : [
							{
								"text" : "全部角色", 
								"state" : { "opened" : true },
								"children" : $scope.roles
						}]
				  }
			//点击某一角色节点，则找出该角色所有可用模块
			}).on("changed.jstree", function (e, data) {
				$scope.permission.roleId = data.node.original.roleId;
				$scope.getModulesByRoleId(data.node.original.roleId);
			});
		});
	};
	//获取所有模块
	$scope.getModules = function(){
		permissionService.getModules().then(function(res){
			$scope.modules = res;
			
			var allModules = [];
			var oneLevelIndex = 0;
			//适应jstree的处理
			for(var i = 0;i < res.length;i++){
				if(res[i].upid == null || res[i].upid ==""){
					allModules[oneLevelIndex] = {};
					allModules[oneLevelIndex].id = res[i].moduleId;
					allModules[oneLevelIndex].text = res[i].moduleName;
					allModules[oneLevelIndex].state = {"opened" : true};
					var children = [];
					var twoLevelIndex = 0;
					for(var j = 0;j < res.length;j++){
						if(res[j].upid == res[i].moduleId){
							children[twoLevelIndex] = {};
							children[twoLevelIndex].id = res[j].moduleId;
							children[twoLevelIndex].upid = res[j].upid;
							children[twoLevelIndex].icon = "jstree-file";
							children[twoLevelIndex++].text = res[j].moduleName;
						}
					}
					allModules[oneLevelIndex++].children = children;
				}
			}
			//创建模块树
			$('#allModule').jstree({
				  "core" : {
					    'data' : [
							{
								"text" : "全部模块", 
								"state" : { "opened" : true },
								"children" : allModules
						}]
				  },
				  "plugins" : [ "checkbox" ]
			//选中某节点所触发的事件
			}).on("select_node.jstree", function (e, data) {
				//新增该模块的权限
				$scope.addPermission({roleId : $scope.permission.roleId,moduleId : data.node.id});
				//如果是一级模块，则新增该模块下所有二级模块的权限
				if(data.node.original.upid == null){
					var children = $('#allModule').jstree().get_children_dom(data.node);
					for(var i = 0;i < children.length;i++){
						$scope.addPermission({roleId : $scope.permission.roleId,moduleId : children[i].id});
					}
				//如果是二级模块，则新增该模块的上级（一级）模块
				}else{
					var parent = $('#allModule').jstree().get_parent(data.node);
					$scope.addPermission({roleId : $scope.permission.roleId,moduleId : parent});
				}
			//取消选中某节点触发的事件
			}).on("deselect_node.jstree", function (e, data) {
				//删除该模块的权限
				$scope.deletePermission({roleId : $scope.permission.roleId,moduleId : data.node.id});
				//如果是一级模块，则删除该模块下所有二级模块的权限
				if(data.node.original.upid == null){
					var children = $('#allModule').jstree().get_children_dom(data.node);
					for(var i = 0;i < children.length;i++){
						$scope.deletePermission({roleId : $scope.permission.roleId,moduleId : children[i].id});
					}
				//如果是二级模块
				}else{
					var root = $('#allModule').jstree().get_parent(data.node);
					var selectNodes = $('#allModule').jstree().get_selected(true);
					var deleteRoot = true;
					//判断上级模块是否仍有有权限的二级模块，若有则不删除上级模块的权限
					for(var i = 0;i < selectNodes.length;i++){
						if(selectNodes[i].original.upid == root){
							deleteRoot = false;
							break;
						}
					}
					if(deleteRoot)
						$scope.deletePermission({roleId : $scope.permission.roleId,moduleId : root});
				}
			});
		});
	};
	//新增权限
	$scope.addPermission = function(permission){
		permissionService.addPermission(permission).then(function(res){
			$scope.result = res[0];
		});
	};
	//删除权限
	$scope.deletePermission = function(permission){
		permissionService.deletePermission(permission).then(function(res){
			$scope.result = res[0];
		});
	};
	//根据角色获取有权限模块
	$scope.getModulesByRoleId = function(id){
		permissionService.getModulesByRoleId(id).then(function(res){
			$scope.modules = res;
			
				$('#allModule').jstree().uncheck_all();
			//将所有有权限的二级模块选中
			//若选中一级模块则不管其下的二级模块是否有权限都会被选中
			for(var i = 0;i<res.length;i++){
				if(res[i].upid != null && res[i].upid != "")
					$('#allModule').jstree().select_node(res[i].moduleId);
			};
		});
	};
	
	$scope.init();
});