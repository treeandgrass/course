var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("moduleAddService",["$q","$http",function($q,$http){
	var moduleAddService = {};
	moduleAddService.getData = function(url,params){
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
	//获取一级
	moduleAddService.getOneLevelModules = function(){
		return this.getData("ModuleServlet",{method:"getOneLevelModules"});
	};
	//新增
	moduleAddService.moduleAdd = function(module){
		return this.getData("ModuleServlet",{method:"moduleAdd",module:module});
	};
	
	return moduleAddService;
}]);

generalCourseModule.controller("moduleAddController",function($scope,$filter,moduleAddService){
	$scope.init = function(){
		$scope.getOneLevelModules();
		$scope.module = {
				moduleName : "",
				url : "#",
				upid : ""
		};
	};
	//获取一级模块
	$scope.getOneLevelModules = function(){
		moduleAddService.getOneLevelModules().then(function(res){
			$scope.oneLevelModules = res;
		});
	};
	//新增
	$scope.moduleAdd = function(){
		moduleAddService.moduleAdd($scope.module).then(function(res){
			$scope.result = res[0];
			if(res[0].success == 1){
				window.location.href="admin/ModuleList";
			}
		});
	};
	
	$scope.init();
});