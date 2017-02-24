var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("columnAddService",["$q","$http",function($q,$http){
	var columnAddService = {};
	columnAddService.getData = function(url,params){
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
	//获取一级栏目
	columnAddService.getOneLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getOneLevelColumns"});
	};
	//新增
	columnAddService.columnAdd = function(column){
		return this.getData("ColumnServlet",{method:"columnAdd",column:column});
	};
	
	return columnAddService;
}]);

generalCourseModule.controller("columnAddController",function($scope,$filter,columnAddService){
	$scope.init = function(){
		$scope.getOneLevelColumns();
		$scope.column = {
				columnName : "",
				url : "#",
				upid : ""
		};
	};
	//获取一级栏目
	$scope.getOneLevelColumns = function(){
		columnAddService.getOneLevelColumns().then(function(res){
			$scope.oneLevelColumns = res;
		});
	};
	//新增栏目
	$scope.columnAdd = function(){
		columnAddService.columnAdd($scope.column).then(function(res){
			$scope.result = res[0];
			if(res[0].success == 1){
				window.location.href="admin/ColumnList";
			}
		});
	};
	
	$scope.init();
});