<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.tutor.entity.server.User,com.tutor.entity.Teacher"%>
<%
	HttpSession sess = request.getSession();
	User user = (User)sess.getAttribute("user");
	if(user!=null){
		response.sendRedirect("../user/default.jsp");
	};
%>
<!doctype html>
<html>
    <head>
        <title>学纷享登录</title>
        <meta charset="utf-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="icon" href="../favicon.ico" type="image/x-icon" />
        <link rel="bookmark" href="../favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
        <meta content="width=device-width, minimum-scale=1,initial-scale=1, maximum-scale=1, user-scalable=1;" id="viewport" name="viewport" />
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
		<script src="../template/js/com/jquery.min.js"></script>
    </head>
    <body>
        <div class="com-content">
            <div class="com-header-area" id="js-com-header-area">
                <a href="../index.jsp" class="com-header-logo"></a>
				<dfn></dfn>
                <p>
                   
                    <a href="default.jsp" class="com-header-user selected"><del></del></a>
                    <i></i>
                    <a href="../cart/default.htm" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
                </p>
				<div class="clear"></div>
            </div>
            <div class="com-content-area" id="js-com-content-area">
                <!--content-->
              			  <div class="page-role login-page">
								<link type="text/css" rel="stylesheet" href="../template/css/login/index.css"/>
								<script>var returnurl = "index";</script>
								<div class="page-title"><a href="javascript:history.back();void(0)" class="return">返 回</a>登录学纷享<a href="../register/default.jsp">注册<i></i></a></div>
							       	
							        <form autocomplete="off" class="pxui-form-info">
							        <div class="loading"></div>
							        <input type="hidden" name="rtnurl" value="index"/>
									<p class="error-msg" id="js-error-msg"></p>
							        <div><span>手&nbsp;&nbsp;&nbsp;机：</span><p><span><input name="userName"  placeholder="已验证的手机号" type="text"/></span></p></div>
									<div><span>密&nbsp;&nbsp;&nbsp;码：</span><p><span><input name="password"  type="password"/></span></p></div>
									
									<div><span>&nbsp;</span><p><span>
									<input type="button"  value="老  师  登  录   " id="teacherLogin" class="pxui-light-button" style="margin-right:5%;width:45%;"/>
									<input type="button"  value="学  生  登  录   " id="studentLogin" class="pxui-light-button" style="width:45%;"/>
							        </span></p></div>
								</form>
								<script type="text/javascript">
									
									$("#teacherLogin").click(function(){
											var username = $("[name='userName']").val();
											var password = $("[name='password']").val();
											$.ajax({
													data:{
															userName:username,
															password:password
														},
													dataType:"JSON",
													success:function(data){
															if(data.code!=0&&data.code!=1&&data.code!=2&&data.code!=3){
																$(".error-msg").html(data.statement).show();
																}
															else {
																
																$(".error-msg").html("欢迎回来："+username+"，点击<a href='../user/default.jsp' style='color:blue;'>个人中心</a>直接跳转").show();
																url = '../user/default.jsp';
											                    setTimeout(function(){window.location.href  = url;},5000)
															}
														},
													type:"POST",
													url:"teacherLogin"
												})
										})
									$("#studentLogin").click(function(){
											var username = $("[name='userName']").val();
											var password = $("[name='password']").val();
											$.ajax({
													data:{
															userName:username,
															password:password
														},
													dataType:"JSON",
													success:function(data){
														if(data.code!=0&&data.code!=1&&data.code!=2&&data.code!=3){
															$(".error-msg").html(data.statement).show();
															}
														else {
															$(".error-msg").html("欢迎回来："+username+"，点击<a href='../user/default.jsp' style='color:blue;'>个人中心</a>直接跳转").show();
															url = '../user/default.jsp';
										                    setTimeout(function(){window.location.href  = url;},5000)
														}
														},
													type:"POST",
													url:"studentLogin"
												})
										})
								</script>
								<!--  
								<h3 class="pxui-color-blue">使用小伙伴们的账号登录</h3>
								<div class="pxui-form-info pxui-other-login">
								<a href="apis@t=sina&r=1" class="pxui-button"><i></i>新浪微博账号登录</a>
								<a href="apis@t=qq&r=1" class="pxui-button"><i></i>QQ登录</a>
								<a href="apis@t=alipay&r=1" class="pxui-button"><i></i>支付宝登录</a>
							    <a href="apis@t=360&r=1" class="pxui-button"><i></i>360登录</a>
								</div>-->
							</div>
		<!--content-end-->
		</div>
		<!--
        <div class="com-footer-area" id="js-com-footer-area">
			<div class="com-footer-nav">
				<a href="../index.html">首页</a><a href="../help/index.html">帮助中心</a><a href="../feedback/index.html">反馈建议</a>
			</div>
		</div>
		 -->
</body>
</html>

