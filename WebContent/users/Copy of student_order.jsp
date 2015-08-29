<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/erji.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/gwc.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_team_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<!-- 首页轮播图 start --> 


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
       <jsp:include page="s_header.jsp"></jsp:include>
      </div>
    </div>
<!--导航 stop-->   
<%=request.getAttribute("availableCourse")==null %>
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
      <div class="w_960">
       <div class="erji_te">首页>购物车</div>
        <div class="container" style="background:none;">
            <div class="zc_top"><div class="w_960 pl_10">我的购物车</div></div>
      <div class="gouwu">
      <div class="gouwu-con">
		<div class="th">
			<div class="th1"><input type="checkbox" id="checkall">全选</div>
			<div class="th2">课程图片</div>
			<div class="th3">课程名称</div>
			<div class="th4">原价</div>
			<div class="th5">优惠价</div>
			<div class="th6">返现/送积分</div>
			<div class="th7">操作</div>
         </div>
    
		<div class="th-nr" style="line-height: 100px;">
			<div class="th-nr1" style="padding-top: 50px;"><p><input type="checkbox" name="test[]" value="306663"></p></div>
			<div class="th-nr2">
			     <a href="#"><img src="images/201410297130648.607.jpg" width="125px" height="100px"></a>
			</div>
			<div class="th-nr3" style="padding-top: 25px; line-height: 20px;">
				<p>
				教师：崔德顺
				</p>
				<p>
					 <a href="#">网络家教：2015-05-06 19:00-19:30</a><br>
		        </p>
			</div>
			<div class="th-nr4">￥70.0</div>
			<div class="th-nr5">￥70.0</div>
			<div class="th-nr6">0</div>
			<div class="th-nr7" style="line-height: 20px; padding-top: 25px;">
			   <a href="#" onclick="">删除</a>
			   <a href="javascript:void(0);" onclick="">收藏</a></div>		
		    <div class="clear"></div>
		</div>
	 	
		<div class="gouwu-b">
			<div class="gouwu-b1">
				<p><a href="javascript:void(0);">删除选择商品</a></p>
				<div class="fr"><span>1</span>件商品&nbsp;&nbsp;总计：<span class="pr1">￥70.0</span>
				</div>
			</div>
	        <div class="gouwu-b2">总计<span>￥70.0</span></div>		
        </div>
        
        </div>
       <div class="shop"><a href="#" class="goon">继续购物</a><a href="#" onclick="" class="jies">去 结 算</a></div> 
       
       <div class="interest">
			<div class="interest-top"><span>你感兴趣的老师</span></div>
		    <p><a href="#"><img src="images/201309249191912.896_small.jpg"><span>轩轩</span></a></p>
			  <p><a href="#"><img src="images/201410297130648.607.jpg"><span>崔德顺</span></a></p>
			  <p><a href="#"><img src="images/201410290152239.052.jpg"><span>悠然南山</span></a></p>
			  <p><a href="#"><img src="images/201410290135412.470.jpg"><span>罗老师</span></a></p>
			  <p><a href="#"><img src="images/201411328135746.198.jpg"><span>宗伟</span></a></p>
			 <p><a href="#"><img src="images/201412346101642.508.jpg"><span>叶宏</span></a></p>
		<div class="clear"></div>
		
		</div>
      </div>   
	</div>
    </div>
    
  </div>

  
<!--底部 start-->   
<jsp:include page="s_bottom.jsp"></jsp:include>
<!--底部 stop-->     
</div>

</body>
</html>