/**
 * 
 */
/**
 * 模块
 */
(function(){
	
	//创建控制器
	indexApp.controller("courseIntroduce",function($scope,indexAppService){
		
		
		//创建method和data对象，绑定在全局变量上
		$scope.datas={},$scope.methods={};
		
		
		//导航栏监听点击事件	
		$scope.methods.getLeftIndexData = function(method,url,params){
			indexAppService.ajax(method,url,params).then(function(data){
				$scope.datas.leftIndexData = data;
				$scope.datas.introduceData=data;
				$scope.methods.operationIframe(data[0].url,data[0].columnId);
			
			});
		};	
		
		
		
		//获取副标题
		$scope.methods.getLeftIndexTitle = function(method,url,params){
			indexAppService.ajax(method,url,params).then(function(data){
				$scope.datas.title=data;
				$scope.datas.introduceData=data;
			});
		};
		
		
		
		//加载介绍栏数据
		$scope.methods.getIntroduceData = function(method,url,params){
			indexAppService.ajax(method,url,params).then(function(data){
				$scope.datas.introduceData = data;
			});
		};
		
		
		//js 操作iframe里面的内容
		$scope.methods.operationIframe=function(url,columnId){
			var myIframe=document.getElementById("oneframe");
			myIframe.src="reception/local/"+url;
			myIframe.name=columnId;
			
		}
		
		
		//副导航栏点击事件
		$scope.methods.listenLeftIndex = function(columnId,url){
			//加载介绍栏数据
			$scope.methods.getIntroduceData("POST","indexRequest",
											   {"method":"leftIndexTitle",
											   "params":{"columnId":columnId}
											   });
			//切换展示区
			$scope.methods.operationIframe(url,columnId);
		}
		
		/**
		 * 将数据绑定到全局变量上
		 */
		moduleFun.indexSectionLoad=function(){
			
			//副导航栏标题加载
			$scope.methods.getLeftIndexTitle("POST","indexRequest",
												{"method":"leftIndexTitle",
												"params":{"columnId":indexcolumnId}
												});
			
			//副导航栏数据加载
			$scope.methods.getLeftIndexData("POST","indexRequest",
												{"method":"getLeftData",
												 "params":{"columnId":indexcolumnId}
												});
			
		}
		
		/*//页面加载完成后调用
		window.onload=function(){
			moduleFun.indexSectionLoad();
		}*/
		//加载数据
		moduleFun.indexSectionLoad();

	});
	
}())