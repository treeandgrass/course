/**
 * 模块
 */
(function(){
	
	//创建控制器
	indexApp.controller("headerController",function($scope,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		
		//获取栏目表数据
		$scope.methods.getColumnData = function(method,url,params){
				indexAppService.ajax(method,url,params).then(function(data){
					$scope.datas.columnData = data;
			});
		};
	
	});
	
}())