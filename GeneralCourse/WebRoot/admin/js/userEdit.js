var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("userEditService",["$q","$http",function($q,$http){
	var userEditService = {};
	userEditService.getData = function(url,params){
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
	//根据id获取用户
	userEditService.getUserById = function(id){
		return this.getData("UserServlet",{method:"getUserById",userId:id});
	};
	//获取所有角色
	userEditService.getRoles = function(){
		return this.getData("RoleServlet",{method:"getRoles"});
	};
	//修改用户
	userEditService.userEdit = function(user){
		return this.getData("UserServlet",{method:"userEdit",user:user});
	};
	
	return userEditService;
}]);

generalCourseModule.controller("userEditController",function($scope,$filter,userEditService){
	$scope.init = function(){
		$scope.getUserById(userId);
		$scope.getRoles();
	};
	//根据id获取用户
	$scope.getUserById = function(userId){
		userEditService.getUserById(userId).then(function(res){
			$scope.user = res[0];
		});
	};
	//获取所有角色
	$scope.getRoles = function(){
		userEditService.getRoles().then(function(res){
			$scope.roles = res;
		});
	};
	//修改用户
	$scope.userEdit = function(){
		userEditService.userEdit($scope.user).then(function(res){
			$scope.result = res[0];
		});
	};
	
	$scope.init();
});