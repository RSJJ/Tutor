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
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->

  </head>
  <body>
  <div>
  	
    <link rel="stylesheet" href="<%=path %>/wap/tuan/dist/css/ratchet.min.css">
    <link rel="stylesheet" href="<%=path %>/wap/tuan/dist/css/ratchet-theme-ios.min.css">
    <link rel="stylesheet" href="<%=path %>/wap/tuan/dist/css/teacherList.css">
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
    <script src="<%=path %>/wap/tuan/dist/js/ratchet.min.js"></script>
    <script src="<%=path %>/wap/tuan/dist/js/sliders.js"></script>

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
  </div>
    <header class="bar bar-nav">
      <button class="btn btn-link btn-nav pull-left"  onclick="javascript:window.history.go(-1)">
        <span class="icon icon-left-nav"></span>
      </button>
      <a class="btn pull-right" herf="jumpToTeacherMap?courseId=<s:property value="courseId"/>">
	    	地图
	  </a>
	  <div class="searchArea">
	  	<input type="search" placeholder="Search">
	  	<button class="btn">
		  <span class="icon icon-search"></span>
		</button>
	  </div>
      
    </header>
	 
    <div class="content">
    	<div class="wrap">
    	<!--搜索条件-->
    	<div class="segmented-control">
		    <a class="control-item active" href="#item1">课程类型<span class="icon icon-caret"></span></a>
		    <a class="control-item" href="#item2">智能排序<span class="icon icon-caret"></span></a>
		    <a class="control-item" href="#item3">筛选<span class="icon icon-caret"></span></a>
		</div>
      	<div class="segmented-show">
      		<div id="item1" class="control-content">
		      		<div class="leftside">
			       		<ul class="table-view" id="left"></ul>
			      	</div>
			      	<div class="rightside" >
			          <ul class="table-view" id="right">
			          	<li class="table-view-cell"><a class="navigate-right" href="" data-transition="slide-in"><span class="badge">5</span>语文</a></li>
	          		<li class="table-view-cell"><a class="navigate-right" href="showTeacherInfByCourseId?courseId=NOR_00000005" data-transition="slide-in"><span class="badge">5</span>数学</a></li>
	          		<li class="table-view-cell"><a class="navigate-right" href="" data-transition="slide-in"><span class="badge">5</span>外语</a></li>
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
      	</div>
      	<!--搜索条件-->
      	<div id="teacherInfo">
			<ul class="table-view">
				<s:iterator  value="#request.teacherList">
				  <li class="table-view-cell media">
				    <a class="navigate-right" href = "teacherInf.jsp?teacherId=<s:property value="teacherId"/>">
				      <img class="media-object pull-left" src="<%=basePath %><s:property value="icon"/>">
				      <div class="media-body">
				         <s:property value="name"/>
						 <p><s:property value="school"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="school"/></p>
						 <p><s:property value="introduction"/></p>
				      </div>
				    </a>
				  </li>
				</s:iterator>
			</ul>
		</div>
    
</div>
<script type="text/javascript">
	$(".segmented-control .control-item").click(function(){
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
    	$("#right").empty();
    	for (var j=0 ; j <= collumn[i].course.length - 1; j++) {
    		var temp = '<li class="table-view-cell"><a class="navigate-right" href="'+collumn[i].course[j].url+'" data-transition="slide-in"><span class="badge">5</span>'+collumn[i].course[j].name+'</a></li>'
    		$("#right").append(temp);
    	}
    }    
    $(document).ready(function(){
    		for (var i=0 ; i <= collumn.length - 1; i++) {
    			var leftside = i==0?'<li class="table-view-cell activee"><a class="navigate-right grand" data-transition="slide-in" id="test" data-grandid = "'+i+'">'+collumn[i].grand+'</a></li>':'<li class="table-view-cell"><a class="navigate-right grand" data-transition="slide-in" id="test" data-grandid = "'+i+'">'+collumn[i].grand+'</a></li>';
    			$("#left").append(leftside);
    		};
    		$(".grand").click(function(){
    			var i = $(this).data("grandid")
    			$(this).parent().addClass("activee")
    			$(this).parent().siblings().removeClass("activee")
    			showcourse(i)
    		})
    })
    
    
    </script>