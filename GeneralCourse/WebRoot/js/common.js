	
	//创建一个全局对象保存方法
	var moduleFun={}
	
	//创建模块
	var indexApp = angular.module('indexApp',["ngTable"]);

	
	/**
	 *创建服务 
	 */
	indexApp.service("indexAppService",["$q","$http",function($q,$http){
		
	var indexApp = {};
		//请求后台函数
	indexApp.ajax=function(method,url,params){
		var defered = $q.defer();
		var promise = defered.promise;
				
			$http({
				  method:method,
				  url:url,
				  params:params
			}).success(function(data){
				    	defered.resolve(data);
				     }).error(function(error){
				    	defered.reject(error);
				    });
			return promise;    
		};
		return indexApp;
		
		
	}]);

	
	//创建服务
	indexApp.service("indexService",["$q","$http",function($q,$http){
		var indexService = {};
		indexService.getData = function(url,params){
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
		
		indexService.getPublishArticlesByColumnId = function(columnId){
			return indexService.getData("ArticleServlet", {method:"getPublishArticlesByColumnId",id:columnId});
		};
		
		indexService.getTeamers = function(){
			return indexService.getData("UserServlet",{method:"getTeamers"});
		};
		
		return indexService;
}]);

