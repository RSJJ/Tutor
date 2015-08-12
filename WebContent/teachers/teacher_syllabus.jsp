<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List , com.tutor.entity.* " %>
	<%@page import="com.tutor.entity.server.*" %>
	<%@page import="com.tutor.util.*" %>
	<%@page import="com.tutor.global.FinalValue" %>
	<%
		User user = (User)session.getAttribute("user");
		Teacher teacher = null;
		if(user != null)
		{
			teacher = (Teacher)user.getUser();
		}
		else
		{
			teacher = new Teacher();
		}
		System.out.println(String.format("%02d", 0));
		List<List<Schedule>> weekSchedule = (List<List<Schedule>>)request.getAttribute("weekSchedule");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学纷享-教师课程表</title>
<link href="css/global.css" rel="stylesheet" type="text/css" charset="utf-8" />
<link href="css/erji.css" rel="stylesheet" type="text/css" charset="utf-8" />
<link href="css/gwc.css" rel="stylesheet" type="text/css" charset="utf-8" />
<link href="css/glDatePicker.default.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/glDatePicker.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/teacher_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_syllabus_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/util.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<!-- 首页轮播图 start -->
<script type="text/javascript">
function openDiv2(){
    var winStr = document.getElementById("winDiv2");
    winStr.style.display = "block";
}
function closeDiv2(){
    var winStr = document.getElementById("winDiv2");
    winStr.style.display = "none";
}
$(document).ready(function(){
	$("#new_schedule_submit").click(function(){
		var json = setJson(null,"teacherId",'<%=teacher.getTeacherId() %>');
		var courseIdArray = $("#teacher_courses").val();
		var courseIds = "";
		for(var i=0;i<courseIdArray.length;i++)
		{
			courseIds += courseIdArray[i] + "!#";
		}
		json = setJson(json,"schedule.availableCourse",courseIds);
		
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
					location.reload();
				}
				else
				{
					alert(msg.statement);
				}
			}
		});
		
	});
});
</script>

<!--[if IE 6]>
<script src="js/background.png.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<![endif]-->

</head>

<body>

	<div class="container">
		<!--导航 start-->
		<div class="erji_top">
			<div class="content">
				<jsp:include page="t_header.jsp"></jsp:include>
			</div>
		</div>
		<!--导航 stop-->

		<!--微信 start-->
		<div class="floatDiv">
			<div class="floatDivOne">
				<div class="theFirst">
					<img src="images/zxzx.png" />
				</div>
				<div class="theLast">
					<img onclick="NTKF.im_openInPageChat()" src="images/intalker.jpg" />
				</div>
			</div>
			<div class="floatDivTwo">
				<div class="theFirstTwo">
					<img src="images/wexin_4.png" />
				</div>
				<div class="theLastTwo">
					<img src="images/weixin_2.png" />
				</div>
			</div>
		</div>
		<!--微信 stop-->

		<div class="main" style="background: #fff; padding-bottom: 20px;">
			<div class="w_960">
				<div class="erji_te">首页>教师个人中心</div>
				<div class="container" style="background: none;">
					<div class="grkj">
						<div class="grkj-top clearfix">
							<div class="grkj-l">
								<p class="tx">
									<img alt="花花" title="花花" src="images/incimg12.gif">
								</p>
								<p class="nrxx">
									<a href="javascript:void(0);" class="user">花花</a>
								</p>
							</div>
							<div class="grkj-r">
								<ul class="clearfix">
									<li><a href="#">购物车<span>1</span> <b>1</b></a></li>
									<li><a href="#"><span>0</span>个提醒</a></li>
									<li class="y"><a href="#"><span>0</span>个预约</a>
									</li>
									<li class="y"><a href="#">进入教室</a></li>
								</ul>

							</div>
						</div>
					</div>
				</div>

				<div class="main maingr">
					<!--main-->
					<div class="incmain">
						<jsp:include page="t_menu.jsp"></jsp:include>
						<div class="incrl">
							<div class="incrlspacea" style="border-bottom: 1px solid #D3D3D3">
								<span class="incrlspacea1">我的课程表</span>

							</div>
							<div id="layout">
								<!-- 弹出框 start -->
								<div gldp-el="mydate" style="width: 250px; height: 240px; display: block; position: absolute; margin-left: 95px; margin-top: 116px; z-index: 200;"></div>
								<div id="winDiv2">
									<div class="topDiv">
										<span class="fl">添加新课程</span><span class="fr" id="close"
											onclick="closeDiv2()"><img src="images/close.jpg" /></span>
										<div class="clear"></div>
									</div>
									<div class="condiv">
										<table class="t_syl_table">
											<tr>
												<td>选择课程：</td>
												<td>
													<label>
														<s:select name="teacher_courses" list="#request.courses" listKey="courseId" listValue="courseName" multiple="true" style="height: 150px; width: 250px;"></s:select>
													</label>
												</td>
											</tr>
											<tr>
												<td>选择日期：</td>
												<td><input name="mydate" type="text" id="mydate" gldp-id="mydate" />
												</td>
											</tr>
											<tr>
												<td>选择时间：</td>
												<td>
													<label>
														<select name="start_time" id="start_time" style="width: 200px;">
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
													</label>--<label>
														<select name="end_time" id="end_time" style="width: 200px;">
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
													</label>
												</td>
											</tr>
											<tr>
												<td>时间周期：</td>
												<td>
													<label>
														<select name="cycle" id="cycle" style="width: 200px;">
															<option value="0">不循环</option>
															<option value="1">一周</option>
															<option value="4">一个月</option>
															<option value="8">两个月</option>
															<option value="1000000">永久</option>
														</select>
													</label>
												</td>
											</tr>
											<tr>
												<td>上课模式：</td>
												<td>
													<label>
														<select name="mode" id="mode" style="width: 200px;">
															<option value = "1">线上模式</option>
															<option value = "2">线下模式</option>
															<option value = "3">线上线下</option>
														</select>
													</label>
												</td>
											</tr>
										</table>
										<div class="re_con4">
											<input name="new_schedule_submit" id="new_schedule_submit" value="" type="button" class="btn_yz">
										</div>
									</div>
								</div>
							</div>
							<!-- 弹出框 stop -->

							<div class="kebiao fr" style="width: 718px;">
								<div class="kb-top">
									<ul class="qhz">
										<li class="dqrq"><span class="rq0"></span><a href="#">10</a><span
											class="zj0"></span></li>
										<li><span class="rq1"></span><span class="zj1"></span></li>
										<li><span class="rq2"></span><span class="zj2"></span></li>
										<li><span class="rq3"></span><span class="zj3"></span></li>
										<li><span class="rq4"></span><span class="zj4"></span></li>
										<li><span class="rq5"></span><span class="zj5"></span></li>
										<li><span class="rq6"></span><span class="zj6"></span></li>
									</ul>
									<div class="kb-sz kb-sz1" style="width: 183px;">
										<a href="javascript:openDiv2()"><font size="+2"
											color="#FF9933">+</font>新时间</a>
									</div>
								</div>
								<div class="kb-con">
									<div class="kb-l">
										<p class="yf"></p>
										<p class="rq"></p>
										<p class="kjs">0节课</p>
									</div>
									<!--<div class="xjkb">
										<div class="xjkb-bt">
											<span>新建课表</span>
											<p></p>
										</div>
										<input type="hidden" name="courseType" id="courseType" value="iWantTeach" /> 
										<input type="hidden" name="onetooneprice" id="onetooneprice" value="70.0" /> 
										<input type="hidden" id="lastCheckbox" name="lastCheckbox" value="" />
										<input type="hidden" name="curUser" id="curUser" value="" />
										<input type="hidden" id="firstTime" name="firstTime" value="2015-05-05"> 
										<input type="hidden" id="lastTime" name="lastTime" value="2015-05-11">
										
										<p>
											<span>日期：</span> 
											<input style="width: 150px;" id="startTime" readonly="readonly" class="incmdmrldinput" type="text">
											<input id="time5" class="w75 input" value="06:00" size="10" type="text" />- 
											<input id="time4" class="w75 input" value="00:00" size="10" type="text" /> 
											<select id="cstatus">
												<option value="0">不循环</option>
												<option value="1">循环一周</option>
											</select> 
										</p>
										<p>
											<span>价格：</span><input type="text" name="oneprice"
												id="oneprice" value="70.0" />元/半小时
										</p>
										<div class="xjkb-bc">
											<p id="bckb" onclick="addEvents();">保存</p>
										</div>
										 

									</div>-->
									<%if(weekSchedule != null){ 
									for(int i=0 ; i<7;i++)
									{
									%>
									<div class="kb-r" id="kb_r<%=i+1 %>" style="width: 620px;display:block;">
									<div class="kb-r" id="kb_r<%=i+1 %>" style="width: 620px;<%if(i==0){%>display:block;<%}else{%>display:none;<%}%>">
										<% 
										/**
										将每天的课表根据上午下午晚上分类
										*/
											List<Schedule> schedules = weekSchedule.get(i); 
											List<Schedule> mSchedules = new ArrayList<Schedule>();
											List<Schedule> aSchedules = new ArrayList<Schedule>();
											List<Schedule> nSchedules = new ArrayList<Schedule>();
											for(Schedule schedule : schedules)
											{
												switch(Operation.getTimeSlot(schedule.getStartTime()))
												{
												case FinalValue.DAY_MORNING:
													mSchedules.add(schedule);
													break;
												case FinalValue.DAY_AFTERNOON:
													aSchedules.add(schedule);
													break;
												default:
													nSchedules.add(schedule);
													break;
												}
											}
										%>
										<div class="ktable"id="morning_table">
												<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr class="t">
													<td colspan="2"><span>上午</span>(6:00-12:00)</td>
												</tr>
												<%for(Schedule schedule : mSchedules){ %>
												<tr>
													<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td>
													<td class="gm" title=""><p id="p692926"
															style="cursor: pointer" onclick="">可购买</p></td>
												</tr>
												<%} %>
												
												
											</tbody>
										</table>
											<!-- <p class="xsj1" onclick="openDiv2()">
												<font size="+2" color="#FF9933">+</font>新时间
											</p> -->
										</div>
										<div class="ktable"id="afternoon_table">
												<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr class="t">
													<td colspan="2"><span>下午</span>(12:00-18:00)</td>
												</tr>
												<%for(Schedule schedule : aSchedules) {%>
												<tr>
													<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td>
													<td class="gm" title=""><p id="p692926"
															style="cursor: pointer" onclick="">可购买</p></td>
												</tr>
												<%} %>
												<!--  
												<tr>
													<td>18:30-19:00</td>
													<td class="gm" title=""><p id="p692927"
															style="cursor: pointer" onclick="">可购买</p></td>
												</tr>
												<tr>
													<td>19:30-20:00</td>
													<td class="gm huisebg" title="">纪蕴已购买</td>
												</tr>
												-->
												
											</tbody>
										</table>
											<!-- <p class="xsj1" onclick="openDiv2()">
												<font size="+2" color="#FF9933">+</font>新时间
											</p> -->
										</div>
											<div class="ktable" id="night_table">
												<table border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr class="t">
													<td colspan="2"><span>晚上</span>(18:00-24:00)</td>
												</tr>
												<%for(Schedule schedule : nSchedules){ %>
												<tr>
													<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td>
													<td class="gm" title=""><p id="p692926"
															style="cursor: pointer" onclick="">可购买</p></td>
												</tr>
												<%} %>
												<!-- 
												<tr>
													<td>18:30-19:00</td>
													<td class="gm" title=""><p id="p692927"
															style="cursor: pointer" onclick="">可购买</p></td>
												</tr>
												<tr>
													<td>19:30-20:00</td>
													<td class="gm huisebg" title="">纪蕴已购买</td>
												</tr>
												<tr>
													<td>20:00-20:30</td>
													<td class="gm huisebg" title="">纪蕴已购买</td>
												</tr>
												<tr>
													<td>20:30-21:00</td>
													<td class="gm huisebg" title="">纪蕴已购买</td>
												</tr>
												<tr>
													<td>21:00-21:30</td>
													<td class="gm huisebg" title="">d已购买</td>
												</tr>
												<tr>
													<td>21:30-22:00</td>
													<td class="gm huisebg" title="">d已购买</td>
												</tr>
												 -->
											</tbody>
										</table>
											<!-- <p class="xsj1" onclick="openDiv2()">
												<font size="+2" color="#FF9933">+</font>新时间
											</p> -->
											
											</div>
											<!-- end night -->
										<div class="clear"></div>
									</div>
									<%
										}//for
									}//if 
									%>
									
									<div class="clear"></div>
								</div>
								<div class="clear"></div>
							</div>
							<div></div>
						</div>
						<div class="clear"></div>
					</div>
					<!--main-->
				</div>

			</div>

		</div>

		<!--底部 start-->
		<jsp:include page="t_bottom.jsp"></jsp:include>
		<!--底部 stop-->
	</div>

</body>
</html>
