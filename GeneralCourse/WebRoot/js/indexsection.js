(function(){
	
	/**
	 * 创建页面控制器
	 */
	indexApp.controller("indexSection",function($scope,indexService){
		$scope.init = function(){
			//课程组成员分页初始化
			$scope.countPerPage = 6;
			$scope.totalPage = 0;
			$scope.teamersPage = 0;
			$scope.getTeamers();
			
			$scope.getIntroduction();
			$scope.getPublishArticles();
		};
		//获取已发表文章
		$scope.getPublishArticles = function(){
			indexService.getPublishArticlesByColumnId(13).then(function(res){
				$scope.articles = res;
			});
		}
		//获取简介
		$scope.getIntroduction = function(){
			indexService.getPublishArticlesByColumnId(8).then(function(res){
				//正则表达式，将所有标签全部删除
				res[0].content = res[0].content.replace(/[<][^<>]*[>]/g,"");
				//若内容太长则截取
				if(res[0].content.length > 239)
					res[0].content = "&nbsp;&nbsp;&nbsp;&nbsp;"+res[0].content.substring(0,239) + "…";
				document.getElementById("introduction").innerHTML = res[0].content;
			});
		}
		//获取课程组成员
		$scope.getTeamers = function(){
			indexService.getTeamers().then(function(res){
				$scope.teamers = res;
				for(var i = 0;i < $scope.teamers.length;i++){
					if($scope.teamers[i].url == null || $scope.teamers[i].url == "")
						$scope.teamers[i].url = "image/noImg.png";
				}
				//分页
				$scope.totalPage = Math.floor(res.length / $scope.countPerPage);
			});
		}
		//上一页
		$scope.previousPage = function(){
			$scope.teamersPage--;
			if($scope.teamersPage < 0)
				$scope.teamersPage = $scope.totalPage;
		};
		//下一页
		$scope.nextPage = function(){
			$scope.teamersPage++;
			if($scope.teamersPage > $scope.totalPage)
				$scope.teamersPage = 0;
		};
		
		//绑定到全局变量
			$scope.init();
		
	});

}())
