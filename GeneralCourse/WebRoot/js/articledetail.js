/**
 * 
 */
(function(){

	//创建控制器
	indexApp.controller("articleDetail",function($scope,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		
		//获取栏目表数据
		$scope.methods.getDetailPageData = function(method,url,params){
				indexAppService.ajax(method,url,params).then(function(data){
					$scope.datas.articleDetail = data;
			});
		};
		

		
		//加载页面数据
		$scope.methods.getDetailPageData("POST","articleDetail",{"method":"articledetail",
			"params":{"articleId":articleId}});
		
	});
	
	
}())
