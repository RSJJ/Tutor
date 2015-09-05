<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List , com.tutor.entity.* " %>
	<%@page import="com.tutor.entity.server.*" %>
	<%@ page import="com.tutor.entity.*" %>
	<%@page import="com.tutor.util.*" %>
	<%
		User user = (User)session.getAttribute("user");
		Teacher teacher = null;
		if(user != null)
		{
			teacher = (Teacher)user.getUser();
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div class="inclra">
                    <!--2-->
                    <div class="guding">
                    <div class="inclrspaceb">
                        <div class="inclrspaceb1">
                            <h3 class="left2"><span class="c2">我的教学记录</span></h3>
                            <p><a href="#" class="inckjyenowred inckjyenowredg">线上上课记录</a></p>
                            <p><a href="#">线下上课记录</a></p>
                        </div>
                        <div class="inclrspaceb1">
                            <h3 class="left2"><span class="c2">我的课程信息</span></h3>
                            <p><a href="<%=teacher==null?"#":"showTeacherCourse.action?teacherId="+teacher.getTeacherId() %>">我的课程</a></p>
                            <p><a href="<%=teacher==null?"#":"getTeacherAllCourse.action?teacherId="+teacher.getTeacherId() %>">我的课程表</a></p>
                        </div>
                        <div class="inclrspaceb1">
                            <h3 class="left2"><span class="c2">我的个人信息</span></h3>
                            <p><a href="tRegister.action?userName=<%=teacher.getPhone() %>">基本信息</a></p>
                            <p><a href="#">我的订单</a></p>
                        </div>
                        <div class="inclrspaceb1">
                            <h3 class="left3"><span class="c3">客服服务</span></h3>
                            <p><a href="#">我的投诉</a></p>
                            <p><a href="#">我的消息</a></p>
                            <p><a href="#">我的评价</a></p>
                        </div>
                    </div>
                    </div>
                          
                    </div>
</body>
</html>