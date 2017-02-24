var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("userDetailService",["$q","$http",function($q,$http){
	var userDetailService = {};
	userDetailService.getData = function(url,params){
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
	userDetailService.getUserById = function(id){
		return this.getData("UserServlet",{method:"getUserById",userId:id});
	};
	
	return userDetailService;
}]);

generalCourseModule.controller("userDetailController",function($scope,$filter,userDetailService){
	$scope.init = function(){
		$scope.getUserById(userId);
	};
	//根据id获取用户
	$scope.getUserById = function(userId){
		userDetailService.getUserById(userId).then(function(res){
			$scope.user = res[0];
			//数据处理
			$scope.user.sex = $scope.user.sex == null ?"":($scope.user.sex == 1? "男" : "女");
			$scope.user.url = $scope.user.url == null ? "image/noImg.png" : $scope.user.url;
		});
	};
	
	$scope.init();
	
});