var generalCourseModule = angular.module("generalCourse",['720kb.datepicker']);

generalCourseModule.factory("articleAddService",["$q","$http",function($q,$http){
	var articleAddService = {};
	articleAddService.getData = function(url,params){
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
	articleAddService.getTwoLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getTwoLevelColumns"});
	};
	articleAddService.articleAdd = function(article){
		return this.getData("ArticleServlet",{method:"articleAdd",article:article});
	};
	
	return articleAddService;
}]);

generalCourseModule.controller("articleAddController",function($scope,$filter,articleAddService){
	$scope.init = function(){
		//富文本插件
		var ue = UE.getEditor('editor');
		$scope.article = {
				articleName : "",
				columnId : "",
				deadLine : "",
				content:""
		};
		$scope.getTwoLevelColumns();
	};
	//获取二级栏目
	$scope.getTwoLevelColumns = function(){
		articleAddService.getTwoLevelColumns().then(function(res){
			$scope.columns = res;
			$scope.article.columnId = res[0].columnId;
		});
	};
	//增
	$scope.articleAdd = function(){
		$scope.article.content = UE.getEditor('editor').getContent();
		articleAddService.articleAdd($scope.article).then(function(res){
			$scope.result = res[0];
			if(res[0].success == 1){
				window.location.href="admin/ArticleList";
			}
		});
	};
	
	$scope.init();
});