<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>老师地图</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->

    <link rel="stylesheet" href="dist/css/ratchet.min.css">
    <link rel="stylesheet" href="dist/css/ratchet-theme-ios.min.css">
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" /> 
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
    <script src="dist/js/ratchet.min.js"></script>
    <script src="dist/js/sliders.js"></script>
    <script src="dist/js/push.js"></script>
    <script src="dist/js/modals.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=r6bfCVxPZTpoKGGNthyuupYh"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	<script src="dist/js/mapcontrol.js"></script> 
    <style type="text/css">
      .map{
      	width: 100%;
      	height: 100%;
      }
      .overlay{
        display:block;
      	position:absolute;
      	top:0;
      	left:0;
      	width:100%;
      	height:100%;
      	background:rgba(211, 236, 233,0.7);
      	z-index:1000;
      }
      .infowindow{
      	position:absolute;
      	bottom:0;
      	left:0;
      	width:100%;
      	height:85px;
      	padding:8px;
      	z-index:1001;
      }
    </style>


  </head>
  <body>
    <header class="bar bar-nav">
      <button class="btn btn-link btn-nav pull-left" onclick="javascript:window.history.go(-1)">
        <span class="icon icon-left-nav"></span>
      </button>
      <span class="title">筛选老师</span>
      <a class="btn btn-link btn-nav pull-right" href="teacherSearchList.jsp">
        <span class="icon icon-list"></span>
		列表
      </a>
    </header>


	<nav class="bar bar-standard  bar-header-secondary">
	  <div class="segmented-control" >
	    <a class="control-item active">范围</a>
	    	
	    <a class="control-item">价格</a>
	  </div>
	</nav>

    <div class="content">
      <div class="wrap">
      	 <div id="r-map" class="map"></div>
      	 
      </div>
      
    </div>
    
	<a class="overlay">
	
	</a>
    <div class="infowindow">
    	<div class="content">
			  <div class="table-view-cell media">
			    <a class="navigate-right">
			      <img class="media-object pull-left" src="http://placehold.it/42x42">
			      <div class="media-body">
			        	杨老师
			        <p>北京交通大学           软件工程</p>
			        <p>勤能补拙，文韬武略</p>
			      </div>
			    </a>
			  </div>
      	 </div>
      </div>
  </body>
</html>

<script>
	var position_option = {
	
	        enableHighAccuracy: true,
	
	        maximumAge: 30000,
	
	        timeout: 20000
	
	    };
	//window.addEventListener('push', myFunction);
	function getLocation(){
	    if (window.navigator.geolocation){
		    window.navigator.geolocation.getCurrentPosition(getPositionSuccess, getPositionError, position_option)
	        //window.navigator.geolocation.watchPosition(getPositionSuccess,getPositionError,position_option);
	   //获取不稳定，可以设置超时时间
	    }else{
	        alert("Geolocation is not supported by this browser.");
	    }
	}
	
	function getPositionSuccess( position ){
	        var lat = position.coords.latitude;
	        var lng = position.coords.longitude;
	        var point = new BMap.Point(lng, lat);
	        map.centerAndZoom(point, 15);  // 初始化地图,设置中心点坐标和地图级别
		  	BMap.Convertor.translate(point,0,translateCallback);     //真实经纬度转成百度坐标
	       // alert( "您所在的位置： 纬度" + lat + "，经度" + lng );
	        if(typeof position.address !== "undefined"){
	                var country = position.address.country;
	                var province = position.address.region;
	                var city = position.address.city;
	                //alert(' 您位于 ' + country + province + '省' + city +'市');
	        }
	}        
	
	//坐标转换完之后的回调函数
	function translateCallback(point1){
	    var marker1 = new BMap.Marker(point1);
	    map.addOverlay(marker1);
	    var label = new BMap.Label("您的位置",{offset:new BMap.Size(20,-10)});
	    marker1.setLabel(label); //添加百度label
	    map.setCenter(point1);
	}
	
	function getPositionError(error) {
	    switch (error.code) {
	        case error.TIMEOUT:
	            alert("连接超时，请重试")
	            break;
	        case error.PERMISSION_DENIED:
	            alert("您拒绝了使用位置共享服务，查询已取消");
	            break;
	        case error.POSITION_UNAVAILABLE:
	            alert("获取位置信息失败");
	            break;
	    }
	}
	
	$(document).ready(function(){
		$(".map").height(document.documentElement.clientHeight);
		initalMap();
		getLocation();
		$(".overlay").on("click",function(){$(this).hide()})
	})

</script> 