<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>选择课程</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <style type="text/css">
     * {
		font-family: "Microsoft YaHei" ! important;
		padding:0px;
		margin:0px;
		}
		a{ text-decoration:none; } 
     #content{ 
     	position: absolute;
		z-index: 1;
		top: 46px;
		bottom: 41px;
		left: 0;
		width: 100%;
		background: #555;
		overflow: auto;
		padding: 0px;
     }
	#footer {
		position:absolute;
		bottom:0; 
		left:0;
		width:100%;
		padding:0;
	}

		.leftside{
        width: 35%;
        height: 100%;
        float: left;
        display: inline-block;
        background-color: #F1F1F1;
      }
      .leftside li{
      	width: 100% !important;
      }
      .rightside{
        margin-left: 1px;
        display: inline-block;
        width: 60%;
        height: 100%;

      }
      .activee{
      	background-color: white !important;
      	border-right: 0px !important;
      }
      .table-view-cell{ 
	      background-color: #E4E4E4;
	      display: block;
	      border-bottom: 1px solid #7A7A7A;
	      height: 50px;
      }
      .rightside .table-view-cell{ 
      	background-color: white;
      }
      .navigate-right{ 
      	display: block;
      	width: 100%;
      	height: 100%;
      	line-height: 50px;
      	text-align: center;
      	border-right: 1px solid #7A7A7A !important;
      }
    </style>
	<script src="../template/js/com/STATICVAR.js"></script>

  </head>
  <body>
	<div data-role="page" id="pageone">
	  	<div data-role="header">
		  <a href="#" data-role="button" data-icon="back"  onclick="javascript:window.history.go(-1)">返回</a>
		  <h1>选择课程</h1>
		</div>

		<div data-role="content"id="content">
			<div class="leftside">
				      <ul id="left">
				      </ul>
			</div>
			<div class="rightside">
				      <ul id="right">
				      	<li class="table-view-cell"><a class="navigate-right grand" href="teacherSearchList.jsp?mode=k12&amp;courseGrade=小学&amp;courseName=语文" data-ajax="false" data-transition="slide-in">语文</a></li>
				      	<li class="table-view-cell"><a class="navigate-right grand" href="teacherSearchList.jsp?mode=k12&amp;courseGrade=小学&amp;courseName=数学" data-ajax="false" data-transition="slide-in">数学</a></li>
				      	<li class="table-view-cell"><a class="navigate-right grand" href="teacherSearchList.jsp?mode=k12&amp;courseGrade=小学&amp;courseName=外语" data-ajax="false" data-transition="slide-in">外语</a></li>
				      	</ul>
			</div>
		</div>

		<div data-role="footer" id="footer">
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="../index.jsp" data-ajax="false" data-role="button">首页</a></li>
		        <li> <a href="../user/default.jsp" data-ajax="false" data-role="button">个人中心</a></li>
		      </ul>
	      	</div>
	    </div>
	</div>


</body>
</html>
<script type="text/javascript">

    function showcourse(i){
    	$("#right").empty();
    	var mode;
    	if(i>=0&i<=2) mode='k12';
    	else  mode='s12'
    	for (var j=0 ; j <= collumn[i].course.length - 1; j++) {

    		var url = 'teacherSearchList.jsp?mode='+mode+'&courseGrade='+collumn[i].grand+'&courseName='+collumn[i].course[j].name;
    		var temp = '<li class="table-view-cell"><a class="navigate-right grand" href="'+url+'" data-ajax="false" data-transition="slide-in">'+collumn[i].course[j].name+'</a></li>'
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