var generalCourseModule = angular.module("generalCourse",['720kb.datepicker','tm.pagination']);

generalCourseModule.factory("articleReviewListService",["$q","$http",function($q,$http){
	var articleReviewListService = {};
	articleReviewListService.getData = function(url,params){
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
	//查询文章
	articleReviewListService.getArticle = function(params){
		return this.getData("ArticleServlet",{method:"getArticlesByParams",params:params});
	};
	//获取二级栏目
	articleReviewListService.getTwoLevelColumns = function(){
		return this.getData("ColumnServlet",{method:"getAllColumn"});
	};
	
	return articleReviewListService;
}]);

generalCourseModule.controller("articleReviewListController",function($scope,$filter,articleReviewListService){
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
		articleReviewListService.getTwoLevelColumns().then(function(res){
			$scope.columns = res;
		});
	};

	//查询文章
	$scope.selectArticles = function(){
		$scope.selectParams = {
				articleName:$scope.selectName,
				columnId:$scope.selectColumnId,
				selectScanCountStart:$scope.selectScanCountStart,
				selectScanCountEnd:$scope.selectScanCountEnd,
				selectAuthor:$scope.selectAuthor,
				selectStatus:1,//只查询待审核的文章
				selectDeadLineStart:$scope.selectDeadLineStart,
				selectDeadLineEnd:$scope.selectDeadLineEnd
		};
		
		articleReviewListService.getArticle($scope.selectParams).then(function(res){
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
					$scope.articles[i].status = "审核通过";
				else if($scope.articles[i].status == 3)
					$scope.articles[i].status = "未通过";
					
			}
			$scope.paginationConf.totalItems = res.length;
		});
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