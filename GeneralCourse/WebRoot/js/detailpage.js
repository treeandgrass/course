/**
 * 
 */
(function(){

	//创建控制器
	indexApp.controller("detailPage",function($scope,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		
		//获取栏目表数据
		$scope.methods.getDetailPageData = function(method,url,params){
				indexAppService.ajax(method,url,params).then(function(data){
					$scope.datas.detailPage = data;
			});
		};
		
		
		
//		//监听下载事件
//		$scope.methods.videoDownload=function(id){
//			indexAppService.ajax("POST","videodownload",{"method":"videoDownload",
//											"params":{"id":id}});
//		}
//		
		
		
		//加载页面数据
		$scope.methods.getDetailPageData("POST","detailPage",{"method":"detailPage",
			"params":{"id":videoId}});
		
	});
	
	
}())
