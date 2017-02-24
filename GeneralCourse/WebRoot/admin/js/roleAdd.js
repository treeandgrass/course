var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("roleAddService",["$q","$http",function($q,$http){
	var roleAddService = {};
	roleAddService.getData = function(url,params){
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
	//新增角色
	roleAddService.roleAdd = function(role){
		return this.getData("RoleServlet",{method:"roleAdd",role:role});
	};
	
	return roleAddService;
}]);

generalCourseModule.controller("roleAddController",function($scope,$filter,roleAddService){
	$scope.init = function(){
		$scope.role = {
				roleName : "",
		};
	};
	//新增角色
	$scope.roleAdd = function(){
		roleAddService.roleAdd($scope.role).then(function(res){
			$scope.result = res[0];
			if(res[0].success == 1){
				window.location.href="admin/RoleList";
			}
		});
	};
	
	$scope.init();
});