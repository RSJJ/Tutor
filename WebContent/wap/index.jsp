<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
<!doctype html>
<html>
    <head>
        <title>学纷享首页 </title>
        <meta charset="utf-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="bookmark" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
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
       
        <link type="text/css" rel="stylesheet" href="<%=basePath %>wap/template/css/com/com.css"/>
	    <script>var PX_HELP_DATA=['','uo74au74aqpc8801g3htt5l2v7',['touch','home','index'],'2014/04/09 09:12:46',0,false]; var DOMIN = {MAIN:"../m.paixie.com/",HELP:"../help.paixie.net/",TUAN:"../tuan.paixie.net/",WAP:"../wap.paixie.net/",UNION:"../union.paixie.net/",VIPSHOP:"../v.paixie.net/"};</script>  

        <script>
		
			var JAVASCRIPT_LIB = (('\v' !== 'v') ? 'zepto' : 'jquery');
			JAVASCRIPT_LIB="jquery";
           document.write('<script src="http://code.jquery.com/jquery-1.9.1.min.js"><\/script>');
			
			
            DOMIN.MAIN = './';
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
        <script src="<%=basePath %>wap/template/js/com/com.js"></script>
        <script src="http://ued.paixie.net/scripts/public/px-verify.js"></script>
        <script src="<%=basePath %>wap/template/js/com/template.js"></script>
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
        <!-- uc 浏览器添加书签 start --->
        <iframe src="http://app.uc.cn/appstore/AppCenter/frame@uc_param_str=nieidnutssvebipfcp&api_ver=2.0&id=1904" width="100%" height="160" style="display:none"  id="otherPage"></iframe>
        <!-- uc 浏览器添加书签 end  ---->
       
        <div class="com-content">
            <div class="com-header-area" id="js-com-header-area">
                <a href="#" class="com-header-logo"></a>
				<dfn></dfn>
                <p>
                    
                    <a href="<%=basePath %>wap/login/default.jsp" class="com-header-user "><del></del></a>
                    <i></i>
                    <a href="<%=basePath %>wap/cart/default.htm" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
                </p>
				<div class="clear"></div>
                
            </div>
            <div class="com-content-area" id="js-com-content-area">
                <!--content-->
              			  <script type="text/javascript">
    $(function(){
        $('.pxui-show-more').first().find('a').click();  
        $('.pxui-show-more').last().find('a').click();  
    });
</script>
<div class="page-role home-page">
	<link type="text/css" rel="stylesheet" href="<%=basePath %>wap/template/css/home/index.css"/>
	<script src="<%=basePath %>wap/template/js/com/jquery.touchslider.min.js"></script>
	<script src="<%=basePath %>wap/template/js/home/index.js"></script>
<script>
jQuery(function($) {
	$(window).resize(function(){
		var width=$('#js-com-header-area').width();
		$('.touchslider-item a').css('width',width);
		$('.touchslider-viewport').css('height',300*(width/640));
	}).resize();	
	$(".touchslider").touchSlider({mouseTouch: true, autoplay: true});
});
</script>	
	
<div class="touchslider">
    <div class="touchslider-viewport">
	<div class="touchslider-item"><a href=""><img src="<%=basePath %>wap/template/images/home/1.jpg" style="vertical-align:top;"/></a></div>
	<div class="touchslider-item"><a href=""><img src="<%=basePath %>wap/template/images/home/2.jpg" style="vertical-align:top;"/></a></div>
	<div class="touchslider-item"><a href=""><img src="<%=basePath %>wap/template/images/home/3.jpg" style="vertical-align:top;"/></a></div>
	</div>
	<div class="touchslider-navtag">
	<span class="touchslider-nav-item touchslider-nav-item-current"></span>
	<span class="touchslider-nav-item "></span>
	<span class="touchslider-nav-item "></span>
	</div>
</div>


	<div class="pxui-tab pxui-tab-nav pxui-tab-no-top">
                <a class="selected"><i></i>首页<span></span></a>
				<a href="<%=basePath %>wap/tuan/teacherSearch.html"><i></i>匹配老师<span></span></a>
				<a href="<%=basePath %>wap/brand/default.html"><i></i>上课流程<span></span></a>
                <a href="<%=basePath %>wap/login/@url=_2Fmember_2Forder@pay=2"><i></i>查看预约<span></span></a>
        
	</div>
	<div class="tags">
		<table border="0" cellspacing="5" cellpadding="0">
			<tr>
				<td colspan="2"><a href="<%=basePath %>wap/register/default.jsp"><i></i>老师入驻<br/>在这里大展你的风采</a></td>
				<td><a href="<%=basePath %>wap/tuan/cart.jsp"></br>金牌老师</a></td>
				<td rowspan="2"><a href="<%=basePath %>wap/topic/612.html"><i></i>最<br/>新<br/>公<br/>告</a></td>
			</tr>
			<tr>
				<td><a href="<%=basePath %>wap/tuan/stu.jsp"></br>精英学员</a></td>
				<td colspan="2"><a href="<%=basePath %>wap/register/default.jsp">学生入驻<br/>为您匹配完美导师</a></td>
			</tr>
		</table>
	</div>
        
</div>

<!--content-end-->
		</div>
        <div class="com-footer-area" id="js-com-footer-area">
			<div class="com-footer-nav">
				<a href="<%=basePath %>wap/index.jsp">首页</a><a href="feedback/index.jsp">反馈建议</a>
			</div>
        </div>

<div style="display:none;">

<script>
	function aa(i){
			var y = document.getElementById("js-com-search-recommend1");
			y.style.display="block";
			y.style.marginTop= (48*i)+'px';
		}
</script>
</div>
</body>
</html>
