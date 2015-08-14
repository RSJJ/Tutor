<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
        <title>教师详细信息填写</title>
        <meta charset="utf-8">
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
				<script>var PX_HELP_DATA=['','uo74au74aqpc8801g3htt5l2v7',['touch','register','index'],'2014/04/09 09:45:11',0,false]; var DOMIN = {MAIN:"../../m.paixie.com/",HELP:"../../help.paixie.net/",TUAN:"../../tuan.paixie.net/",WAP:"../../wap.paixie.net/",UNION:"../../union.paixie.net/",VIPSHOP:"../../v.paixie.net/"};</script>  

        <script>
		
			var JAVASCRIPT_LIB = (('\v' !== 'v') ? 'zepto' : 'jquery');
			JAVASCRIPT_LIB="jquery";
            document.write('<script src="http://ued.paixie.net/scripts/public/jquery.js"><\/script>');
			
			
            DOMIN.MAIN = '../';
            // uc浏览器添加书签功能 
           window.onmessage = function(event){
                if(event.data.message != '')
                {
                    $('#otherPage').remove();
                }else{
                    $('#otherPage').show();
                }
            }
        </script>
        <script src="../template/js/com/com.js"></script>
        <script src="../template/js/login/px-verify.js"></script>
        <script src="../template/js/com/template.js"></script>
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
             					<script>
                           
                        function open_notice(id){
                            setCookie('touch_notice_close',1);
                            var url = '../new/info/'+id+'.html';
                            window.location.href=url;
                        }   
                           
                        var touch_notice_close = getCookie('touch_notice_close');
                        if(touch_notice_close == '1' && typeof(document.getElementById('js-com-notification2')) != 'undefined' && document.getElementById('js-com-notification2') != null){
                            document.getElementById('js-com-notification2').style.display = 'none';
                        }
			//if( document.cookie.match(new RegExp("(^| )PHPSESSID=([^;]*)(;|$)")) ){
			  //  document.getElementById('js-com-notification').style.display = 'none';
		//	}
			</script>
            <div class="com-header-area" id="js-com-header-area">
                <a href="../index.html" class="com-header-logo"></a>
				<dfn></dfn>
                <p>
                    <a class="com-header-search" id="js-com-header-search"><del></del></a>
                    <a href="../login/default.htm" class="com-header-user selected"><del></del></a>
                    <i></i>
                    <a href="../cart/default.htm" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
                </p>
				<div class="clear"></div>
                <form action="/s.php" method="post">
                    <strong>
                        <input type="text" name="keyword" id="js-com-search-text" value=""/>
                        <input type="submit" value=" "/>
                    </strong>
                    <div id="js-com-search-recommend">
                        <div></div>
                                                <a href="../p-_m0003s0017_1.html@asc=id"  style="color:#000000	">小学语文</a>
                                                <a href="../p-m0001_id;1.html"  style="color:#ed1749">初中数学</a>
                                                <a href="../p-m0001s0014_1.html"  style="color:#000000">高中外语</a>
                         
                    </div>
                </form>
            </div>
            <div class="com-content-area" id="js-com-content-area">
                <!--content-->
              			  
<div class="page-role">
    <script type="text/javascript">
        var returnurl = '../member/';
    </script>
    <script src="../template/js/login/register.js"></script>
	<div class="page-title"><a href="javascript:history.back();void(0)" class="return">返 回</a>用户注册<a href="../login/default.htm">登录<i></i></a></div>
	<form class="pxui-form-info" id="js-register-form" method = "post" action="../teacherRegister">
		<p class="error-msg" id="js-error-msg"></p>
		<div>
			<span>所在省份：</span><p><span>
			<input id="js-username" name="username" placeholder="如：北京" type="text"/></p>
		</div>
		<div>
			<span>所在城市：</span><p><span>
			<input id="js-username" name="username" placeholder="如：北京" type="text"/></p>
		</div>
		<div>
			<span>详细地址：</span><p><span>
			<input id="js-username" name="username" placeholder="如：北京" type="text"/></p>
		</div>
		<div>
			<span>职业：</span><p><span>
			<input id="js-username" name="username" placeholder="如：学生" type="text"/></p>
		</div>
		<div>
			<span>个人头像：</span><p><span>
			<input id="js-username" name="pic1" placeholder="请上传您的个人头像" type="file"/></p>
		</div>
		<div>
			<span>证件照：</span><p><span>
			<input id="js-username" name="pic2" placeholder="请上传工作证/学生证，以便证实您的身份" type="file"/></p>
		</div>
		<div>
			<span>个人简介：</span><p><span>
			<input id="js-username" name="username" placeholder="个人简介" type="text"/></p>
		</div>
		<div>
			<span>详细介绍：</span><p><span>
			<input id="js-username" name="username" placeholder="详细介绍：如某年某月某日，得到什么奖项" type="text"/></p>
		</div>
	</form>
</div>
<!--content-end-->
		</div>
	<div class="com-footer-area" id="js-com-footer-area">
				<div class="com-footer-nav">
					<a href="../index.html">首页</a><a href="../help/index.html">帮助中心</a><a href="../feedback/index.html">反馈建议</a>
				</div>
	</div>


<div style="display:none;">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F188d758416f87a421ba1c700763fa0bf' type='text/javascript'%3E%3C/script%3E"));
</script>
</div>
</body>
</html>