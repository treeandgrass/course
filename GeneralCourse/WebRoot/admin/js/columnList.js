var generalCourseModule = angular.module("generalCourse",['tm.pagination']);

generalCourseModule.factory("columnListService",["$q","$http",function($q,$http){
	var columnListService = {};
	columnListService.getData = function(url,params){
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
	//获取所有栏目
	columnListService.getColumns = function(){
		return this.getData("ColumnServlet",{method:"getAllColumn"});
	};
	//删除栏目
	columnListService.deleteColumn = function(columnId){
		return this.getData("ColumnServlet",{method:"deleteColumnById",id:columnId});
	};
	
	return columnListService;
}]);

generalCourseModule.controller("columnListController",function($scope,$filter,columnListService){
	$scope.init = function(){
		$scope.getColumns();
	};
	//获取所有栏目
	$scope.getColumns = function(){
		columnListService.getColumns().then(function(res){
			$scope.columns = res;
			$scope.paginationConf.totalItems = res.length;
		});
	};
	
	$scope.deleteColumn = function(index){
		//是否删除
		if(confirm("是否确定删除？")){
			var columnId = $scope.columns[index].columnId;
			columnListService.deleteColumn(columnId).then(function(res){
				if(res[0].result == "1")
					$scope.getColumns();
				else{
					alert("删除失败！"); 
				}
			});
		}
	};
	//分页
	$scope.paginationConf = {
        currentPage: 1,//当前页
        totalItems: 0,//总个数
        itemsPerPage: 7,//每页个数
        pagesLength: 9,//底部页码展示个数
        perPageOptions: [10, 20, 30, 40, 50],//每页个数候选项
        onChange: function(){
        }
    };
	
	$scope.init();
});