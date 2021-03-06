<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
 %>
  <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>老师信息</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Roboto -->
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" /> 
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=r6bfCVxPZTpoKGGNthyuupYh"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	<script src="dist/js/mapcontrol.js"></script> 
    <style type="text/css">
      * {
		font-family: "Microsoft YaHei" ! important;
		}
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
      .table-view-cell{ 
      	position: relative;
		padding: 11px 65px 11px 15px;
		overflow: hidden;
      }
      .table-view-cell:last-child {
		border-bottom: 0;
	}
      .content{ 
      	padding:0px !important;
		position:absolute; z-index:1;
		top:85px; bottom:41px; left:0;
		width:100%;
		background:#555;
		overflow-x:hidden;
      }
	#footer {
		position:absolute;
		bottom:0; 
		left:0;
		width:100%;
		padding:0;
	}
	.wrap{ 
		margin:10px 0;
		background: white;
		width: 99%;
		height:auto;
		padding: 5px;
	}
	.icon { 
		height: 130px;
		width: 100%;
		background: url("../template/images/good/background.jpg") no-repeat 0 0;
		background-size: 100% 100%;
		overflow: hidden;
	}
	.icon .img{ 
		margin:auto;
		text-align: center;
	}
	.icon .img h3{ 
		color:white;
	}
	.icon img{ 
		border-radius:50%;
		vertical-align: middle;	
		width: 70px;
		height: 70px;
	}
	.goodinfo{ 
		border-top: 1px solid #f1f1f1;
		padding:5px 0;
		margin-bottom: 0px !important;
	}
	.goodinfo li{ 
		border-bottom: 1px solid #f1f1f1;
		height: 30px;

		padding:10px 0;
		line-height: 20px;
	}
    </style>


  </head>
  <body>
	<div data-role="page" id="pageone">
	  	<div data-role="header">
		  <a href="#" data-role="button" data-icon="back"  onclick="javascript:window.history.go(-1)">返回</a>
		  <h1>杨老师</h1>
		  <a href="#" data-role="button" data-icon="grid" data-ajax="false" class="maphref">地图</a>
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li><a href="#pageone" class="ui-btn-active" data-icon="info">主页</a></li>
		        <li><a href="#pagetwo" data-icon="grid">开设课程</a></li>
		      </ul>
	      </div>
		</div>
		
		<div data-role="content" class="content" id="content">
			<div class="wrap icon">
				<div class="img">
					<img src="../template/images/good/default.jpg">
					<h3></h3>
				</div>
			</div>
			<div class="wrap basicinfo">
			<h3>基本信息</h3>
				<ul class="goodinfo"  >
		            <li>
		                <strong >学&nbsp;校</strong>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaschool"></span>
		            </li>
		            <li>
		                <strong>专&nbsp;业</strong>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaprofession"></span>
		            </li>
		            <li>
		                <strong>认&nbsp;证</strong>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaStatus"></span>
		            </li>
	         	</ul>
			</div>
			<div class="wrap">
				<h3>个人简介</h3>
			    <ul class="goodinfo" id="teaIntro">
		            <p></p>
		        </ul>
			</div>
			<!--  
			<div class="wrap">
				<h3>教学成果</h3>
			    <ul class="goodinfo">
			    	<h4>2014年9月3日~2015年9月3日</h4>
		            <p>获得国家励志奖学金和学业奖学金两个奖项，并曾在2010年大一下学期被学院评为优秀共青团员等。</p>
		        </ul>
			</div>
			-->
		</div>

		<div data-role="footer" id="footer">
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="#pagetwo" data-role="button">立即预约</a></li>
		      </ul>
	      	</div>
	    </div>
	</div>

	<div data-role="page" id="pagetwo">
	  	<div data-role="header">
		  <a href="#" data-role="button" data-icon="back"  onclick="javascript:window.history.go(-1)">返回</a>
		  <h1>杨老师</h1>
		  <a href="#" data-role="button" data-icon="grid" data-ajax="false" class="maphref">地图</a>
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li><a href="#pageone" data-icon="info">主页</a></li>
		        <li><a href="#pagetwo"  class="ui-btn-active" data-icon="grid">开设课程</a></li>
		      </ul>
	      </div>
		</div>
		<script type="text/javascript">
		function setTeacherInfo(data){
			var teacher = data.teacher;
			var norCourse = data.norCourses;
			var graCourse = data.graCourses;
			var imgsrc = "<%=basePath%>"+teacher.icon;
			var maphref = teacher.teacherId
			$(".maphref").attr('href','teacherSearchMap.jsp?mode=tea&id='+maphref);
			var status;
			switch(teacher.status)
			{
				case 3:status = '老师认证';	break;
				default:status = '待核实';	break;
			}
			$("#content .img img").attr('src',imgsrc);
			$("h1").html(teacher.name);
			$("#content .img h3").html(teacher.name);
			$("#teaschool").html(teacher.school);
			$("#teaprofession").html(teacher.profession);
			$("#teaStatus").html(status);
			$("#teaIntro").html(teacher.detailedIntroduction);
			var temp="";
			for(var i=0;i< norCourse.length;i++){
				temp +="<li class='ui-li ui-li-static ui-btn-up-c ui-first-child'><h2 class='ui-li-heading'>"+norCourse[i].grade+norCourse[i].course+"</h2><p class='ui-li-desc'>"+norCourse[i].statement+"</p><p class='ui-li-desc'>线上:"+norCourse[i].priceOn+"元/h&nbsp;&nbsp;&nbsp;&nbsp;线下:"+norCourse[i].priceOff+"元/h</p>"
			}
			for(var i=0;i< graCourse.length;i++){
				temp +="<li class='ui-li ui-li-static ui-btn-up-c ui-first-child'><h2  class='ui-li-heading'>"+graCourse[i].school+"-"+graCourse[i].academy+"-"+graCourse[i].course+"</h2><p  class='ui-li-desc'>"+graCourse[i].statement+"</p><p class='ui-li-desc'>线上:"+graCourse[i].priceOn+"元/h&nbsp;&nbsp;&nbsp;&nbsp;线下:"+graCourse[i].priceOff+"元/h</p>"
			}
			$("#classlist").append(temp);
		};
			
		</script>
		<div data-role="content" class="content">
			 <ul data-role="listview" data-inset="true" id="classlist">
			      
			 </ul>
		    
		</div>

		<div data-role="footer" id="footer">
			<div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="#pagetwo" data-role="button">立即预约</a></li>
		      </ul>
	      	</div>
		 
	    </div>
	</div>

</body>
</html>

<script>

function showTeacherInfo(){
    $.ajax({ 
        url:"showSingleTeacher",
        type:"GET",
        dataType:"json",
        data:{
        	teacherId:'<%=request.getParameter("teacherId")%>'
    	},
        success:function(data){
            console.log(data);
            setTeacherInfo(data);
        	//return _this._callback(callback,data.isSuccess,data.message,data)
        },
        error:function(data){ 
            console.log(data);
            alert("连接服务器失败，请稍后再试");
            //return _this._callback(callback,false,"连接服务器失败，请稍后再试",data);
        }
    })
}
$(document).ready(function(){
	showTeacherInfo()
})

</script> 
