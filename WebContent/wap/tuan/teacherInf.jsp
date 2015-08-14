<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
  <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Notes</title>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta content="width=device-width, minimum-scale=1,initial-scale=1, maximum-scale=1, user-scalable=1;" id="viewport" name="viewport" />
    <!-- Roboto -->
    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet.min.css">
    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/ratchet-theme-ios.min.css">
    <link rel="stylesheet" href="<%=basePath %>wap/tuan/dist/css/teacherList.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath %>wap/template/css/com/com.css"/>
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
    <script src="<%=basePath %>wap/tuan/dist/js/ratchet.min.js"></script>
    <script src="<%=basePath %>wap/tuan/dist/js/sliders.js"></script>

    </head>
    <body>
    
     <header class="bar bar-nav">
      <button class="btn btn-link btn-nav pull-left"  onclick="javascript:window.history.go(-1)">
        <span class="icon icon-left-nav"></span>
      </button>
      <a class="btn pull-right" herf="jumpToTeacherMap?courseId=<s:property value="courseId"/>">
	    	地图
	  </a>
	 
    </header>
             <!-- 页头结束 -->
             <!--content-->

	<div class="page-role good-page">
    <link type="text/css" rel="stylesheet" href="../template/css/good/index.css" />
	<br>
	<br>
    <!-- 教师图片滚动 -->
		<!-- 教师图片滚动结束 -->
		<!-- 教师课时安排 -->
         <!--教师课时安排结束 -->

        <!--教师个人信息开始 -->
        <div id="js-goodinfo-show"></div>
        <div id="js-goodinfo" style="display:block;">		
	        <ul class="goodinfo"  >
	            <li>
	                <div><strong>姓&nbsp;名</strong>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaname">杨老师</span>
	                </div>
	            </li>
	            <li>
	                <div><strong >学&nbsp;校</strong>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaschool">北京交通大学</span>
	                </div>
	            </li>
	            <li>
	                <div><strong>专&nbsp;业</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="teaprofession">智能运输工程</span>
	                </div>
	            </li>
	            <li>
	                <dl class="classCart">
	                	<dt><strong>教学课程</strong></dt>
	                	<dd class="inf" >
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                	<span id="teacurriclums"></span>
	                	</dd>
	                </dl>
	            </li>
	             <li>
	                <dl class="classCart">
	                	<dt><strong>文体特长</strong></dt>
	                	<dd class="inf">
	                		<a>钢琴</a>
	                		<a>五子棋</a>
	                	</dd>
	                </dl>
	            </li>
	            <li>
	            	<dl class="classCart">
	                	<dt><strong>教学方式</strong></dt>
	                	<dd class="inf">
	                		 <a>线上教学</a>
	                         <a>老师上门</a>   
	                         <a>协商地点</a>
	                	</dd>
	                </dl>
	            </li>
	           </ul>
	        <input type="button" class="pxui-light-button addtocart" value="立即预约"/>
	        <h3 id="js-attrs-title">个人经历</h3>
	        <div class="attrs">
	        	<ul>
		        	<li>
		        		<i class="fa fa-circle fa-lg"></i>
		        		<div class="tittle">1983年09月 — 2014年09月</div>
		        		<div class="content" id="teadetails">三十多年的实践，构筑了个性化知识体系。广泛的兴趣爱好和个人魅力，形成了独特的教学风格，高中物理已经被我破解成点点滴滴的碎片,给你一根线,就能串连成当空舞的彩练, 跟我学，不会错。助你成功!</div>
		        	</li>
		            
	            </ul>
	        </div>
	
	        <h3>用户评论<a href="#">返回顶部<i class="arrow2-top"></i></a></h3>
	        <div id="js-comment-list">
	            <div class="comment-info">
	                <div><p>综合满意指数：<br>&nbsp;&nbsp;&nbsp;&nbsp;<b class="pxui-color-red">4.6</b> 分</p><span>评论人数：<br>&nbsp;&nbsp;&nbsp;&nbsp;206人</span></div>
	                &nbsp;大家认为：
	                <ul>
	                    <li>
	                        <p>教学质量：<i><del style="width:100%"></del></i><span>100%</span></p>
	                        <p>响应速度：<i><del style="width:100%"></del></i><span>100%</span></p>
	                        <p>服务质量：<i><del style="width:100%;"></del></i><span>100%</span></p>
	                    </li>
	                                    </ul>
	            </div>
	            <ul class="comment-list" id="js-commentlist"></ul>
	            <div class="pxui-show-more" lastid="1" template="#js-good-comment" srcProperty="commentsrc" container="#js-commentlist" url="/comment/ajax?good_id=445111&item_id=459537">
	                <img src="../template/images/public/loading.gif" width="24" height="24">
	                <a>查看更多 <i class="arrow2-bottom"></i></a>
	            </div>
	        </div>
        </div>
                <input value="加入收藏" class="pxui-gray-button" id="js-go-favorites" type="button"/>
                <div class="fixed-add-to-cart" id="js-fixed-add-to-cart">
            
        </div>
    </div>
</div>
<script>
	
</script>
<!--content-end-->
		</div>
     <div class="com-footer-area" id="js-com-footer-area">
			<div class="com-footer-nav">
				<a href="index.html">首页</a><a href="help/index.html">帮助中心</a><a href="feedback/index.html">反馈建议</a>
			</div>
			
        </div>


</body>
</html>
