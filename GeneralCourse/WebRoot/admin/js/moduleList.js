var generalCourseModule = angular.module("generalCourse",['tm.pagination']);

generalCourseModule.factory("moduleListService",["$q","$http",function($q,$http){
	var moduleListService = {};
	moduleListService.getData = function(url,params){
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
	//获取所有模块
	moduleListService.getModules = function(){
		return this.getData("ModuleServlet",{method:"getAllModule"});
	};
	//删除模块
	moduleListService.deleteModule = function(moduleId){
		return this.getData("ModuleServlet",{method:"deleteModuleById",id:moduleId});
	};
	
	return moduleListService;
}]);

generalCourseModule.controller("moduleListController",function($scope,$filter,moduleListService){
	$scope.init = function(){
		$scope.getModules();
	};
	//获取所有模块
	$scope.getModules = function(){
		moduleListService.getModules().then(function(res){
			$scope.modules = res;
			$scope.paginationConf.totalItems = res.length;
		});
	};
	
	$scope.deleteModule = function(index){
		//是否删除
		if(confirm("是否确定删除？")){
			var moduleId = $scope.modules[index].moduleId;
			moduleListService.deleteModule(moduleId).then(function(res){
				if(res[0].result == "1")
					$scope.getModules();
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