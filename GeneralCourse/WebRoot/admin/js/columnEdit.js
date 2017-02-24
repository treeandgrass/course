var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("columnEditService",["$q","$http",function($q,$http){
	var columnEditService = {};
	columnEditService.getData = function(url,params){
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
	columnEditService.getOneLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getOneLevelColumns"});
	};
	//修改栏目
	columnEditService.columnEdit = function(column){
		return this.getData("ColumnServlet",{method:"columnEdit",column:column});
	};
	//根据id获取栏目
	columnEditService.getColumnById = function(id){
		return this.getData("ColumnServlet",{method:"getColumnById",columnId:id});
	};
	
	return columnEditService;
}]);

generalCourseModule.controller("columnEditController",function($scope,$filter,columnEditService){
	$scope.init = function(){
		$scope.getColumnById(columnId);
		$scope.getOneLevelColumns();
	};
	//根据id获取栏目
	$scope.getColumnById = function(columnId){
		columnEditService.getColumnById(columnId).then(function(res){
			$scope.column = res[0];
		});
	};
	//获取一级栏目
	$scope.getOneLevelColumns = function(columnId){
		columnEditService.getOneLevelColumns().then(function(res){
			$scope.oneLevelColumns = res;
			for(var i = 0; i < res.length;i++){
				//如果就是这个栏目则从列表中除去
				if(res[i].columnId == $scope.column.columnId){
					$scope.oneLevelColumns.splice(i,1);
					break;
				}
			}
		});
	};
	//栏目修改
	$scope.columnEdit = function(){
		columnEditService.columnEdit($scope.column).then(function(res){
			$scope.result = res[0];
		});
	};
	
	$scope.init();
});