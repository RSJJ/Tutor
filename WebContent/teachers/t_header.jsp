<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tutor.entity.server.*" %>
    <%@ page import="com.tutor.entity.*" %>
    <%
    	User user = (User)session.getAttribute("user");
    	Teacher teacher = null;
    	Student student = null;
    	if(user != null)
    	{
    		if(user.getRole() == User.TEACHER)
    		{
    			teacher = (Teacher)user.getUser();
    		}
    		else if(user.getRole() == User.STUDENT)
    		{
    			student = (Student)user.getUser();
    		}
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>学纷享家教</title>
    </head>
 
<body>
 <div class="top f_12">
        <div class="f_r m_r20"> 
          <a href="#" class="a_k m_l10" target="_blank" title="进入教室"><img src="images/company.png" />&nbsp;进入教室</a> &nbsp;&nbsp;
          <a href="#" title="购物车">购物车</a>
          <span id="qqShow" class="a_k m_l10 showDialog" onClick="javascript:window.open('http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODA3NjYwOF8yNTE3NDVfNDAwNjMyMDA1MV8yXw', '_blank', 'height=544px, width=644px,toolbar=no,scrollbars=no,menubar=no,status=no');" target="_blank"><img src="images/QQICO.png" />&nbsp;在线咨询
          <div id="qqShowDiv">
          <a href="javascript:void(0)" class="btn_a_top"><font class="f_l">立即咨询</font><font class="f_r">></font></a>
          </div>
          </span> 
          
          <div id="weiboShowDiv"><a href="#" rel="nofollow" class="btn_a_top" target="_blank"><font class="f_l">+关注</font><font class="f_r">></font></a></div>
          </span>
        </div>
        <div class="f_r">  <a href="userlogin.jsp" class="a_k m_l10" target="_blank" title="登录">登录</a> <a href="userregister.jsp" class="a_k m_l10" target="_blank" title="注册">注册</a>  
        </div>
      </div>
      <div class="logoBar m_b10">
        <div class="f_l"> <a href="/"><img src="images/logo.png" /></a> </div>
        <!-- <div class="f_r"> <img src="images/phone.png" /> </div>  -->
      </div>
      <div class="nav">
        <ul class="menu">
          <li class="home"> <a class="hover" href="#">首页</a> </li>
          <li class="liMain"> <a  href="#" >授课方式</a>
            <ul>
              <li><a href="#">在线一对一</a></li>
              <li><a href="#">在线一对多</a></li>
              <li><a href="#">线下一对一</a></li>
              <li><a href="#">线下一对多</a></li>
            </ul>
          </li>
          <li class="liMain"><a  href="#">课程体系</a></li>
          <li class="liMain"><a  href="#">教师团队</a></li>
          <li class="liMain"><a  href="#">上课流程</a></li>
          <li class="liMain"><a  href="#">精英学员</a></li>
          <li class="liMain"><a  href="#">个人中心</a></li>
          <div class="clear"></div>
        </ul>
      </div>
</body>
</html>