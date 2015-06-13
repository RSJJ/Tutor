<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员登录_学纷享会员登录中心</title>
    <meta name="keywords" content="会员登录,学纷享会员登录,学纷享会员登陆,学纷享登录" />
    <meta name="description" content="学纷享无忧英语用户登录入口,可以通过邮箱注册,激活邮件登录或者手机号码验证,获取登录密码输入即可.登录方式还可使用新浪微博账号或者QQ账号直接登录."/>
</head>

<body>
<div class="container"> <link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/index_register.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.scrollto.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/placeholder.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/login_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>

<!--[if IE 6]>
<script src="js/new_user/background.png.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<![endif]-->

<!-- 用户中心文件 -->

<div class="header_2" style="width:960px; margin:0 auto">
	<jsp:include page="header.jsp"></jsp:include>
</div>
                
<div class="floatDiv">
     <div class="floatDivOne">
         <div class="theFirst"><img src="images/zxzx.png" /></div>
         <div class="theLast">
             <img onClick="javascript:window.open('http://bizapp.qq.com/webc.htm?new=0&sid=938076608&o=b.qq.com&q=7', '_blank', 'height=544px, width=644px,toolbar=no,scrollbars=no,menubar=no,status=no');" target="_blank" src="images/intalker.jpg" />
         </div>
     </div>
     <div class="floatDivTwo">
         <div class="theFirstTwo"><img src="images/wexin_4.png" /></div>
         <div class="theLastTwo"><img src="images/weixin_2.png" /></div>
     </div>
 </div>
            
    <div class="main">
        
        <div class="login_api">
                                </div>
        
        <div class="bg_page" style="width:1280px; padding:90px 0;">
            <div class="content">
                <div class="box_reg" style="border:1px solid #D5D2D2;">
                    <div class="pic_reg"><img src="images/register.jpg" style="width:450px;" /></div>
                    <div class="txt_reg">
                        <form name="RegForm" method="post" action="do_login.php" id="regForm" >
                        <ul class="ul_reg">
                            <li class="f_c">邮箱/已验证手机号：</li>
                            <li class="inputBar bg_id"><input name="user_name" id="user_name" type="text" value="" style="*+height:25px;" /></li>
                            <li class="f_c">密码：</li>
                            <li class="inputBar bg_pass"><input name="password" type="password" id="password" style="*+height:25px;"  /></li>
                            <li class="m_t10"><span class="f_l"><input type="checkbox" name="aotu_login" id="aotu_login" style="width:16px; height:16px; float:left; _float:none; margin-top:6px;" />&nbsp;记住密码</span><a href="get_pass.php" target="_blank" class="f_r f_y">忘记密码</a></li>
                            <input type="hidden" name="from_url" value="" />
                            <li class="a_reg2">
                                <input type="submit" class="new_login_submit" value="  " style="border:0" />
                                <!--<a href="javascript:void(0)" id="submitReg" class="f_w"><font class="f_l">登录</font><font class="f_r">></font></a>-->
                            </li>
                            <li class="m_t10">
                                <a class="login_sina_api" href="https://api.weibo.com/oauth2/authorize?client_id=3633189220&redirect_uri=http%3A%2F%2Fwww.51talk.com%2Fapp_login%2Fcallback.php&response_type=code"><img style="float:left; margin-bottom:10px;}" src="images/weibo_login.png" alt="新浪微博登录" title="新浪微博登录"></a>
                                <a class="login_qq_api" href="../app_login/qq/qq_login.php" target="_blank" rel="nofollow"><img style="float:left;" src="images/qq_login.png" alt="QQ登录" title="QQ登录"></a>
                            </li>
                            <li class="m_t1"><a href="userregister.jsp" class="f_r">新会员注册></a></li>
                        </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/placeholder.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<div class="main b_g20" style=" background:url(images/bg3.gif) repeat-y center #737373;">
    <div class="content">
        <form name="FooterRegForm" method="post" action="/user/do_register.php" id='FooterRegForm' >
        <ul class="reg_ul">
            <li class="f_18 f_w m_r10" style="width:130px;">现在就注册:</li>
            <li class="m_r10">
                <input class="f_l f_g20" type="text"  name="user_name" id="footer_user_name" placeholder="请填写邮箱" />
            </li>
            <li class="m_r10">
                <input class="f_r f_g20" type="password"  name="password" id='footer_password' placeholder='请填写密码'/>
            </li>
            <li class="m_r10">
                <input class="f_l f_g20" type="text" name="mobile" id='footer_mobile' placeholder="请填写手机号" />
            </li>
            <li class="m_r10">
                <input class="f_r f_g20" type="text" name="recommen_mobile" placeholder="推荐人手机号/推荐码" />
            </li>
            <input type='hidden' name='register_from' value='3' />
            <li class="f_r"><a href="javascript:void(0)" id='footerCheckRegForm' class="btn_a" style="width:157px; height:24px; font-size:14px; line-height:22px;"><font class="f_l">完成注册</font><font class="f_r">></font></a></li>
        </ul>
        </form>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>

<!-- 百度统计 start -->
    <!-- <span style="display:none">
        
            <script>
                var _hmt = _hmt || [];
                (function() {
                    var hm = document.createElement("script");
                    hm.src = "//hm.baidu.com/hm.js?cd5cd03181b14b3269f31c9cc8fe277f";
                    var s = document.getElementsByTagName("script")[0]; 
                    s.parentNode.insertBefore(hm, s);
                })();
            </script>
        
    </span> -->
<!-- 百度统计 end -->


   <!--  <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-30549090-1']);
        _gaq.push(['_setDomainName', '51talk.com']);
        _gaq.push(['_setAllowLinker', true]);
        _gaq.push(['_setCampNameKey', 'hmpl']);
        _gaq.push(['_setCampSourceKey', 'hmsr']);
        _gaq.push(['_setCampMediumKey', 'hmmd']);
        _gaq.push(['_setCampTermKey', 'hmkw']);
        _gaq.push(['_setCampContentKey', 'hmci']);
        
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script> -->



<!-- <div id="qqzx">
    <a href="javascript:void(0)" id="qqzx_close" alt="关闭"></a>
    <a href="javascript:void(0)" id="qqzx_open" alt="点击咨询" target="_blank"></a>
</div>

    <script>
        var tag_name = "";
    </script>
    
    <script>
        $(function(){
            var status = getCookie('qqzx_close');
            if( status != 'close' && ( tag_name == 'index' || tag_name == 'teacher' || tag_name == 'summary' || tag_name == 'guide' || tag_name == 'student' )){
                var timerDialg = setTimeout(function(){ $("#qqzx").show(); newtext(); },30000);
				$(".focusSlide,.fancyBox_newDialg").live("click",function(){
                     clearTimeout(timerDialg);
				});
              /*  $.post('/ajax/ajax_statistics_qqzx.php',{'type':1},function( data ){
                    return ;
                });*/
            }
            
            //关闭客服弹框
            $("#qqzx_close").click(function(){
                setCookie('qqzx_close','close',1);
                $("#qqzx").hide();
            })
            //统计qqzx
            $("#qqzx_open").click(function(){
                window.open('http://bizapp.qq.com/webc.htm?new=0&sid=938076608&o=b.qq.com&q=7', '_blank', 'height=544px, width=644px,toolbar=no,scrollbars=no,menubar=no,status=no');
               /* $.post('/ajax/ajax_statistics_qqzx.php',{'type':2},function( data ){
                    if (data) {
                        console.log(data);
                    };
                });*/
            })
        })
        
        var text=document.title;
        var timerID;
        function newtext() {
            clearTimeout(timerID);
            document.title=text.substring(1,text.length)+text.substring(0,1);
            text=document.title.substring(0,text.length);
            timerID = setTimeout("newtext()", 300);
        }
    </script> -->
    
 </div>

</body>
</html>
