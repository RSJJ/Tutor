<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>老师地图</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->

    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet.min.css">
    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet-theme-ios.min.css">
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" /> 
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
    <script src="<%=basePath %>wap/tuan/dist/js/ratchet.min.js"></script>
    <script src="<%=basePath %>wap/tuan/dist/js/sliders.js"></script>
    <script src="<%=basePath %>wap/tuan/dist/js/push.js"></script>
    <script src="<%=basePath %>wap/tuan/dist/js/modals.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=r6bfCVxPZTpoKGGNthyuupYh"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	<script src="<%=basePath %>wap/tuan/dist/js/mapcontrol.js"></script> 
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
      	height:110px;
      	padding:8px;
      	z-index:1001;
      }
      .media-object{
      	width:17% !important;
      	display:inline-block;
      }
       .media-object img{
      	width:100%;
      }
       .media-body{
        display:inline-block;
        margin-left:8px;	
      	height:84px;
      	width:70%;
      	overflow:hidden;
      	text-overflow: ellipsis;
      }
       .media-body p{
       
      	text-overflow: ellipsis;
      }
    </style>


  </head>
  <body>


    <div class="content">
        <header class="bar bar-nav">
	      <button class="btn btn-link btn-nav pull-left" onclick="javascript:window.history.go(-1)">
	        <span class="icon icon-left-nav"></span>
	      </button>
	      <span class="title">筛选老师</span>
	      <a class="btn btn-link btn-nav pull-right" id="maphref" href="#">
	        <span class="icon icon-list"></span>
			列表
	      </a>
	    </header>
	
	<!--
		<nav class="bar bar-standard  bar-header-secondary">
		  <div class="segmented-control" >
		    <a class="control-item active">范围</a>
		    	
		    <a class="control-item">价格</a>
		  </div>
		</nav>  -->
      <div class="wrap">
      	 <div id="r-map" class="map"></div>
      	 
      </div>
      
    </div>
    
	<a class="overlay" style="display:none"></a>
    <div class="infowindow" style="display:none">
    	<div class="content">
			  <div class="table-view-cell media">
			    <a class="navigate-right">
			      <div class="media-object pull-left"><img src=""></div>
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
		   // window.navigator.geolocation.getCurrentPosition(getPositionSuccess, getPositionError, position_option)
	        window.navigator.geolocation.watchPosition(getPositionSuccess,getPositionError,position_option);
	   //获取不稳定，可以设置超时时间
	    }else{
	        alert("Geolocation is not supported by this browser.");
	    }
	}
	
	function getPositionSuccess( position ){
	        var lat = position.coords.latitude;
	        var lng = position.coords.longitude;
	        var point = new BMap.Point(lng, lat);
	        map.centerAndZoom(point, 13);  // 初始化地图,设置中心点坐标和地图级别
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
	
	function setInfWindow(data){//设置信息窗口内容
		var basepath = '<%=basePath%>';
		var src = basepath + data.icon;
		$(".infowindow img").attr('src',src)
		$(".infowindow .media-body").html(data.name+"<p>"+data.school+"&nbsp;&nbsp;&nbsp;&nbsp;"+data.profession+"</p>"+"<p>"+data.introduction+"</p>")
	}
	function showTeacherSingleInf(CsAllData){
		
           var  point = new window.BMap.Point(CsAllData.lng,CsAllData.lat); //循环生成新的地图点
           var  marker = new window.BMap.Marker(point); //按照地图点坐标生成标记
        
            map.addOverlay(marker);
          
            //添加点击事件
            marker.addEventListener("click", 
                function(){
                        map.centerAndZoom(point, 13);
                        setInfWindow(CsAllData);
                        $(".infowindow").show();
                }                          
            );
	}
	function showTeacherListInf(CsAllData){
		var point=[];
		var marker=[];
		var info=[];
		var searchInfoWindow=[];
		$.each(CsAllData, function(i, content){
			if(content!="none"){
            point[i] = new window.BMap.Point(CsAllData[i].lng,CsAllData[i].lat); //循环生成新的地图点
            marker[i] = new window.BMap.Marker(point[i]); //按照地图点坐标生成标记
            //marker[i].disableMassClear();
           // var srcpic1=CsAllData[i].srcpic;
           // var myIcon_charger = new BMap.Icon(srcpic1, new BMap.Size(35, 48), {//是引用图标的名字以及大小，注意大小要一样
           //                 anchor: new BMap.Size(35, 48)});//这句表示图片相对于所加的点的位置;
           // marker[i] = new BMap.Marker(point[i],{icon:myIcon_charger});  // 创建标注
            //添加标注
            map.addOverlay(marker[i]);
            //  marker[i].setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            // 创建信息窗口对象
            <%-- info[i] =  '<img src="<%=basePath%>'+CsAllData[i].icon+'" alt="" style="float:right;zoom:1;overflow:hidden;width:80px;height:80px;margin-left:3px;"/>'+
                        '</br>学校： '+CsAllData[i].school+
                        '</br>专业： '+CsAllData[i].profession+
                        '</br>地址： '+CsAllData[i].address+
                        '<p style="margin-top:10px"><a class="btn btn-success btn-sm" onclick="showcsintro('+i+')">详情</a>'
                       // '<a class="btn btn-success btn-sm" onclick="javascript:drive('+i+')">导航</a><a class="btn btn-default btn-sm orderUnuse" disabled="ture"  alt="此功能正在开发中，敬请期待！">预约</a></p>';
                       // '<a class="btn btn-success btn-sm" onclick="javascript:drive('+i+')">导航</a><a class="btn btn-success btn-sm" onclick="dealOrder('+i+')">预约</a></p>';
           
           //创建百度样式检索信息窗口对象                       
            searchInfoWindow[i] = new BMapLib.SearchInfoWindow(map, info[i], {
                    title  : CsAllData[i].name,      //标题
                    width  : 290,             //宽度
                    height : 200,              //高度
                    panel  : "panel",         //检索结果面板
                    enableAutoPan : true,     //自动平移
                    searchTypes   :[
                      //  BMAPLIB_TAB_SEARCH,   //周边检索
                      //  BMAPLIB_TAB_TO_HERE,  //到这里去
                       // BMAPLIB_TAB_FROM_HERE //从这里出发
                    ]
                }); --%>
            //添加点击事件
            marker[i].addEventListener("click", 
                (function(k){
                    // js 闭包
                    return function(){
                        //将被点击marker置为中心
                        map.centerAndZoom(point[k], 13);
                        setInfWindow(CsAllData[k]);
                        $(".infowindow").show();
                        //在marker上打开检索信息窗口
                        //searchInfoWindow[k].open(marker[k]);
                    }
                })(i)                            
            );
        }
		});
	}
	
	function showTeacherPosition(){
		    var url = "jumpToTeacherMap"+location.search;
	        $.ajax({ 
	            url:url,
	            type:"GET",
	            dataType:"json",
	            success:function(data){
	                console.log(data);
	                var mode = '<%=request.getParameter("mode") %>';
	                if(mode=='cou'||mode=='k12'||mode=='s12')
	                	showTeacherListInf(data);
	                else if(mode=='tea')
	                	showTeacherSingleInf(data);
	            	//return _this._callback(callback,data.isSuccess,data.message,data)
	            },
	            error:function(data){ 
	                //console.log(data);
	                //return _this._callback(callback,false,"连接服务器失败，请稍后再试",data);
	            }
	        })
	}
	$(document).ready(function(){
		$(".map").height(document.documentElement.clientHeight);
		$("#maphref").attr("href","teacherSearchList.html"+location.search);
		initalMap();
		getLocation();
		showTeacherPosition();
		$(".overlay").on("click",function(){$(this).hide()})
	})

</script> 