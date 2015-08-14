<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>课程查询</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->
  <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet.min.css">
    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet-theme-ios.min.css">
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
    <script src="<%=basePath %>wap/tuan/dist/js/ratchet.min.js"></script>
    <script src="<%=basePath %>wap/tuan/dist/js/sliders.js"></script>
    
    <style type="text/css">
      .leftside{
        width: 35%;
        height: 100%;
      }
      .leftside li{
      	border-right: 1px solid grey;

      }
      .rightside{
      	padding-left:8px;
        position: absolute;
        top: 0px;
        left:35%;
        width: 60%;
        height: 100%;
      }
      .activee{
      	background: #428bca;
      }
    </style>
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
    <header class="bar bar-nav">
      <button class="btn btn-link btn-nav pull-left"  onclick="javascript:window.history.go(-1)">
        <span class="icon icon-left-nav"></span>
      </button>
      <span class="title">选择课程</span>
    </header>
    <div class="content">
      <div class="wrap">
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
    </div>
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