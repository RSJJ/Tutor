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
       <div class="erji_te">首页>学员个人中心</div>
        <div class="container" style="background:none;">
          <div class="grkj">
              <div class="grkj-top clearfix">
                          <div class="grkj-l">
                              <p class="tx">
                                  <img alt="花花" title="花花" src="images/incimg12.gif">
                              </p>
                              <p class="nrxx"> 
                                  <a href="javascript:void(0);" class="user">花花</a>   
                              </p>
                          </div>
                          <div class="grkj-r">
                              <ul class="clearfix">
                                  <li><a href="/cart/shopcart.html">购物车<span>1</span> <b>1</b></a></li>
                                  <li><a href="/space/remindlist.html"><span>0</span>个提醒</a></li>
                                  <li class="y">
                                          <a href="/space/kjwdyyjl.html?state=2"><span>0</span>个预约</a>  
                                  </li>
                                  <li class="y"><a href="#">进入教室</a></li>
                            </ul>
                          
                          </div>
                      </div>
                  </div>
	    </div>
        
        <div class="main maingr">
	<!--main-->
            <div class="incmain">
                    <div class="inclra">
                    <!--2-->
                    <div class="guding">
                    <div class="inclrspaceb">
                        <div class="inclrspaceb1">
                            <h3 class="left2"><span class="c2">我的学习记录</span></h3>
                            <p><a href="#" class="inckjyenowred inckjyenowredg">线上上课记录</a></p>
                            <p><a href="#">线下上课记录</a></p>
                        </div>
                        <div class="inclrspaceb1">
                            <h3 class="left2"><span class="c2">我的个人信息</span></h3>
                            <p><a href="personal_student_info.jsp">基本信息</a></p>
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
                <div class="incrl">
                    <div class="incrlspacea" style="border-bottom:1px solid #D3D3D3 ">
                        <span class="incrlspacea1">我学的网络家教</span>
                        
                    </div>
                    <div>
<!--                        <ul id="maintab" class="shadetabsdd">
                            <li class="selected">
                                <a href="/space/kjwdmdm.html?courseType=iWantTeach&amp;payStatus=1" rel="tcontent11">我的订单</a>
                            </li>
                            <li>
                                <a href="/space/kjwdmdm.html?courseType=iWantTeach&amp;payStatus=2" rel="tcontent16">已支付</a>
                            </li>
                            <li>
                                <a href="/space/kjwdmdm.html?courseType=iWantTeach&amp;payStatus=0" rel="tcontent16">待支付</a>
                            </li>
                            <li class="grkjhr"></li>
                      </ul>-->
                         <div class="grkjhr p_t10"></div>
                        <div class="tabcontentstyledd top0">
                                <div id="tcontent14">
                                    <div>
                                        <div class="incwdddcona">
                                            <div class="incwdddcona1">
                                                订单编号
                                            </div>
                                            <div class="incwdddcona2" style="width: 100px;">
                                                开课人
                                            </div>
                                            <div class="incwdddcona4">
                                                开课时间
                                            </div>
                                            <div class="incwdddcona5" style="width: 70px;">
                                                价格
                                            </div>
                                            <div class="incwdddcona6">
                                                购买时间
                                            </div>
                                            <div class="incwdddcona7">
                                                操作
                                            </div>
                                            <div class="clear"></div>
                                        </div>   
                                        
                                        <div class="incwdddconb">
                                            <div class="incwdddconb1">
                                                12345678
                                            </div>
                                            <div class="incwdddconb2" style="width: 100px;">
                                                <p><img src="images/123.jpg" /><br />
                                                李宏伟</p>
                                            </div>
                                            <div class="incwdddconb4">
                                                2015-05-06 20:05
                                            </div>
                                            <div class="incwdddconb5" style="width: 70px;">
                                                70.00
                                            </div>
                                            <div class="incwdddconb6">
                                                2015-05-05
                                            </div>
                                            <div class="incwdddconb7">
                                                <a href="#" onclick="" class="inckjbutton12">已结束</a>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        
                                        <div class="incwdddconb">
                                            <div class="incwdddconb1">
                                                12345678
                                            </div>
                                            <div class="incwdddconb2" style="width: 100px;">
                                                <p><img src="images/123.jpg"/><br />
                                                李宏伟</p>
                                            </div>
                                            <div class="incwdddconb4">
                                                2015-05-06 20:05
                                            </div>
                                            <div class="incwdddconb5" style="width: 70px;">
                                                70.00
                                            </div>
                                            <div class="incwdddconb6">
                                                2015-05-05
                                            </div>
                                            <div class="incwdddconb7">
                                                <a href="#" onclick="" class="inckjbutton12">已结束</a>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        
                                        <div class="incwdddconb">
                                            <div class="incwdddconb1">
                                                12345678
                                            </div>
                                            <div class="incwdddconb2" style="width: 100px;">
                                                <p><img src="images/123.jpg"/><br />
                                                李宏伟</p>
                                            </div>
                                            <div class="incwdddconb4">
                                                2015-05-06 20:05
                                            </div>
                                            <div class="incwdddconb5" style="width: 70px;">
                                                70.00
                                            </div>
                                            <div class="incwdddconb6">
                                                2015-05-05
                                            </div>
                                            <div class="incwdddconb7">
                                                <a href="#" onclick="" class="inckjbutton12">已结束</a>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                                                          
                                    </div>
                                    
                                    <div class="page">
                                       <ul>
                                          <li class="page_sy" style="width:40px;"><a href="#">首页</a></li>
                                          <li style="width:54px;"><a href="#">上一页</a></li>
                                          <li><a href="#">1</a></li>
                                          <li><a href="#">2</a></li>
                                          <li><a href="#">3</a></li>
                                          <li><a href="#">4</a></li>
                                          <li><a href="#">5</a></li>
                                          <li style="border:none"><a href="#">...</a></li>
                                          <li><a href="#">80</a></li>
                                          <li style="width:54px;"><a href="#">下一页></a></li>
                                          <li class="page_sy" style="width:40px;"><a href="#">末页</a></li>
                                          <div class="clear"></div>
                                       </ul>
                                    </div>
                    
                                </div>
                        </div>
                    </div>
                    
                    
                    
                </div>
                <div class="clear"></div>
            </div>
            <!--main-->
        </div>
        
      </div>
    
  </div>

  
<!--底部 start-->   
<jsp:include page="s_bottom.jsp"></jsp:include>
<!--底部 stop-->     
</div>

</body>
</html>