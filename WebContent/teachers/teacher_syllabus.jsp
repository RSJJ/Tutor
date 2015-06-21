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
<link href="css/glDatePicker.default.css" rel="stylesheet" type="text/css"  /> 
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/glDatePicker.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/teacher_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_syllabus_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
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
        <jsp:include page="t_header.jsp"></jsp:include>
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
                    <jsp:include page="t_menu.jsp"></jsp:include>
                <div class="incrl">
                    <div class="incrlspacea" style="border-bottom:1px solid #D3D3D3 ">
                        <span class="incrlspacea1">我的课程表</span>
                        
                    </div>
<div id="layout">
<!-- 弹出框 start -->   
      <div gldp-el="mydate" style="width: 250px; height: 240px; display: block; position: absolute; margin-left: 95px; margin-top: 116px; z-index: 200;"></div>
      <div id="winDiv2">
        <div class="topDiv"><span class="fl">添加基础课程</span><span class="fr" id="close" onclick="closeDiv2()"><img src="images/close.jpg" /></span><div class="clear"></div></div>
        <div class="condiv">
        <table class="t_syl_table">
        	<tr>
        	<td>选择课程：</td>
        	<td><label><select style="width:200px;"><option>高一</option></select></label></td>
        	</tr>
        	<tr>
        	<td>选择日期：</td>
        	<td><input type="text" id="mydate" gldp-id="mydate"/>
			</td>
        	</tr>
        	<tr>
        	<td>选择时间：</td>
        	<td><label><select style="width:200px;"><option>6:00</option></select></label>--<label><select style="width:200px;"><option>23:00</option></select></label></td>
        	</tr>
        	<tr>
        	<td>时间周期：</td>
        	<td><label><select style="width:200px;"><option>两个月</option></select></label></td>
        	</tr>
        	<tr>
        	<td>上课模式：</td>
        	<td><label><select style="width:200px;"><option>线上模式</option></select></label></td>
        	</tr>
        </table>
          <div class="re_con4"><input name="" value="" type="button" class="btn_yz"></div>
        </div>
      </div>
 </div>
<!-- 弹出框 stop --> 
                    
                    <div class="kebiao fr" style="width:718px;">
	<div class="kb-top">
    	<ul class="qhz"> 
                <li  class="dqrq"><span class="rq0"></span><a href="#">10</a><span class="zj0"></span></li>
    		    <li><span class="rq1"></span><span class="zj1"></span></li>
                <li><span class="rq2"></span><span class="zj2"></span></li>
                <li><span class="rq3"></span><span class="zj3"></span></li>
    		    <li><span class="rq4"></span><span class="zj4"></span></li>
    		    <li><span class="rq5"></span><span class="zj5"></span></li>
    		    <li><span class="rq6"></span><span class="zj6"></span></li>
        </ul>
        <div class="kb-sz kb-sz1" style="width:183px;">
            <a href="#"  onclick="openDiv2()"><font size="+2" color="#FF9933">+</font>新时间</a>
          </div>
    </div>
	<div class="kb-con">
    	<div class="kb-l">
    	   <p class="yf"></p>
	       <p class="rq"></p> 
	       <p class="kjs">0节课</p>
        </div>
        <div class="xjkb">
        	<div class="xjkb-bt"><span>新建课表</span><p></p></div>
                <input type="hidden" name="courseType" id="courseType" value="iWantTeach" />
                <input type="hidden" name="onetooneprice" id="onetooneprice" value="70.0" />
				<input type="hidden" id="lastCheckbox" name="lastCheckbox" value=""/>
				<input type="hidden" name="curUser" id="curUser" value="" />
				<input type="hidden" id="firstTime" name="firstTime" value="2015-05-05">
		        <input type="hidden" id="lastTime" name="lastTime" value="2015-05-11">
		        <p><span>日期：</span>
                 <input style="width: 150px;" id="startTime" readonly="readonly" class="incmdmrldinput" type="text">
                 <input id="time5" class="w75 input" value="06:00" size="10" type="text"/>- 
	             <input id="time4" class="w75 input" value="00:00" size="10" type="text"/>
                 <select id="cstatus">
                    <option value="0">不循环</option>
                	<option value="1">循环一周</option>
                </select></p>
                <p><span>价格：</span><input type="text" name="oneprice" id="oneprice" value="70.0"/>元/半小时</p>
                <div class="xjkb-bc"><p id="bckb" onclick="addEvents();">保存</p></div>
            
        
        </div>
        <div class="kb-r" style="width:620px;">
           <div class="ktable">
             <p class="t">上午<span>(6:00-12:00)</span></p>
             <p class="xsj1"  onclick="openDiv2()"><font size="+2" color="#FF9933">+</font>新时间</p>
           </div>
            <div class="ktable">
             <p class="t">下午<span>(12:00-18:00)</span></p>
             <p class="xsj1"  onclick="openDiv2()"><font size="+2" color="#FF9933">+</font>新时间</p>
           </div>
            <table border="0" cellspacing="0" cellpadding="0">
               <tbody>
                 <tr class="t"><td colspan="2"><span>晚上</span>(18:00-24:00)</td></tr>
                 <tr><td>18:00-18:30</td><td class="gm" title=""><p id="p692926" style="cursor: pointer" onclick="">可购买</p></td></tr>
                 <tr><td>18:30-19:00</td><td class="gm" title=""><p id="p692927" style="cursor: pointer" onclick="">可购买</p></td></tr>
                 <tr><td>19:30-20:00</td><td class="gm huisebg" title="">纪蕴已购买</td></tr>
                 <tr><td>20:00-20:30</td><td class="gm huisebg" title="">纪蕴已购买</td></tr>
                 <tr><td>20:30-21:00</td><td class="gm huisebg" title="">纪蕴已购买</td></tr>
                 <tr><td>21:00-21:30</td><td class="gm huisebg" title="">d已购买</td></tr>
                 <tr><td>21:30-22:00</td><td class="gm huisebg" title="">d已购买</td></tr>
               </tbody>
             </table>
           <div class="clear"></div>
        </div>
    <div class="clear"></div>
    </div>
	<div class="clear"></div>
</div>
                <div>
                         
                         
                         
                </div>              
                </div>
                <div class="clear"></div>
            </div>
            <!--main-->
        </div>
        
      </div>
    
  </div>
  
<!--底部 start-->   
<jsp:include page="t_bottom.jsp"></jsp:include>
<!--底部 stop-->     
</div>

</body>
</html>
