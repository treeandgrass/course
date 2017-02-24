var generalCourseModule = angular.module("generalCourse",['720kb.datepicker','tm.pagination']);

generalCourseModule.factory("userListService",["$q","$http",function($q,$http){
	var userListService = {};
	userListService.getData = function(url,params){
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
	//查询用户
	userListService.getUsers = function(params){
		return this.getData("UserServlet",{method:"getUsers",params:params});
	};
	//获取所有角色
	userListService.getRoles = function(){
		return this.getData("RoleServlet",{method:"getRoles"});
	};
	//删除角色
	userListService.deleteUser = function(userId){
		return this.getData("UserServlet",{method:"deleteUserById",id:userId});
	};
	
	return userListService;
}]);

generalCourseModule.controller("userListController",function($scope,$filter,userListService){
	$scope.init = function(){
		
		$scope.getRoles();
		//获取当月第一天和最后一天
		var dateFormat = "yyyy-MM-dd";
		var firstAndLastDay = $scope.getFirstAndLastDayInMonth();
		$scope.selectRegisterTimeStart = $filter('date')(firstAndLastDay.firstDate, dateFormat);
		$scope.selectRegisterTimeEnd = $filter('date')(firstAndLastDay.lastDate, dateFormat);
		
		$scope.selectUsers();
	};

	//获取当月第一天和最后一天
	$scope.getFirstAndLastDayInMonth = function(){
		var firstDate = new Date();
		firstDate.setDate(1);
		
		var lastDate = new Date(firstDate);
		lastDate.setMonth(lastDate.getMonth()+1);
		lastDate.setDate(0);
		
		return {
				firstDate:firstDate,
				lastDate:lastDate
		};
	};
	//根据条件搜索用户
	$scope.selectUsers = function(){

		$scope.selectParams = {
				name:$scope.selectName,
				registerTimeStart:$scope.selectRegisterTimeStart,
				registerTimeEnd:$scope.selectRegisterTimeEnd,
				roleId:$scope.selectRoleId,
				email:$scope.selectEmail,
				phone:$scope.selectPhone,
				sex:$scope.selectSex
		};
		
		userListService.getUsers($scope.selectParams).then(function(res){
			$scope.users = res;
			//数据处理
			for(var i = 0;i < $scope.users.length;i++){
				$scope.users[i].sex = $scope.users[i].sex == null ?"":($scope.users[i].sex == 1? "男" :($scope.users[i].sex == 2? "女":""));
			}
			$scope.paginationConf.totalItems = res.length;
		});
	};
	//获取所有角色
	$scope.getRoles = function(){
		userListService.getRoles().then(function(res){
			$scope.roles = res;
		});
	};
	
	$scope.deleteUser = function(index){
		//是否删除
		if(confirm("是否确定删除？")){
			var userId = $scope.users[index].userId;
			userListService.deleteUser(userId).then(function(res){
				if(res[0].result == "1")
					$scope.selectUsers();
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