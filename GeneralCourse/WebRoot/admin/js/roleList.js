var generalCourseModule = angular.module("generalCourse",['tm.pagination']);

generalCourseModule.factory("roleListService",["$q","$http",function($q,$http){
	var roleListService = {};
	roleListService.getData = function(url,params){
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
	roleListService.getRoles = function(){
		return this.getData("RoleServlet",{method:"getRoles"});
	};
	//删除角色
	roleListService.deleteRole = function(roleId){
		return this.getData("RoleServlet",{method:"deleteRoleById",id:roleId});
	};
	
	return roleListService;
}]);

generalCourseModule.controller("roleListController",function($scope,$filter,roleListService){
	$scope.init = function(){
		$scope.getRoles();
	};
	//获取所有角色
	$scope.getRoles = function(){
		roleListService.getRoles().then(function(res){
			$scope.roles = res;
			$scope.paginationConf.totalItems = res.length;
		});
	};
	
	$scope.deleteRole = function(index){
		//是否删除
		if(confirm("是否确定删除？")){
			var roleId = $scope.roles[index].roleId;
			roleListService.deleteRole(roleId).then(function(res){
				if(res[0].result == "1")
					$scope.getRoles();
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