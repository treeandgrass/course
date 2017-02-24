(function(){
	//创建模块
	var loginApp = angular.module('loginApp',[]);

	
	/**
	 *创建服务 
	 */
	loginApp.service("loginAppAppService",["$q","$http",function($q,$http){
		
		var loginApp = {};
			//请求后台函数
		loginApp.ajax=function(method,url,params){
			var defered = $q.defer();
			var promise = defered.promise;
					
				$http({
					  method:method,
					  url:url,
					  params:params
				}).success(function(data){
					    	defered.resolve(data);
					     }).error(function(error){
					    	defered.reject(error);
					    });
				return promise;    
			};
			return loginApp;
			
		
	}]);
	
	
	/**
	 * 控制器
	 */
	
	loginApp.controller("loginController",function($scope,loginAppAppService){
		
		//在$scope上创建两个对象
		$scope.methods={};
		$scope.datas={};
		
		//初始化函数
		var init = function(){
			$scope.datas.username="";
			$scope.datas.password="";
			$scope.datas.validecode="";
		}
		
		//执行初始化函数
		init();
		
		
		
		//点击切换验证码
		$scope.methods.changeImg=function(){
			var img =document.getElementById("img");
			var arr = img.src.split('=');
			var count = parseInt(arr[arr.length-1])%100000+1;
			img.src="imageValide?id="+count;
		}
		
		
		/*//验证密码登陆项是否正确
		$scope.methods.login=function(){
			loginAppAppService.ajax("POST","login",$scope.datas).then(function(data){
				console.log(data);
			});
		}		*/	
		
	});

}())
	