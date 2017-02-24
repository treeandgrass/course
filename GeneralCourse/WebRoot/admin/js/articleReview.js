var generalCourseModule = angular.module("generalCourse",[]);

generalCourseModule.factory("articleReviewService",["$q","$http",function($q,$http){
	var articleReviewService = {};
	articleReviewService.getData = function(url,params){
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
	//根据id获取文章
	articleReviewService.getArticleById = function(id){
		return this.getData("ArticleServlet",{method:"getArticleById",articleId:id});
	};
	//审核文章
	articleReviewService.articleReview = function(articleId,status){
		return this.getData("ArticleServlet",{method:"review",id:articleId,status:status});
	};
	
	return articleReviewService;
}]);

generalCourseModule.controller("articleReviewController",function($scope,$filter,articleReviewService){
	$scope.init = function(){
		$scope.article = {
				title : "",
				columnId : "",
				deadLine : "",
				content:""
		};
		$scope.getArticleById();
	};
	//根据id获取文章
	$scope.getArticleById = function(){
		articleReviewService.getArticleById(articleId).then(function(res){
			$scope.article = res[0];
			document.getElementById("content").innerHTML = $scope.article.content;
			if(res.deadLine == null)
				$scope.article.deadLine = "无";
		});
	};
	//审核文章
	$scope.articleReview = function(status){
		articleReviewService.articleReview(articleId,status).then(function(res){
			if(res[0].success == 1){
				window.location.href="admin/ArticleReviewList";
			}
		});
	};
	
	$scope.init();
});