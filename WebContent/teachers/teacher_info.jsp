<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String phone=(String)request.getAttribute("phone");
    	String mail=(String)request.getAttribute("mail");

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/erji.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<link href="css/t_info.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/t_info.js" type="text/javascript" charset="utf-8" language="javascript"></script>
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
  		<jsp:include page="t_header.jsp"></jsp:include>
      </div>
    </div>
<!--导航 stop-->   

 <!--微信 start
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
 
微信 stop  -->  

    <div class="main" style="background:#fff; padding-bottom:20px;">
	<form id="reg_form" name="reg_form" method="post" action="dtRegister" enctype="multipart/form-data" onSubmit="return checkRegForm()">
		<div class="erji_te w_960">首页>教师注册</div>
        <div class="container" style="background:none;">
            <div class="zc_top"><div class="w_960">基本信息</div></div>
            <div class="erji_te zc_top1 w_960">个人资料</div>
            <div class="dlk dlk2">
              <div class="dltab dltab2">
                <table width="650" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="75" height="40" align="right">真实姓名：</td>
                    <td width="233" height="40" align="left"><input class="tekang" type="text" name="teacher.name" id="textfield" /></td>
                    <td width="342" height="40" align="left"><span style="color:#F00">*</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">性　别：</td>
                    <td height="40" align="left">
                        <input type="radio" name="teacher.sex" class="sexRadio" value="男" checked="checked" />男&nbsp;&nbsp;<input type="radio" name="sexRadio" class="sexRadio" value="女" />女</td>
                    <td height="40" align="left"><span  style="color:#F00">*</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">邮　箱：</td>
                    <td height="40" align="left"><input readonly="readonly" class="tekang" type="text" name="teacher.mail" id="email" value="<%=mail==null?"":mail%>"/></td>
                    <td height="40" align="left"><span  style="color:#F00">*</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">手　机：</td>
                    <td height="40" align="left"><input readonly="readonly" class="tekang" type="text" name="teacher.phone" id="phone" value="<%=phone==null?"":phone%>"/></td>
                    <td height="40" align="left"><span  style="color:#F00">*</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">所在地区：</td>
                    <td height="40" align="left" ><select id="selProvince" onchange="provinceChange();"></select>&nbsp;&nbsp;<select id="selCity" name="teacher.address"></select></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="40" align="right">详细地址：</td>
                    <td height="40" align="left"><input class="tekang" type="text" name="teacher.detailedAddress" id="det_address" /></td>
                    <td height="40" align="left"><span  style="color:#F00">*</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">职　业：</td>
                    <td height="40" align="left"><select name="teacher.job" id="profession"><option>老师</option><option>本科</option><option>研究生</option></select></td>
                    <td height="40" align="left">&nbsp;</td>
                  </tr>
                </table>
              </div>
            </div>
            
            <div class="erji_te zc_top1 w_960">认证信息</div>
            <div class="dlk dlk2">
              <div class="dltab dltab2">
                <table width="650" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="75" height="40" rowspan="2" align="right">上传头像：</td>
                    <td width="88" height="40" rowspan="2" align="left"><a href="javascript:fn_browse1();" title="上传" ><img id="img_file1" class="img_file" src="images/tj.jpg" /></a></td>
                    <td width="487" height="45" align="left"></td>
                  </tr>
                  <tr>
                    <td height="47" align="left" style="color:#F00;"><a href="javascript:void(0);" class="up_a"><img src="images/xztp.jpg"/>&nbsp;*<input type="file" id="up_file1" name="teacher.iconphoto"></a></td>
                  </tr>
                  <tr>
                    <td width="75" height="40" rowspan="2" align="right">上传头像：</td>
                    <td width="88" height="40" rowspan="2" align="left"><a href="javascript:fn_browse2();" title="上传" ><img id="img_file2" class="img_file" src="images/tj.jpg" /></a></td>
                    <td width="487" height="45" align="left" style="font-size:12px;"><span style="color:#F00;">&nbsp;*</span> 上传工作证或学生证</td>
                  </tr>
                  <tr>
                    <td height="50" align="left" style="color:#F00;"><a href="javascript:void(0);" class="up_a"><img src="images/xztp.jpg"/>&nbsp;*<input type="file" id="up_file2" name="teacher.licencephoto"></a></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">简　介：</td>
                    <td height="40" colspan="2" align="left"><textarea name="teacher.instroduction" id="textarea1" cols="45" rows="5"></textarea>
                      <span style="color:#F00;">&nbsp;*</span><span style="color:#CCC">请输入50-100字的简介</span></td>
                  </tr>
                  <tr>
                    <td height="40" align="right">详细介绍：</td>
                    <td height="40" colspan="2" align="left"><textarea name="teacher.detailed_introduction" id="textarea2" cols="45" rows="5"></textarea>
                      <span style="color:#F00;">&nbsp;*</span><span style="color:#CCC">请输入500-1000字的简介</span></td>
                  </tr>
                </table>
              </div>
            </div>
            
            <div class="erji_te zc_top1 w_960">结账信息</div>
        <div class="dlk dlk2">
              <div class="dltab dltab2">
                <table width="650" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="40" align="right">中国银行：</td>
                    <td width="487" height="40" align="left"><input class="tekang" type="text" name="teacher.cardNo" id="bankCard" /><span style="color:#F00;">&nbsp;*</span></td>
                  </tr>
                </table>
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
  
  
  
<!--底部 start-->   
<jsp:include page="t_bottom.jsp"></jsp:include>
<!--底部 stop-->     
</div>

</body>
</html>