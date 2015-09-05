<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
        <title>教师个人信息完善</title>
        <meta charset="utf-8">
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
        <link type="text/css" rel="stylesheet" href="../template/css/register/register.css"/>
		<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=r6bfCVxPZTpoKGGNthyuupYh"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
		<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
		<script type="text/javascript">
			jQuery.browser={};
			(function(){jQuery.browser.msie=false; 
			jQuery.browser.version=0;
			if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ 
				jQuery.browser.msie=true;
				jQuery.browser.version=RegExp.$1;}
			})();
		</script>
      
        <script src="../template/js/com/com.js"></script>
        <script src="../template/js/login/px-verify.js"></script>
        <script src="../template/js/com/template.js"></script>
        <script type="text/javascript" src="../template/js/com/nicEdit.js"></script>
        <script type="text/javascript" src="../template/js/com/bootstrap.min.js"></script>
		<!--<script src="/template/js/com/jquery.snow.min.js"></script></script>-->
		<script src="../template/js/register/t_info.js" type="text/javascript" charset="utf-8" language="javascript"></script>
		<script src="../template/js/register/uploadPreview.js" type="text/javascript" language="javascript"></script>
		
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
          <!--content-->
         <div class="com-content-area" id="js-com-content-area">
		<div class="page-role">
			<div class="page-title"><a href="javascript:history.back();void(0)" class="return">返 回</a>完善个人信息<a href="../login/default.htm">登录<i></i></a></div>
			
			<form class="pxui-form-info" id="reg_form" name="reg_form" method="post" action="dtRegisterPhone" enctype="multipart/form-data" onSubmit="return checkRegForm()">
				<p class="error-msg" id="js-error-msg"></p>
				<hr>
				<h3>个人资料<em>(必填)</em></h3>
				<div>
					<span>姓名：</span><p>
		            <input type="text" id="textfield" name="teacher.name"/></p>
				</div>
				<div id="sex">
					<span>性别：</span><p>
					  <input type="checkbox" class="radio"  value="男" checked="checked">男&nbsp;&nbsp;&nbsp;
					  <input type="checkbox" class="radio"  value="女">女</p>
				</div>
				<script type="text/javascript">
					
				</script>
				<div>
					<span>手机：</span><p>
		            <input readOnly=<%=request.getParameter("phone")==null?"":"readonly"%> value="<%=request.getParameter("phone")==null?"":request.getParameter("phone") %>" class="tekang" type="text" name="teacher.phone" id="phone" /></p>
				</div>
				<div>
					<span>邮箱：</span><p>
					<input readOnly=<%=request.getParameter("email")==null?"":"readonly"%> value="<%=request.getParameter("email")==null?"":request.getParameter("email") %>" class="tekang" type="text" name="teacher.mail" id="email"/></p>
				</div>
				<div>
					<span>地区：</span><p>
					<select id="selProvince" name="teacher.city" onchange="provinceChange();">
					</select>&nbsp;&nbsp;
					<select id="selCity" name="teacher.address"></select>
					<!--<i id='position'></i>
					<input readOnly="readonly" class="tekang" type="hidden" name="teacher.address"  />  --></p>
				</div>
				<div>
					<span>地址：</span><p>
					<input class="tekang" type="text" name="teacher.detailedAddress" id="det_address" /></p>
				</div>
				<div id="job">
					<span>职业：</span><p>
		            <input type="button" onclick="inp()" value="在校学生" />
		            <input type="button" onclick="inp1()" value="在职教师"  /></p>
		            <div id="zzxs_" >
		            	<span>所在学校：</span>
		                <input placeholder="如：北京交通大学" type="text" name="teacher.school"/><br>
		                <span>所在专业：</span>
		                <input placeholder="如：计算机科学" type="text" name="teacher.profession"/>                      
		            </div>
				</div>
				<hr>
				<h3>认证信息</h3>
				<table>
					<tr>
                    <td><span>头像：</span></td>
                    <td width="88" height="40" rowspan="2" align="left">
	                    <a href="javascript:fn_browse1();" title="上传" >
	                    <img id="img_file1" class="img_file" src="../template/images/login/tj.jpg" />
	                    </a>
                    </td>
                    <td width="487" height="45" align="left">（请上传您的个人头像）</td>
                  </tr>
                  <tr>
                    <td height="47" align="left" style="color:#F00;">
	                    <a href="javascript:void(0);" class="up_a">
	                    <input type="file" id="up_file1" name="teacher.iconphoto">
	                    </a>
                    </td>
                  </tr>
                  <tr>
                    <td><span>身份证明：</span></td>
                    <td width="88" height="40" rowspan="2" align="left">
	                    <a href="javascript:fn_browse2();" title="上传" >
	                    <img id="img_file2" class="img_file" src="../template/images/login/tj.jpg" />
	                    </a>
                    </td>
                    <td width="487" height="45" align="left">（请上传您的学生证或工作证）</td>
                  </tr>
                  <tr>
                    <td height="50" align="left" style="color:#F00;">
	                    <a href="javascript:void(0);" class="up_a">
		                    <input type="file" id="up_file2" name="teacher.licencephoto">
	                    </a>
                    </td>
                  </tr>
				</table>
				
				<div id="report2" style="margin-left:15%;"></div>
				<div>
					<span>个人简介：</span><p>
					<textarea rows="3" cols="20" placeholder="个人简介"  name="teacher.introduction" id="textarea1" ></textarea>
					</p>
				</div>
				<div>
					<span>详细介绍：</span>
					<p style="background-color:white;">
						<textarea style="height: 100px;" cols="50" name="teacher.detailedIntroduction" id="textarea2" placeholder="详细介绍：如某年某月某日，得到什么奖项"></textarea>
					</p>
				</div>
				<hr>
				<h3>结账信息</h3>
				<div>
					<span>银行账户：</span><p>
					<input  placeholder="请填入银行账户，以便将您的收入打入该账户" name="teacher.cardNo" id="bankCard"  type="text"/></p>
				</div>
				<div>
					<span>开户银行：</span><p>
					<input  placeholder="开户银行地址" name="teacher.cardType"  type="text"/></p>
				</div>
				<input type="hidden" name="teacher.lng">
				<input type="hidden" name="teacher.lat">
				<input type="hidden" name="teacher.sex" value="男">
				<input type="hidden" name="teacher.job" value="在校学生">
				<div>
					<span>&nbsp;</span>
					<span><input type="submit" value="保存信息"  class="pxui-light-button"/></span>
					<span>&nbsp;</span>
				</div>
			</form>
		</div>
<!--content-end-->
	</div>
<script>
$("#job p input").click(function(){
	$("[name='teacher.job']").val($(this).val());
	$(this).addClass("active");
	$(this).siblings().removeClass("active");
})

function inp(){
	document.getElementById("zzxs_").style.display = "block";
	$()
	$("#zzxs_ span:eq(1)").html("所学专业：")
}
function inp1(){
	document.getElementById("zzxs_").style.display = "block"; 
	$("#zzxs_ span:eq(1)").html("所教课程：");
}
var position_option = {
		
        enableHighAccuracy: true,

        maximumAge: 30000,

        timeout: 20000

    };
//window.addEventListener('push', myFunction);
function getLocation(){
    if (window.navigator.geolocation){
	    window.navigator.geolocation.getCurrentPosition(getPositionSuccess, getPositionError, position_option)
        //window.navigator.geolocation.watchPosition(getPositionSuccess,getPositionError,position_option);
   //获取不稳定，可以设置超时时间
    }else{
        alert("Geolocation is not supported by this browser.");
    }
}

function getPositionSuccess( position ){
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        var point = new BMap.Point(lng, lat);
        //map.centerAndZoom(point, 12);  
	  	BMap.Convertor.translate(point,0,translateCallback);     //真实经纬度转成百度坐标
       	//alert( "您所在的位置： 纬度" + lat + "，经度" + lng );
       // posToAddr(point);
}        

//坐标转换完之后的回调函数
function translateCallback(point1){
	//alert( "您所在的位置： 纬度" + point1.lat + "，经度" + point1.lng );
	//posToAddr(point1);
	$("[name='teacher.lng']").val(point1.lng);
	$("[name='teacher.lat']").val(point1.lat);
}

function getPositionError(error) {
    switch (error.code) {
        case error.TIMEOUT:
            alert("连接超时，请重试")
            break;
        case error.PERMISSION_DENIED:
            alert("您拒绝了使用位置共享服务，无法获取您的位置");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("获取位置信息失败");
            break;
    }
}
function posToAddr(point){
	var geoc = new BMap.Geocoder();      
	var pt = point;
	geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			$("[name='province']").val(addComp.city)
			$("[name='city']").val(addComp.district)
			$("#position").html( addComp.city+ addComp.district  + addComp.street + addComp.streetNumber);
	});   
} 

$(document).ready(function(){
	getLocation();
	$("#sex p input").click(function(){
		if($(this).is(':checked')){
			$("[name='teacher.sex']").val($(this).val());
			$(this).siblings().prop("checked","");
		}
	})
	$('#introduction').css({ 'height': '80px'});
	bkLib.onDomLoaded(function() {
		new nicEditor({fullPanel : true,iconsPath : '../template/images/public/nicEditorIcons.png'}).panelInstance('details');
	});
 });
</script>
</body>
</html>