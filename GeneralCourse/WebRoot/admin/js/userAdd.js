var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("userAddService",["$q","$http",function($q,$http){
	var userAddService = {};
	userAddService.getData = function(url,params){
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
	userAddService.getRoles = function(){
		return this.getData("RoleServlet",{method:"getRoles"});
	};
	//新增用户
	userAddService.userAdd = function(user){
		return this.getData("UserServlet",{method:"userAdd",user:user});
	};
	
	return userAddService;
}]);

generalCourseModule.controller("userAddController",function($scope,$filter,userAddService){
	$scope.init = function(){
		$scope.getRoles();
		$scope.user = {
				userName : "",
				password : "",
				repassword : "",
				sex : "",
				email : "",
				phone : "",
				roleId : ""
		};
	};
	//获取所有角色
	$scope.getRoles = function(){
		userAddService.getRoles().then(function(res){
			$scope.roles = res;
		});
	};
	//新增用户
	$scope.userAdd = function(){
		userAddService.userAdd($scope.user).then(function(res){
			$scope.result = res[0];
			if(res[0].success == 1){
				window.location.href="admin/UserList";
			}
		});
	};
	
	$scope.init();
});