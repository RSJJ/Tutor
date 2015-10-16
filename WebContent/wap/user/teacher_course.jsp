<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 
    import="com.tutor.entity.server.User"%>
    <%@page import="java.util.List , com.tutor.entity.* " %>
    <%@page import="java.util.ArrayList"%>
 <%
   String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
	HttpSession sess = request.getSession();
	User user = (User)sess.getAttribute("user");
	int role =-100;
	String id="";
	if(user==null){
		response.sendRedirect("../login/default.jsp");
	}else{
		role = user.getRole();
		if(role==2){
			Teacher tea = (Teacher)user.getUser();
			id=tea.getTeacherId();
			
		}else if(role==1){
			Student stu = (Student)user.getUser();
			id=stu.getStudentId();
			
		}
	};
	//List<NorCourse> norCourses = request.getAttribute("norCourses") == null ? new ArrayList<NorCourse>():(List<NorCourse>)request.getAttribute("norCourses");
	//List<GraCourse> graCourses = request.getAttribute("graCourses") == null ? new ArrayList<GraCourse>():(List<GraCourse>)request.getAttribute("graCourses");
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
    <head>
        <title>课程管理</title>
        <meta charset="utf-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta content="width=device-width, minimum-scale=1,initial-scale=1, maximum-scale=1, user-scalable=1" id="viewport" name="viewport" />
        <!--离线应用的另一个技巧-->
        <meta content="yes" name="apple-mobile-web-app-capable" />
        <!--指定的iphone中safari顶端的状态条的样式-->
        <meta content="black" name="apple-mobile-web-app-status-bar-style" />
        <!--告诉设备忽略将页面中的数字识别为电话号码-->
        <meta content="telephone=no" name="format-detection" />
        <!--设置开始页面图片-->
        <!--<link rel="/touch/apple-touch-startup-image" href="startup.png" />-->
        <!--在设置书签的时候可以显示好看的图标-->
        <!--<link rel="apple-touch-icon" href="/touch/iphon_tetris_icon.png"/>-->
        <link type="text/css" rel="stylesheet" href="../template/css/com/com.css"/>
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">

		<script src="../template/js/com/jquery.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
		<style type="text/css">
			.wrap{ 
				margin:10px 0;
				background: white;
				width: 100%;
				height:auto;
				padding: 5px;
			}
			#footer {
				position:absolute;
				bottom:0; 
				left:0;
				width:100%;
				padding:0;
			}
			.icon { 
				margin:-15px;
				height: 130px;
				background: url("../template/images/good/background.jpg") no-repeat 0 0;
				background-size: 100% 100%;
				overflow: hidden;
			}
			.icon .img{ 
				margin-left:20px;
				text-align: left;
				line-height:112px;
				
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
			.condiv_ipt{
				width:40% !important;
			}
	</style>
    </head>
    <body>
	<div data-role="page" id="course">
	  	<div data-role="header">
			 <div class="com-header-area" id="js-com-header-area">
	            <a href="../index.jsp" data-ajax="false" class="com-header-logo"></a>
				<dfn></dfn>
	            <p>
	                <a href="default.jsp" class="com-header-user selected"><del></del></a>
	                <i></i>
	                <a href="../cart/default.htm" data-ajax="false" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
	            </p>
				<div class="clear"></div>
	        </div>
		</div>

		<div data-role="content" class="content">
	        <!--content-->
	        <div class="loading"></div>	
	        <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="#course" data-ajax="false" class="ui-btn-active" data-role="button">课程</a></li>
		        <li> <a href="" data-ajax="false" data-role="button">课表</a></li>
		      </ul>
	     	</div>
			 <div data-role="collapsible">
			    <h4>我的课程</h4>
			    <ul data-role="listview">
			      <li><a href="#">Adam</a></li>
			      <li><a href="#">Angela</a></li>
			    </ul>
			  </div>
			  <%if(role==2){ %>
			  <div data-role="collapsible">
			    <h4>添加课程</h4>
			    <ul data-role="listview">
			      <li><a href="#addK12" >基础课程</a></li>
			      <li><a href="#addKao" >考研课程</a></li>
			    </ul>
			  </div>
			 <%} %>
		</div>
		 <div data-role="footer" id="footer">
		  <div data-role="navbar" data-iconpos="left">
		      <ul>
		        <li> <a href="../index.jsp" data-ajax="false" data-role="button">首页</a></li>
		        <li> <a href="#pageone" data-ajax="false" data-role="button">个人中心</a></li>
		      </ul>
	      	</div>
	    </div>  
	</div>
	
	<div data-role="page" id="addK12">
	
		  <div data-role="header">
		    <a href="#" data-role="button" data-rel="back">返回</a>
		    <h1>添加基础课程</h1>
		  </div>
		  <div data-role="content">
		  <form method="post" action="">
		      <div data-role="fieldcontain">
		        <label for="nor_grade">年级：</label>
		        <select name="nor_grade" id="nor_grade">
		        	<optgroup label="小学">
			         <option value="小一">小一</option>
			         <option value="小二">小二</option>
			         <option value="小三">小三</option>
			         <option value="小四">小四</option>
			         <option value="小五">小五</option>
			         <option value="小六">小六</option>
			         <option value="小全">全年级</option>
					</optgroup>
					<optgroup label="初中">
			         <option value="初一">初一</option>
			         <option value="初二">初二</option>
			         <option value="初三">初三</option>
			         <option value="初全">全年级</option>
					</optgroup>
					<optgroup label="高中">
			         <option value="高一">高一</option>
			         <option value="高二">高二</option>
			         <option value="高三">高三</option>
			         <option value="高全">全年级</option>
					</optgroup>
		        </select>
		        <label for="nor_course"> 科目：</label>
		        <select  name="nor_course" id="nor_course">
		        	<option>物理</option>
		        </select>
		        <label for="nor_price_on">线上价格：</label><br>
		        <input type="text" name="nor_price_on" id="nor_price_on" placeholder="元/半小时"  />
				<div style="float:right;">
				<select name="nor_price_on_ch" id="nor_price_on_ch" style="float:right;" data-role="slider">
		          <option value="on" >On</option>
		          <option value="off">Off</option>
		        </select>
				</div>
		        <br>
				<label>线下价格：</label><br>
		        <input type="text" name="nor_price_off" id="nor_price_off" placeholder="元/半小时" />
				<div style="float:right;">
					<select name="nor_price_off_ch" id="nor_price_off_ch"  style="float:right;" data-role="slider">
			          <option value="on" >On</option>
			          <option value="off">Off</option>
			        </select>
				</div>
				<br>
		        <label>课程说明：</label><br>
		        <textarea name="nor_statement" id="nor_statement" maxlength=200 placeholder="其它说明（0-200字）"></textarea>
		      
		      </div>
		      <a href="#choiceTime" id="nor_submit"  data-role="button">下一步</a>
		  </form>
		  </div>
		
		  <div data-role="footer">
		  	 第一步：添加课程
		  </div>
	</div> 
	
	<div data-role="page" id="addKao">
	  <div data-role="header">
	    <a href="#" data-role="button" data-rel="back">返回</a>
	    <h1>添加考研课程</h1>
	  </div>
	
	  <div data-role="content">
	      <form method="post" action="">
		      <div data-role="fieldcontain">
		        <label for="gra_school">学校：</label>
		        <select name="gra_school" id="gra_school">
		        	<option>北京交通大学</option>
		        </select>
		        <label for="gra_academy">学院：</label>
		        <select  name="gra_academy" id="gra_academy">
		        	<option>计算机</option>
		        </select>
		        <label for="gra_academy">专业：</label>
		        <select  name="gra_domain" id="gra_domain">
		        	<option>计算机</option>
		        </select>
		        <label for="gra_academy">课程：</label>
		        <select  name="gra_course" id="gra_course">
		        	<option>操作系统</option>
		        </select>
		        <label for="gra_price_on">线上价格：</label><br>
		        <input type="text" name="gra_price_on" id="gra_price_on" placeholder="元/半小时" class="condiv_ipt" />
				<div style="float:right;">
				<select name="gra_price_on_ch" id="gra_price_on_ch" style="float:right;" data-role="slider">
		          <option value="on" >On</option>
		          <option value="off">Off</option>
		        </select>
				</div>
		        <br>
				<label>线下价格：</label><br>
		        <input type="text" name="gra_price_off" id="gra_price_off" placeholder="元/半小时" class="condiv_ipt" />
				<div style="float:right;">
					<select name="gra_price_off_ch" id="gra_price_off_ch"  style="float:right;" data-role="slider">
			          <option value="on" >On</option>
			          <option value="off">Off</option>
			        </select>
				</div>
				<br>
		        <label>课程说明：</label><br>
		        <textarea name="gra_statement" id="gra_statement" maxlength=200 placeholder="其它说明（0-200字）"></textarea>
		      
		      </div>
		      <a href="#" id="gra_submit" data-role="button">下一步</a>
		  </form>
	  </div>
	
	  <div data-role="footer">
	 	  第一步：添加课程
	  </div>
	</div>
	
	<div data-role="page" id="choiceTime">
	  <div data-role="header">
	    <a href="#" data-role="button" data-rel="back">返回</a>
	    <h1>设置课程时间</h1>
	  </div>
	
	  <div data-role="content">
		      <div data-role="fieldcontain">
			        <label for="mydate">选择日期：</label>
	        		<input type="date" name="mydate" id="mydate">
			            <label for="start_time">起始时间：</label>
			            <select name="start_time" id="start_time">
			              	<option>6:00</option>
							<option>6:30</option>
							<option>7:00</option>
							<option>7:30</option>
							<option>8:00</option>
							<option>8:30</option>
							<option>9:00</option>
							<option>9:30</option>
							<option>10:00</option>
							<option>10:30</option>
							<option>11:00</option>
							<option>11:30</option>
							<option>12:00</option>
							<option>12:30</option>
							<option>13:00</option>
							<option>13:30</option>
							<option>14:00</option>
							<option>14:30</option>
							<option>15:00</option>
							<option>15:30</option>
							<option>16:00</option>
							<option>16:30</option>
							<option>17:00</option>
							<option>17:30</option>
							<option>18:00</option>
							<option>18:30</option>
							<option>19:00</option>
							<option>19:30</option>
							<option>20:00</option>
							<option>20:30</option>
							<option>21:00</option>
							<option>21:30</option>
							<option>22:00</option>
							<option>22:30</option>
							<option>23:00</option>
							<option>23:30</option>
							<option>24:00</option>
			            </select>
			            
			            <label for="end_time">结束时间：</label>
			            <select name="end_time" id="end_time">
			              	<option>6:00</option>
							<option>6:30</option>
							<option>7:00</option>
							<option>7:30</option>
							<option>8:00</option>
							<option>8:30</option>
							<option>9:00</option>
							<option>9:30</option>
							<option>10:00</option>
							<option>10:30</option>
							<option>11:00</option>
							<option>11:30</option>
							<option>12:00</option>
							<option>12:30</option>
							<option>13:00</option>
							<option>13:30</option>
							<option>14:00</option>
							<option>14:30</option>
							<option>15:00</option>
							<option>15:30</option>
							<option>16:00</option>
							<option>16:30</option>
							<option>17:00</option>
							<option>17:30</option>
							<option>18:00</option>
							<option>18:30</option>
							<option>19:00</option>
							<option>19:30</option>
							<option>20:00</option>
							<option>20:30</option>
							<option>21:00</option>
							<option>21:30</option>
							<option>22:00</option>
							<option>22:30</option>
							<option>23:00</option>
							<option>23:30</option>
							<option>24:00</option>
			            </select>
		        <label for="cycle">时间周期：</label>
				<select name="cycle" id="cycle" >
					<option value="0">不循环</option>
					<option value="1">一周</option>
					<option value="4">一个月</option>
					<option value="8">两个月</option>
					<option value="1000000">永久</option>
				</select>
				<label for="mode">上课模式：</label>
				<select name="mode" id="mode">
					<option value = "1">线上模式</option>
					<option value = "2">线下模式</option>
					<option value = "3">线上线下</option>
				</select>
		      </div>
		     <a href="#" name="new_schedule_submit" id="new_schedule_submit"  data-role="button">保存</a>
	  </div>
	
	  <div data-role="footer">
	 	  第二步：选择上课时间
	  </div>
	</div>  
</body>
</html>
<script src="../template/js/user/index.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			var role = <%=role %>;
			if(role == 2){
				checkBasicInf('<%=id%>'); 
			}
			courseId = "";
			//添加普通课程
			$("#nor_submit").click(function(){
				var json = setJson(null,"courseType",1);//设置添加课程格式
				
				var nor_grade = $.trim($("#nor_grade").val());
				json = setJson(json,"norCourse.grade",nor_grade);
				
				var nor_course = $.trim($("#nor_course").val());
				json = setJson(json,"norCourse.course",nor_course);
				
				if($("#nor_price_on_ch").val()=="on")
				{
					var nor_price_on = $.trim($("#nor_price_on").val());
					if(!isNaN(nor_price_on))
					{
						json = setJson(json,"norCourse.priceOn",nor_price_on);
					}
					else
					{
						alert("线上价格不为数字！");
						return;
					}
				}
				else
				{
					json = setJson(json,"norCourse.priceOn",-1);
				}
				
				if($("#nor_price_off_ch").val()=="on")
				{
					var nor_price_off = $.trim($("#nor_price_off").val());
					if(!isNaN(nor_price_off))
					{
						json = setJson(json,"norCourse.priceOff",nor_price_off);
					}
					else
					{
						alert("线下价格不为数字！");
						return;
					}
				}
				else
				{
					json = setJson(json,"norCourse.priceOff",-1);
				}
				var nor_statement = $.trim($("#nor_statement").val());
				json = setJson(json,"norCourse.statement",nor_statement);
				
				$.ajax({
					type:"post",
					url:"addOneCourse.action",
					data: $.parseJSON(json),//string to json
					success:function(msg)
					{
						if(msg.code == '200')
						{
							alert(msg.statement);
						//	$('.ui-dialog').dialog('close');
						//	closeDiv();//关闭对话框
							courseId =  msg.msgPhone;
							window.location.href = "#choiceTime";
						}
						else
						{
							alert(msg.statement);
						}
						
					}
				});
				
			});
			
			$("#gra_submit").click(function(){
				
				var json = setJson(null,"courseType",2);
				
				var gra_school = $.trim($("#gra_school").val());
				json = setJson(json, "graCourse.school", gra_school);
				
				var gra_acadeny = $.trim($("#gra_academy").val());
				json = setJson(json,"graCourse.academy",gra_acadeny);
				
				var gra_domain = $.trim($("#gra_domain").val());
				json = setJson(json,"graCourse.domain",gra_domain);
				
				var gra_course = $.trim($("#gra_course").val());
				json = setJson(json,"graCourse.course",gra_course);
				
				if($("#gra_price_on_ch").is(':checked'))
				{
					var gra_price_on = $("#gra_price_on").val();
					if(!isNaN(gra_price_on))
					{
						json = setJson(json,"graCourse.priceOn",gra_price_on);
					}
					else
					{
						alert("线上价格非数字！");
						return;
					}
				}
				else
				{
					json = setJson(json,"graCourse.priceOn",-1);
				}
				
				if($("#gra_price_off_ch").is(':checked'))
				{
					var gra_price_off = $.trim($("#gra_price_off").val());
					if(!isNaN(gra_price_off))
					{
						json = setJson(json,"graCourse.priceOff",gra_price_off);
					}
					else
					{
						alert("线下价格非数字");	
						return;
					}
				}
				else
				{
					json = setJson(json,"graCourse.priceOff",-1)
				}
				
				var gra_statement = $.trim($("#gra_statement").val());
				json = setJson(json,"graCourse.statement",gra_statement);
				
				$.ajax({
					type:"post",
					url:"addOneCourse.action",
					data: $.parseJSON(json),//string to json
					success:function(msg)
					{
						if(msg.code == '200')
						{
							alert(msg.statement);
							//closeDiv1();//关闭对话框
							//$('.ui-dialog').dialog('close');
							courseId = msg.msgPhone;
							window.location.href = "#choiceTime";
							//location.reload();
						}
						else
						{
							alert(msg.statement);
						}
					}
				});
				
			});

			$("#new_schedule_submit").click(function(){
				var json = setJson(null,"teacherId",'<%=id %>');
				json = setJson(json,"schedule.availableCourse",courseId);
				
				var start_time = new Date(($("#mydate").val() + " " + $("#start_time").val()).replace(/\-/g, "\/"));
				json = setJson(json,"schedule.startTime",start_time.Format("yyyy-MM-dd hh:mm:ss"));
				var end_time = new Date(($("#mydate").val() + " " + $("#end_time").val()).replace(/\-/g, "\/"));
				json = setJson(json,"schedule.endTime",end_time.Format("yyyy-MM-dd hh:mm:ss"));
				if(start_time > end_time)
				{
					alert("开始时间不能大于结束时间");
					return;
				}
				
				var cycle = $("#cycle").val();
				json = setJson(json,"schedule.cycle",cycle)
				
				var mode = $("#mode").val();
				json = setJson(json,"schedule.mode",mode);
				
				$.ajax({
					type:"post",
					url:"scheduleAddOne.action",
					data:$.parseJSON(json),
					success:function(msg)
					{
						if(msg.code == '200')
						{
							alert(msg.statement);
							window.location.href = "teacher_course.jsp";
						}
						else
						{
							alert(msg.statement);
						}
					}
				});
				
			});
		})
		
</script>
