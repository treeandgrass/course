var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("adminIndexService",["$q","$http",function($q,$http){
	var adminIndexService = {};
	adminIndexService.getData = function(url,params){
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
	adminIndexService.getAllModule = function(){
		return this.getData("ModuleServlet",{method:"getAllModuleByCurrentUser"});
	};
	//获取一级模块
	adminIndexService.getOneLevelModule = function(){
		return this.getData("ModuleServlet", {method:"getOneLevelModule"});
	};
	//根据当前用户获取模块
	adminIndexService.getModulesByCurrentUser = function(id){
		return this.getData("ModuleServlet", {method:"getModulesByCurrentUser",id:id});
	};
	//获取当前时间
	adminIndexService.getTime = function(){
		return this.getData("TimeServlet", {method:"getCurrentTime"});
	};
	//获取当前用户
	adminIndexService.getCurrentUser = function(){
		return this.getData("UserServlet", {method:"getCurrentUser"});
	};
	
	return adminIndexService;
}]);

generalCourseModule.controller("adminIndexController",function($scope,adminIndexService){
	$scope.init = function(){
		adminIndexService.getCurrentUser().then(function(res){
			$scope.currentUser = res[0];
			$scope.getModulesByCurrentUser();
		});
		$scope.moduleShow = 0;//展开第一大模块
		$scope.leftShow = true;//左侧边栏展示
		$scope.getCurrentTime();
	};
	//获取当前用户
	$scope.getCurrentUser = function(){
		adminIndexService.getCurrentUser().then(function(res){
			$scope.currentUser = res;
		});
	};
	//根据当前用户获取左侧可用模块
	$scope.getModulesByCurrentUser = function(){
		adminIndexService.getModulesByCurrentUser($scope.currentUser.userId).then(function(res){
			$scope.modules = [];
			
			//装入json中方便前台操作
			var oneLevelIndex = 0;
			for(var i = 0;i < res.length;i++){
				if(res[i].upid == null || res[i].upid == ""){
					$scope.modules[oneLevelIndex] = {};
					$scope.modules[oneLevelIndex].oneLevel = res[i];
					var twoLevels = [];
					var twoLevelIndex = 0;
					for(var j = 0;j < res.length;j++){
						if(res[j].upid == res[i].moduleId){
							twoLevels[twoLevelIndex++] = res[j];
						}
					}
					$scope.modules[oneLevelIndex++].twoLevels = twoLevels;
				}
			}
		});
	};
	//每秒获取当前时间
	setInterval(function(){
		$scope.getCurrentTime();},1000);//1000Ϊ1����
	
	$scope.getCurrentTime = function(){
		adminIndexService.getTime().then(function(res){
			$scope.currentTime = res;
		});
	};
	//index：展开第几大模块
	$scope.open = function(index){
		//如果已展开则关闭
		if($scope.moduleShow == index){
			$scope.close();
		}
		else{
			$scope.moduleShow = index;
		}
	};
	
	$scope.close = function(){
		$scope.moduleShow = -1;
	};
	
	//是否展开左侧边栏
	$scope.leftControl = function(){
		$scope.leftShow = !$scope.leftShow;
		if($scope.leftShow){
			document.getElementById("right").setAttribute("style","left:190px");
		}
		else{
			document.getElementById("right").setAttribute("style","left:10px");
		}
	};
	
	$scope.top = function(){
		var iframe = document.getElementById("iframe");
		var src = iframe.contentDocument.URL;
		var index = src.indexOf("#");
		if(index != -1)
			src = src.substring(0,src.indexOf("#"));
		iframe.src = src + "#top";
	};
	
	$scope.init();
});

