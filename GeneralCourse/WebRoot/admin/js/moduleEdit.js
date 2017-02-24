var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("moduleEditService",["$q","$http",function($q,$http){
	var moduleEditService = {};
	moduleEditService.getData = function(url,params){
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
	//获取一级模块
	moduleEditService.getOneLevelModules = function(){
		return this.getData("ModuleServlet",{method:"getOneLevelModules"});
	};
	//修改模块
	moduleEditService.moduleEdit = function(module){
		return this.getData("ModuleServlet",{method:"moduleEdit",module:module});
	};
	//根据id获取模块
	moduleEditService.getModuleById = function(id){
		return this.getData("ModuleServlet",{method:"getModuleById",moduleId:id});
	};
	
	return moduleEditService;
}]);

generalCourseModule.controller("moduleEditController",function($scope,$filter,moduleEditService){
	$scope.init = function(){
		$scope.getModuleById(moduleId);
		$scope.getOneLevelModules();
	};
	//根据id获取模块
	$scope.getModuleById = function(moduleId){
		moduleEditService.getModuleById(moduleId).then(function(res){
			$scope.module = res[0];
		});
	};
	//获得一级模块
	$scope.getOneLevelModules = function(moduleId){
		moduleEditService.getOneLevelModules().then(function(res){
			$scope.oneLevelModules = res;
			for(var i = 0; i < res.length;i++){
				//如果就是这个模块则从列表中删除
				if(res[i].moduleId == $scope.module.moduleId){
					$scope.oneLevelModules.splice(i,1);
					break;
				}
			}
		});
	};
	//修改模块
	$scope.moduleEdit = function(){
		moduleEditService.moduleEdit($scope.module).then(function(res){
			$scope.result = res[0];
		});
	};
	
	$scope.init();
});