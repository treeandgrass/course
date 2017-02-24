var generalCourseModule = angular.module("generalCourse",['720kb.datepicker']);

generalCourseModule.factory("articleEditService",["$q","$http",function($q,$http){
	var articleEditService = {};
	articleEditService.getData = function(url,params){
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
	
	articleEditService.getTwoLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getTwoLevelColumns"});
	};
	
	articleEditService.articleEdit = function(article){
		return this.getData("ArticleServlet",{method:"articleEdit",article:article});
	};
	
	articleEditService.getArticleById = function(id){
		return this.getData("ArticleServlet",{method:"getArticleById",articleId:id});
	};
	
	return articleEditService;
}]);

generalCourseModule.controller("articleEditController",function($scope,$filter,articleEditService){
	$scope.init = function(){
		$scope.getTwoLevelColumns();
		$scope.article = {
				title : "",
				columnId : "",
				deadLine : "",
				content:""
		};
		//富文本插件
		var ue = UE.getEditor('editor');
		ue.addListener("ready",function(){
			$scope.getArticleById();
		});
	};
	//根据id获取文章
	$scope.getArticleById = function(){
		articleEditService.getArticleById(articleId).then(function(res){
			$scope.article = res[0];
			UE.getEditor('editor').setContent($scope.article.content);
		});
	};
	//获取二级栏目
	$scope.getTwoLevelColumns = function(){
		articleEditService.getTwoLevelColumns().then(function(res){
			$scope.columns = res;
		});
	};
	//修改
	$scope.articleEdit = function(){
		$scope.article.content = UE.getEditor('editor').getContent();
		articleEditService.articleEdit($scope.article).then(function(res){
			$scope.result = res[0];
		});
	};
	
	$scope.init();
});