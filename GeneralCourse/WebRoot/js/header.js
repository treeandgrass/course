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
		
		//js实现页面跳转
		/*$scope.methods.skip=function(url,columnId){
			window.location.href="location?url="+url+"?columnId="+columnId;
		}*/
		
		
		moduleFun.headerLoad=function(){
			$scope.methods.getColumnData("POST","indexRequest",
					{"method":"getColumnData"});
		}
		
		moduleFun.headerLoad();
		
	});
	
}())
