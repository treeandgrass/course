/**
 * 
 */
(function(){
	
	//创建控制器
	indexApp.controller("courseDynamic",function($scope,NgTableParams,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		
		//获取栏目表数据
		$scope.methods.getCourseDynamic = function(method,url,params){
				indexAppService.ajax(method,url,params).then(function(data){
					
					//实现分页
					$scope.datas.tableParams = new NgTableParams({ count: 5}, 
													{ counts: [5, 10, 25], dataset: data});
			});
		};
		
		
		//调用方法获取数据
		$scope.methods.getCourseDynamic("POST","courseDynamic",{"method":"courseDynamic"});
		
	
	});
	
}())
