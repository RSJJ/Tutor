<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 
    import="com.tutor.entity.server.User,
    com.tutor.entity.Teacher,
    com.tutor.entity.Student"%>
 <%
   String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
	HttpSession sess = request.getSession();
	User user = (User)sess.getAttribute("user");
	String icon = basePath;
	String phone = "";
	String deSrc = "";
	int role = user.getRole();
	
	if(user==null){
		response.sendRedirect("../login/default.jsp");
	}else{
		if(role==2){
			Teacher tea = (Teacher)user.getUser();
			if(tea.getIcon()==null){
				icon = "../template/images/good/default.jpg";
			}else icon += tea.getIcon();
			
			phone = tea.getPhone();
			deSrc = "tedetail.jsp";
			}else if(role==1){
			Student stu = (Student)user.getUser();
			icon = "../template/images/good/default.jpg";
			phone = stu.getPhone();
			deSrc = "stdetail.jsp";
		}
		phone = phone.substring(0, 4)+"*****"+phone.substring(9, 11);
	};
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
    <head>
        <title>个人中心</title>
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

		<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
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
	</style>
    </head>
    <body>
    <div data-role="page" id="pageone">
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
	         <a href="#link" data-icon="arrow-r" data-iconpos="right">
			<div class="icon">
				<div class="img">
						<img src=<%=icon%>>
						<span><%=phone %></span>
				</div>
			</div>
			</a>
			<ul data-role="listview">
				<li><a href=<%=deSrc %>  data-ajax="false"  data-icon="info" data-iconpos="left">完善个人信息</a></li>
				<br>
			  <li><a href="#" data-icon="alert" data-iconpos="left">消息中心<span class="ui-li-count">0</span></a></li>
			  <li><a href="#" data-icon="gear" data-iconpos="left">课程管理</a></li>
			  <li><a href="#" data-icon="gear" data-iconpos="left">查看预约</a></li>
			  <hr>
			 <li><a href="#" id="logout"  data-ajax="false"  data-icon="info" data-iconpos="left">退出登录</a></li>
			</ul>
			
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
</body>
</html>
<script type="text/javascript">
	$("#logout").click(function(){
			var role = <%=role %>;
			if(role == 2){
					$.get("teacherLogout",function(data,status){
						 window.location.href = "../login/default.jsp";
				  });
				}else{
					$.get("studentLogout",function(data,status){
						 window.location.href = "../login/default.jsp";
				  });
				}
		})
</script>

