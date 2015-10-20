<%@page import="com.tutor.entity.Student"%>
<%@page import="com.tutor.entity.Teacher"%>
<%@page import="com.tutor.global.FinalValue"%>
<%@page import="com.tutor.util.Operation"%>
<%@page import="com.tutor.entity.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<List<Schedule>> weekSchedule = request.getAttribute("weekSchedule")==null?new ArrayList<List<Schedule>>():(List<List<Schedule>>)request.getAttribute("weekSchedule");
	Teacher teacher = (Teacher)request.getAttribute("teacher");
	String courseId = (String)request.getAttribute("courseId");
	int mode = request.getAttribute("mode")==null?1:Integer.valueOf(((String)request.getAttribute("mode")));
	Student student = (Student)session.getAttribute("student");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/erji.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/select.css" rel="stylesheet" type="text/css" charset="utf-8"  />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_team_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_syllabus_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.lightbox_me.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<!-- 首页轮播图 start --> 
<script type="text/javascript" src="js/jQuery-shopping.js"></script>

<!--[if IE 6]>
<script src="js/background.png.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<![endif]--> 

</head>

<body>
<input type="hidden" id="courseId" value="<%=courseId %>" >
<div id="sign_up">
                <h3 id="see_id" class="sprited" >登录学纷享</h3>
                <div id="sign_up_form">
                    <label><strong>用户名:</strong> <input class="sprited"/></label>
                    <label><strong>密码:</strong> <input class="sprited"/></label>
                    <div id="actions">
                        <a class="close form_button sprited" id="cancel" href="#">取消</a>
                        <a class="form_button sprited" id="log_in" href="#">登录</a>
                    </div>
                </div>
                <h3 id="left_out" class="sprited">没有账号?</h3>
                <span>点击<a href="#">注册</a> 马上加入!</span>
                <a id="close_x" class="close sprited" href="#">close</a>
</div>
<div class="container">
<!--导航 start-->
   <div class="erji_top">
      <div class="content">
      <jsp:include page="s_header.jsp"></jsp:include>
      </div>
    </div>
<!--导航 stop-->   

<!--微信 start--> 
<div class="floatDiv">
    <div class="floatDivOne">
      <div class="theFirst"><img src="images/zxzx.png" /></div>
      <div class="theLast"> <img onclick="NTKF.im_openInPageChat()" src="images/intalker.jpg" /></div>
    </div>
    <div class="floatDivTwo">
      <div class="theFirstTwo"><img src="images/wexin_4.png" /></div>
      <div class="theLastTwo"><img src="images/weixin_2.png" /></div>
    </div>
  </div>

<!--微信 stop-->   

    <div class="main" style="background:#fff; padding-bottom:20px;">

      <div class="erji_te w_960">首页>学员预约课程</div>
      <div class="container w_960" style="background:none;">
        <div class="w_210 fl">
          <div class="jsye_lt" style="height:250px;"> <img src="images/123.jpg" /><br />
            李宏伟<br />
            <a href="#"><img src="images/hover_play.png" /></a> </div>
          <div class="jsye_lt mt_10">
            <div class="jsye_lt1">
              <p> <strong>小学课程</strong> <span>小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文</span> <span style="color:#F90;">25.00元/小时</span> </p>
            </div>
            <div class="jsye_lt1">
              <p> <strong>初中课程</strong> <span>小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文</span> <span style="color:#F90;">25.00元/小时</span> </p>
            </div>
            <div class="jsye_lt1">
              <p> <strong>高中课程</strong> <span>小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文</span> <span style="color:#F90;">25.00元/小时</span> </p>
            </div>
            <div class="jsye_lt1">
              <p> <strong>考研课程</strong> <span>小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文小一语文</span> <span style="color:#F90;">25.00元/小时</span> </p>
            </div>
          </div>
        </div>
        <div class="w_730 fr ej_bor">
          <table width="100%" border="1">
            <tr>
              <td rowspan="2" valign="top" ><p style="text-align:left; padding:10px 10px 10px 10px; display:block; width:430px;">从毕业到现在一直从事高中数学的教育，在这十几年中所带毕业生好几届，并且所带学生的数学成绩优秀，得到了学生的喜爱。本着新课程的理念，把握高考方向，能更有效的来辅导学生，提高其成绩。<br /><br />
特点1：讲中有练，能把握重点和考试方向<br /><br />特点2：重点突出，幽默风趣。特点3：善于交流与沟通，能得到学生的喜欢。</p></td>
              <td width="135"><div class="jsye_tb1"><strong>125</strong><br />评分</div></td>
              <td width="135"><div class="jsye_tb1"><strong>125</strong><br />关注</div></td>
            </tr>
            <tr>
              <td height="129"><div class="jsye_tb1"><strong>125</strong><br />好评</div></td>
              <td><div class="jsye_tb1"><strong>125</strong><br />授课</div></td>
            </tr>
          </table>
        </div>
        
        <div class="kebiao w_730 fr">
	<div class="kb-top">
    	<ul class="qhz"> 
                 <li  class="dqrq"><span class="rq0"></span><a href="#">10</a><span class="zj0"></span></li>
    		    <li><span class="rq1"></span><span class="zj1"></span></li>
                <li><span class="rq2"></span><span class="zj2"></span></li>
                <li><span class="rq3"></span><span class="zj3"></span></li>
    		    <li><span class="rq4"></span><span class="zj4"></span></li>
    		    <li><span class="rq5"></span><span class="zj5"></span></li>
    		    <li><span class="rq6"></span><span class="zj6"></span></li>
        </ul>
        <div class="kb-sz">
                <div class="div_price"><span class="c_price">价格：</span><span class="c_price">70</span><span class="c_price">元/半小时</span></div>
           <!--   <div class="gwc"><span class="gwc-t"><a href="#">购物车</a></span><span class="gwc-s">0</span></div>
             <i></i>
             <div class="gwxq" style="display: none;">
                
	            	<ul>
	                
	                	<li><span>网络家教：08-09 12:00-12:30</span><span class="gwcprice">￥30.0</span><span class="gwcdel" onclick="delShopCart('348332','737040','30.0')">删除</span></li>
	                
	                </ul>
            	  <a class="gwcjs" href="/cart/shopcart.html"></a>
            	
            	
            
            </div> -->
          </div>
    </div>
	<div class="kb-con">
    	<div class="kb-l">
    	   <p class="yf"></p>
	       <p class="rq"></p> 
	       <p class="kjs">0节课</p>
        </div>
       <%for(int i=0;i<weekSchedule.size();i++){
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
				
				int index = 0;
    	   %>
      <div class="kb-r" id="kb_r<%=i+1 %>" style="width: 620px;<%if(i==0){%>display:block;<%}else{%>display:none;<%}%>">
       	<div class="ktable"id="morning_table">
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr class="t" style="heght:50px;">
						<td colspan="2"><span>上午</span>(6:00-12:00)</td>
					</tr>
					
					<%
						for(int j=0;j<mSchedules.size();j++,index++){ 
							Schedule schedule = mSchedules.get(j);
					%>
					<tr>
						<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td><td class="gm" title="">
							<div class="M-main-E left">
								<input type="hidden" name="schduleId" value="<%=schedule.getId()%>">
								<a title="加入购物车" class="baseBg Q-buy-btn" id="buy-s-<%=(i+1)+""+(index+1)%>">购物车</a>
							</div>
						</td>
					</tr>
                 	<%} %>
				</tbody>
			</table>
       </div>
       <!-- afternoon  -->
       <div class="ktable"id="afternoon_table">
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr class="t">
						<td colspan="2" style="heght:50px;"><span>下午</span>(12:00-18:00)</td>
					</tr>
					<%
						for(int j=0;j<aSchedules.size();j++,index++){ 
							Schedule schedule = aSchedules.get(j);
					%>
					<tr>
						<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td><td class="gm" title="">
							<div class="M-main-E left">
								<input type="hidden" name="schduleId" value="<%=schedule.getId()%>">
								<a  title="加入购物车" class="baseBg Q-buy-btn" id="buy-s-<%=(i+1)+""+(index+1)%>">购物车</a>
							</div>
						</td>
					</tr>
                 	<%} %>
				</tbody>
			</table>
       </div>
       <div class="ktable"id="night_table">
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr class="t">
						<td colspan="2" ><span>晚上</span>(18:00-22:00)</td>
					</tr>
					<%
						for(int j=0;j<nSchedules.size();j++,index++){ 
							Schedule schedule = nSchedules.get(j);
					%>
					<tr>
						<td><%=Operation.getHHmm(schedule.getStartTime())+"-"+Operation.getHHmm(schedule.getEndTime()) %></td><td class="gm" title="">
							<div class="M-main-E left">
								<input type="hidden" name="schduleId" value="<%=schedule.getId()%>">
								<a  title="加入购物车" class="baseBg Q-buy-btn" id="buy-s-<%=(i+1)+""+(index+1)%>">购物车</a>
							</div>
						</td>
					</tr>
                 	<%} %>
				</tbody>
			</table>
       </div>
      </div>
      <%
      }
       %>
        
    </div>

</div>
     
      </div>
    </div>
  
  <!--J-shoping-->
<div class="J-shoping J-shoping-small">
	<div class="J-shoping-item">
		<a href="javascript:void();" title="" id="U-attion"><em class="baseBg"></em>我关注的资源<span class="baseBg"></span></a>
		<div class="baseBg J-L-ico J-shoping-pos"></div>
		<div class="J-shoping-main">
			<div class="J-shoping-title">
				<a href="javascript:void();" title="" class="J-go"><em class="baseBg"></em>购物车</a>
				<span class="baseBg J-shoping-num">0</span>
			</div>
			<div class="baseBg J-shoping-mx"></div>
			<div class="J-shoping-px"></div>
			<form class="J-shoping-body" name="form" action="checkSchedule.action">
				<%-- <input type="hidden" id="studentId" name="studentId" value="<%=(student==null?"123456":student.getStudentId()) %>">
				<input type="hidden" name="courseId" value="<%=courseId %>" >
				<input type="hidden" name="mode" value="<%=mode%>"> --%>
				
			</form>
		</div>
		<div class="baseBg J-R-ico J-shoping-pos"></div>
	</div>
</div>
<!-- <a href="javascript:void();" title="在线客服" class="baseBg Q-online"></a> -->



 <script type="text/javascript" >
 $(document).ready(function(){
	 $num=$('.J-shoping-num');
	 $body=$('.J-shoping-body');
	 $.ajax({
		 url:"post",
		 url:"getShopCart.action",
		 success:function(shopCarts){
			 $num.text(shopCarts.length);
			 var bodyHtml = "";
			 for(var i =0; i<shopCarts.length; i++){
				 var shopCart = shopCarts[i];
				 
				 bodyHtml += '<div class="J-shoping-list" data-id="'+i+
						 '"> <input type="hidden" name="scheduleIds" value="'+
						 shopCart.courseId+'" > <a href="javascript:void();"title=""><img src="images/course.png" width="50"height="50"/></a><div class="J-shoping-list-a"><p><span class="left">'+
						 shopCart.course.teacherName+'</span><span class="mright">'+
						 shopCart.course.courseName+'</span></p><p><span class="left">'+
						 shopCart.course.date+' '+
						 shopCart.course.time+'</span><span class="mright"><em>'+
						 shopCart.price+
						 '元</em></span></p></div><div class="baseBg J-shoping-close"></div></div>';
			 }
			 bodyHtml += '<div class="J-shoping-buy">' +
				'<a class="baseBg" href="javascript:settlement();" id="settlement" title="去购物车结算"></a>'+
				'</div>';
			 $body.html(bodyHtml);
		 }
	 });
 });

 $(function(){
		// var bb=null;
		 //bb=$(this).parent().parent().parent().children('td:eq(0)').text();
		 $('.Q-buy-btn').shoping(); //调用shoping函数 
		 $("#settlement").click(function(){
			 var sum = Number($('.J-shoping-num').text());
			 if(sum>0){
				 if(<%=student==null?"0":"1"%>=="1"){
					 $("form").submit();
				 }
				 else{
					 $("#sign_up").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
							$("#sign_up").find("input:first").focus();
						}});
						
				 }
			 }
			 else{
				 alert("请先购买课程");
			 }
		 });
		 
}); 
 function settlement()
 {
	 var sum = Number($('.J-shoping-num').text());
	 if(sum>0){
		 if(<%=student==null?"0":"1"%>=="1"){
			 $("form").submit();
		 }
		 else{
			 $("#sign_up").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
					$("#sign_up").find("input:first").focus();
				}});
				
		 }
	 }
	 else{
		 alert("请先购买课程");
	 }
 }
</script> 
<div style="text-align:center;clear:both">
  
  
<!--底部 start-->   
<jsp:include page="s_bottom.jsp"></jsp:include>
<!--底部 stop-->     
</div>
</div>
</body>
</html>