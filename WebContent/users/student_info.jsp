<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tutor.entity.server.*" %>
    <%@ page import="com.tutor.entity.*" %>
    <%
    	User user = (User)session.getAttribute("user");
    	Student student = null;
    	if(user != null)
    	{
    		student = (Student)user.getUser();
    	}

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/erji.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/gwc.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/s_info.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_team_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/s_info.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/uploadPreview.js" type="text/javascript"language="javascript"></script>

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
                                  <a href="javascript:void(0);" class="user"><%=student.getName()%></a>   
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
                            <p><a href="#">基本信息</a></p>
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
                        <span class="incrlspacea1">基本信息</span>
                        
                    </div>
                    
                     <form id="register_form" name="register_form" method="post" action="dsRegister" enctype="multipart/form-data" onSubmit="return checkRegisterForm()">
                    <div style="margin-left: 170px;">
                         <div class="grkjhr p_t10"></div>
                         <div class="erji_te zc_top1">个人资料</div>
                         <div class="dlk dlk2">
              <div class="dltab dltab2" style="width:600px; margin-left:50px;">
             
                <table width="600" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="40" align="right">真实姓名：</td>
                    <td height="40" colspan="2" align="left"><input class="tekang" type="text" name="student.name" id="textfield" /></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="40" align="right">性　别：</td>
                    <td height="40" colspan="2" align="left">
                        <input type="radio" name="radio" id="radio" name="student.sex" class="sexRadio" />男&nbsp;&nbsp;<input type="radio" name="student.sex" id="radio" value="radio" />女</td>
                    <td width="282" height="40" align="left">&nbsp;</td>
                  </tr>

                  <tr>
                    <td height="40" align="right">邮　箱：</td>
                    <td height="40" colspan="2" align="left"><input class="tekang" type="text" name="student.mail" id="email" value="<%=student.getMail()==null?"":student.getMail()%>"/></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="40" align="right">手　机：</td>
                    <td height="40" colspan="2" align="left"><input readonly="readonly" class="tekang" type="text" name="student.phone" id="phone" value="<%=student.getPhone()==null?"":student.getPhone()%>"/></td>
                    <td height="40" align="left"></td>
                  </tr>
                 <!--  <tr>
                    <td height="40" align="right">手　机：</td>
                    <td width="153" height="40" align="left"><input class="tekang" type="text" style="width:150px;" /></td>
                    <td width="92" align="left"><span style="font-size:12px; background:#CCC; width:80px; padding:0 2px; display:block; text-align:center;">获取验证码</span></td>
                    <td height="40" align="left"><input class="tekang" type="text" value="请输入验证码" style="width:80px; color:#CCC;" />&nbsp;&nbsp;<a href="#" class="xg_a">确认</a></td>
                  </tr> -->
                  <tr>
                    <td height="40" align="right">所在地区：</td>
                    <td height="40" colspan="2" align="left" ><select id="selProvince" onchange="provinceChange();"></select>&nbsp;&nbsp;<select id="selCity" name="student.address"></select></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="40" align="right">详细地址：</td>
                    <td height="40" colspan="2" align="left"><input class="tekang" type="text" name="student.detailedAddress" id="det_address" /></td>
                    <td height="40" align="left"></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">所在年级：</td>
                    <td height="40" colspan="2" align="left"><select  name="student.grade" id="grade">
                      <option>高一</option>
                      <option>高二</option>
                      <option>高三</option>
                    </select></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                </table>
           
              </div>
            </div>
            
            <div>
            	<div class="erji_te zc_top1">上传头像</div>
                <div class="inckjcontca myleft" style="padding-left:50px;">
                	<div class="inckjcontcalr myimg">
                    	<a href="javascript:fn_browse();" title="上传" ><img style="width:100px; height:100px; margin-left:0" id="image" src="images/incimg12.gif"></a>
                    	<a href="javascript:void(0)" class="upload_a"><img src="images/xztp.jpg"/>&nbsp;*<input type="file" id="upload_file" name="student.introduction"></a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
           <div class="erji_te zc_top1"></div>
           <div class="w_960">
           	<input name="" type="checkbox" value="" checked/>同意用户协议<br />
           	<input type="submit"  value="确   定" class="zc_btn" id="zc_btn"/>
           </div>  
                    </div>
                    
             </form>
                    
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
