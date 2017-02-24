/**
 * 
 */
(function(){
	
	//创建控制器
	indexApp.controller("contentController",function($scope,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		//右边栏显示数据
		$scope.methods.getRightContent=function(method,url,params){
			indexAppService.ajax(method,url,params).then(function(data){
				$scope.datas.content=data;
			});
		};
		
		var leftIndexColumnId = parseInt(parent.document.getElementById("oneframe").name);
		//请求课程介绍
		$scope.methods.getRightContent("POST","articleContent",
											{"method":"articleContent",
											"params":{"columnId":leftIndexColumnId}
											});
		
	
	});
	
	
}())