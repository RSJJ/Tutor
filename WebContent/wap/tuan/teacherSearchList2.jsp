<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.tutor.entity.Teacher,java.util.*"%>
 <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
 <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>老师列表</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->
    <link rel="stylesheet" href="dist/css/teacherList.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <link href="../template/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

	<script type="text/javascript">
    var collumn = [
    	{
    		"grand":"小学",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":"showTeacherInfByCourseId?courseId=NOR_00000005"},{"name":"外语","url":""}]
    	},
    	{
    		"grand":"初中",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":""},{"name":"外语","url":""},{"name":"物理","url":""},{"name":"化学","url":""},{"name":"生物","url":""},{"name":"政治","url":""},{"name":"地理","url":""},{"name":"奥数","url":""}]
    	},
    	{
    		"grand":"高中",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":""},{"name":"外语","url":""},{"name":"物理","url":""},{"name":"化学","url":""},{"name":"生物","url":""},{"name":"政治","url":""},{"name":"地理","url":""},{"name":"奥数","url":""}]
    	},
    	{
    		"grand":"大学",
    		"course":[{"name":"高数","url":""},{"name":"大物","url":""},{"name":"思政","url":""}]
    	},
    	{
    		"grand":"小升初",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":""},{"name":"外语","url":""}]
    	},
    	{
    		"grand":"中考",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":""},{"name":"外语","url":""},{"name":"物理","url":""},{"name":"化学","url":""},{"name":"生物","url":""},{"name":"政治","url":""},{"name":"地理","url":""},{"name":"理综","url":""},{"name":"文综","url":""}]
       	},
    	{
    		"grand":"高考",
    		"course":[{"name":"语文","url":""},{"name":"数学","url":""},{"name":"外语","url":""},{"name":"物理","url":""},{"name":"化学","url":""},{"name":"生物","url":""},{"name":"政治","url":""},{"name":"地理","url":""},{"name":"理综","url":""},{"name":"文综","url":""}]
       	}
    ]
    </script>
  </head>
  <body>
	<div data-role="page" id="pageone">
	  	<div data-role="header">
		  <a href="#" data-role="button" data-icon="back" onclick="javascript:window.history.go(-1)">返回</a>
		  <div class="searchArea">
		  	<input type="search" placeholder="Search">
		  </div>
		  <a href="#" data-role="button" data-icon="grid" >地图</a>
		  <div data-role="navbar" data-iconpos="left" class="segmented-control">
		      <ul>
		        <li><a class="control-item active"  data-icon="plus"  href="#item1">课程类型</a></li>
		        <li><a class="control-item " data-icon="minus" href="#item2">智能排序</a></li>
		        
		      </ul>
		   </div>
		</div>
		<div data-role="content" id="content">
		    <!--搜索条件-->
		      	<div class="segmented-show">
		      		<div id="item1" class="control-content">
				      		<div class="leftside">
					       		<ul class="table-view" id="left"></ul>
					      	</div>
					      	<div class="rightside" >
					          <ul id="right">
						      </ul>
					      	</div>
			      	</div>
			      	<div id="item2"  class="control-content">
				      <ul class="table-view" id="right">
				      		<li class="table-view-cell"><a class="navigate-right" href="teachermap.html" data-transition="slide-in">按价格排序</a></li>
				      		<li class="table-view-cell"><a class="navigate-right" href="teachermap.html" data-transition="slide-in">按距离排序</a></li>
				      		<li class="table-view-cell"><a class="navigate-right" href="teachermap.html" data-transition="slide-in">按人气排序</a></li>
				      </ul>
			      	</div>
			      	<div id="item3"  class="control-content">
				      		<ul class="table-view">
								  <li class="table-view-cell">
								    Item 1
								    <div class="toggle">
								      <div class="toggle-handle"></div>
								    </div>
								  </li>
								  <li class="table-view-cell">
								    Item 2
								    <div class="toggle active">
								      <div class="toggle-handle"></div>
								    </div>
								  </li>
								  <li class="table-view-cell">
								    Item 3
								    <div class="toggle">
								      <div class="toggle-handle"></div>
								    </div>
								  </li>
							</ul>
			      	</div>
		      	</div>
		    <!--搜索结果-->
				<div id="teacherInfo">
					<ul data-role="listview">
					  <li class="teali">
					    <a href="#" class="teahref">
					    <img src="../template\images\good\ID2/1.jpg">
					    <h2 class="teaname">Google Chrome</h2>
					    <p class="teaschool">北京交通大学&nbsp;&nbsp;&nbsp;&nbsp;控制科学与工程</p>
					    <p class="teaintro">Google Chrome 免费的开源 web 浏览器。发布于 2008 年。Google Chrome 免费的开源 web 浏览器。发布于 2008 年。Google Chrome 免费的开源 web 浏览器。发布于 2008 年。Google Chrome 免费的开源 web 浏览器。发布于 2008 年。</p>
					    </a>
					    <div class="li-btn"> 
					    	<div class="l">
					    		<p>
						    		<span>独立老师</span>
						    		<span>1个认证</span>
					    		</p>
					    		
					    	</div>
					    	<!--  
					    	<div class="r">
					    		<p>距离：<span class="teapos">3.3km</span></p>
					    	</div>
					    	-->
					    </div>
					  </li>

					</ul>
				</div>
	</div>
	<div data-role="footer" id="footer">
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="#pagetwo" data-role="button">首页</a></li>
		        <li> <a href="#pagetwo" data-role="button">立即预约</a></li>
		        <li> <a href="#pagetwo" data-role="button">立即预约</a></li>
		      </ul>
	      </div>
	    </div>
	 
</div>
<script type="text/javascript">
	$(".segmented-control a").click(function(){
		var href = $(this).attr("href");
		$(href).siblings().hide();
		if($(href).is(":hidden")) $(href).show();
		else $(href).hide();
		
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
	})
	$("#choseClass").click(function(){
		$("#allClass").show();
	})
	$("#filter").click(function(){
		$("#allClass").show();
	})

</script>
    <!-- Popover -->
    
  </body>
</html>
    <script type="text/javascript">
    function showcourse(i){
    	$()
    	$("#right").empty();
    	var mode;
    	if(i>=0&i<=2) mode='k12';
    	else  mode='s12'
    	for (var j=0 ; j <= collumn[i].course.length - 1; j++) {
    		var url = 'teacherSearchList.html?mode='+mode+'&courseGrade='+collumn[i].grand+'&courseName='+collumn[i].course[j].name;
    		var temp = '<li class="table-view-cell"><a class="navigate-right grand ui-link" data-ajax="false" href="'+url+'" data-transition="slide-in">'+collumn[i].course[j].name+'</a></li>'
    		$("#right").append(temp);
    	}
    }    

   function eachAllTeacherInf(data){ 
   		var templi = $("#teacherInfo .teali").clone();
   		$("#teacherInfo .teali").hide();
   		$.each(data,function(i,content){ 
   			templi.find(".teaname").html(data[i].name);
   			templi.find(".teaschool").html(data[i].school+"&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].profession);
   			templi.find(".teaintro").html(data[i].introduction);
   			templi.find(".teahref").css('href','teacherInf.jsp?teacherId='+data[i].teacherId)
   			$("#teacherInfo ul").append(templi);
   		})
   }

    function showTeacherInfList(){
    	var url = 'showTeacherInfByCourseName'+location.search;
		$.ajax({ 
            url:url,
            type:"GET",
            dataType:"json",
            success:function(data){
                console.log(data);
                eachAllTeacherInf(data);
                
            	//return _this._callback(callback,data.isSuccess,data.message,data)
            },
            error:function(data){ 
                console.log(data);
                //return _this._callback(callback,false,"连接服务器失败，请稍后再试",data);
            }
        })
    }
    $(document).ready(function(){
    		showTeacherInfList()
    		for (var i=0 ; i <= collumn.length - 1; i++) {
    			var leftside = i==0?'<li class="table-view-cell activee"><a class="navigate-right grand" data-transition="slide-in" id="test" data-grandid = "'+i+'">'+collumn[i].grand+'</a></li>':'<li class="table-view-cell"><a class="navigate-right grand" data-transition="slide-in" id="test" data-grandid = "'+i+'">'+collumn[i].grand+'</a></li>';
    			$("#left").append(leftside);
    		};
    		$(".grand").click(function(){
    			var i = $(this).data("grandid")
    			$(this).parent().addClass("activee").addClass("ui-link")
    			$(this).parent().siblings().removeClass("activee").removeClass("ui-link")
    			showcourse(i)
    		})
    })
    </script>