/**
 * 
 */
/**
 * 请求后台
 */
(function(){

	//创建控制器
	indexApp.controller("coursewareCourse",function($scope,NgTableParams,indexAppService){
		//保存数据和方法
		$scope.methods={},$scope.datas={};
		
		//请求系统设置去数据
		$scope.methods.coursewareFun=function(method,url,params){
			indexAppService.ajax(method,url,params).then(function(data){
				$scope.datas.courseware = new NgTableParams({count:3},{counts:[3,6,9],dataset:data});
			});
			
		}
		
		//调用执行
		$scope.methods.coursewareFun("POST","courseware",{"method":"courseware"});
		
	});

}())
