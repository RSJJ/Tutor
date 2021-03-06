<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!doctype html>
<html>
    <head>
        <title>用户注册</title>
        <meta charset="utf-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="icon" href="../favicon.ico" type="image/x-icon" />
        <link rel="bookmark" href="../favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
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

        <script src="../template/js/com/jquery.min.js"></script>
        <script src="../template/js/com/com.js"></script>
        <script src="../template/js/login/px-verify.js"></script>
        <script src="../template/js/login/xfxregister.js"></script>
        <script src="../template/js/com/template.js"></script>
        <script type="text/javascript" src="../template/js/com/bootstrap.min.js"></script>
        <script src="../template/js/com/lrz.mobile.min.js"></script>
		<!--<script src="/template/js/com/jquery.snow.min.js"></script>
		<script>
		$(document).ready( function(){
			$.fn.snow({ 
				minSize: 5, 
				maxSize: 50, 
				newOn: 1000
			});
		});
		</script>-->
    </head>
    <body>
       
    <div class="com-content">
         		
       <div class="com-header-area" id="js-com-header-area">
            <a href="../index.jsp" class="com-header-logo"></a>
			<dfn></dfn>
            <p>
               
                <a href="default。jsp" class="com-header-user selected"><del></del></a>
                <i></i>
                <a href="../cart/default.htm" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
            </p>
			<div class="clear"></div>
        </div>
       <div class="com-content-area" id="js-com-content-area">
        <!--content-->
        <div class="loading"></div>			  
		<div class="page-role">
		<div class="page-title">
			<a href="javascript:history.back();void(0)" class="return">返 回</a>
			<span id="title">用户注册</span>
			<a href="../login/default.jsp">登录<i></i></a>
		</div>
			<form class="pxui-form-info" id="js-register-form" method = "post" action="../teacherRegister">
				<p class="error-msg" id="js-error-msg"></p>
				<!-- <div>
					<span>邮&nbsp;&nbsp;箱：</span><p><span>
					<input id="js-email" name="email" placeholder="请输入邮箱" type="text" maxlength="20"/></p>
				</div>
				 -->
				<div>
					<span>手&nbsp;&nbsp;机：</span><p><span>
					<input id="js-phone" name="userName" placeholder="请输入手机号码" type="text"  maxlength="11"/></p>
				</div>
				<div class="phone-box" style="display:none;">
					<span>&nbsp;</span><p><span>
					<input placeholder="手机验证码" id="js-code" type="text" style="width: 50%"/>
					<input id="js-get-phone" type="button" value="获取验证码" style="width: 111px !important;"/></span></p>
				</div>
		        <div>
		              <span>密&nbsp;&nbsp;码：</span><p><span>
		              <input id="js-password" name="password" placeholder="6-16位密码" type="password"/></span></p>
		        </div>
				<div><span>&nbsp;</span>
					<p><span>
					<input type="button" value="注 册 老  师   " data-type="teacherRegister" class="pxui-light-button js-register" style="margin-right:5%;width:45%;">
					<input type="button" value="注  册 学  员  " data-type="studentRegister" class="pxui-light-button js-register" style="width:45%;">
			        </span></p>
				</div>
			</form>
			<div id="js-phone-code-tip" style="margin:0 12px;display:none;">
				<b>收不到验证码，怎么办？</b><br/>
				1、检查是否被安全软件给拦截了<br/>
				2、现在短信的信道太过于拥堵了，再稍等片刻或者重新获取验证码<br/>
			</div>
		</div>
<!--content-end-->
</div>
</body>
</html>
