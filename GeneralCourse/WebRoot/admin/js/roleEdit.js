var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("roleEditService",["$q","$http",function($q,$http){
	var roleEditService = {};
	roleEditService.getData = function(url,params){
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
	//根据id获取角色
	roleEditService.getRoleById = function(id){
		return this.getData("RoleServlet",{method:"getRoleById",roleId:id});
	};
	//修改角色
	roleEditService.roleEdit = function(role){
		return this.getData("RoleServlet",{method:"roleEdit",role:role});
	};
	
	return roleEditService;
}]);

generalCourseModule.controller("roleEditController",function($scope,$filter,roleEditService){
	$scope.init = function(){
		$scope.getRoleById(roleId);
	};
	//根据id获取角色
	$scope.getRoleById = function(roleId){
		roleEditService.getRoleById(roleId).then(function(res){
			$scope.role = res[0];
		});
	};
	//修改角色
	$scope.roleEdit = function(){
		roleEditService.roleEdit($scope.role).then(function(res){
			$scope.result = res[0];
		});
	};
	
	$scope.init();
});