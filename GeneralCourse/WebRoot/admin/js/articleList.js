var generalCourseModule = angular.module("generalCourse",['720kb.datepicker','tm.pagination']);

generalCourseModule.factory("articleListService",["$q","$http",function($q,$http){
	var articleListService = {};
	articleListService.getData = function(url,params){
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
	
	articleListService.getArticle = function(params){
		return this.getData("ArticleServlet",{method:"getArticlesByParams",params:params});
	};
	
	articleListService.deleteArticle = function(articleId){
		return this.getData("ArticleServlet",{method:"deleteArticleById",id:articleId});
	};
	
	articleListService.getTwoLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getAllColumn"});
	};
	
	return articleListService;
}]);

generalCourseModule.controller("articleListController",function($scope,$filter,articleListService){
	$scope.init = function(){
		//计算当月第一天和最后一天
		var dateFormat = "yyyy-MM-dd";
		var firstAndLastDay = $scope.getFirstAndLastDayInMonth();
		$scope.selectPublishTimeStart = $filter('date')(firstAndLastDay.firstDate, dateFormat);
		$scope.selectPublishTimeEnd = $filter('date')(firstAndLastDay.lastDate, dateFormat);
		$scope.selectDeadLineStart = $filter('date')(firstAndLastDay.firstDate, dateFormat);
		$scope.selectDeadLineEnd = $filter('date')(firstAndLastDay.lastDate, dateFormat);
		
		$scope.selectColumns();
		$scope.selectArticles();
	};
	//获取栏目
	$scope.selectColumns = function(){
		articleListService.getTwoLevelColumns().then(function(res){
			$scope.columns = res;
		});
	};
	//查询文章
	$scope.selectArticles = function(){
		$scope.selectParams = {
				articleName:$scope.selectName,
				columnId:$scope.selectColumnId,
				selectPublishTimeStart:$scope.selectPublishTimeStart,
				selectPublishTimeEnd:$scope.selectPublishTimeEnd,
				selectScanCountStart:$scope.selectScanCountStart,
				selectScanCountEnd:$scope.selectScanCountEnd,
				selectAuthor:$scope.selectAuthor,
				selectStatus:$scope.selectStatus,
				selectDeadLineStart:$scope.selectDeadLineStart,
				selectDeadLineEnd:$scope.selectDeadLineEnd
		};
		
		articleListService.getArticle($scope.selectParams).then(function(res){
			$scope.articles = res;
			for(var i = 0;i < $scope.articles.length;i++){
				//标题过长处理
				if($scope.articles[i].title.length > 11)
					$scope.articles[i].title = $scope.articles[i].title.substring(0,11) + "…";
				//状态转换
				if($scope.articles[i].status == 0)
					$scope.articles[i].status = "草稿";
				else if($scope.articles[i].status == 1)
					$scope.articles[i].status = "审核中";
				else if($scope.articles[i].status == 2)
					$scope.articles[i].status = "未通过";
				else if($scope.articles[i].status == 3)
					$scope.articles[i].status = "已发表";
					
			}
			$scope.paginationConf.totalItems = res.length;
		});
	};
	
	$scope.deleteArticle = function(index){
		//是否删除
		if(confirm("是否确定删除？")){
			var articleId = $scope.articles[index].articleId;
			articleListService.deleteArticle(articleId).then(function(res){
				if(res[0].result == "1")
					$scope.selectArticles();
				else{
					alert("删除失败！"); 
				}
			});
		}
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