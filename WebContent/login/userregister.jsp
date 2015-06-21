<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学纷享无忧英语,网上平价英语培训专家,真人外教一对一在线英语培训</title>
    <meta name="keywords" content="英语培训，外教一对一，在线英语培训，学纷享，学纷享无忧英语" />
    <meta name="description" content="学纷享，专注于真人一对一在线培训，是国内领先家教培训学校。学纷享提供各级培训课程。"/>
</head>

<body>
    <div class="container"> <link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/index_register.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.scrollto.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/placeholder.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/register_js.js" type="text/javascript" charset="utf-8" language="javascript"></script>

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
            <div class="bg_page" style="width:1280px;">
                <div class="content">
                    <div class="box_reg2">
                        <div class="title m_b20">
                            <span class="f_l f_28" style="line-height:30px;">会员注册</span>
                            <span class="f_r f_16" style="line-height:30px;">
                                <font class="f_l">已有学纷享帐号？<a href="userlogin.jsp" class="f_y">登录 ></a></font>
                            </span>
                        </div>
                        <div class="title m_b30">
                            只需10秒完成注册，登录会员中心即可立即预约！
                                                                                </div>
                        <form action="do_register.php" method="post" name="RegForm" id="regForm" accept-charset="UTF-8">
                            <ul class="ul_reg2">
                                <li>
                                    <span class="name_reg"><b>*&nbsp;</b>登录邮箱：</span>
                                    <input onfocus="showDesc('register_user_name');" onblur="checkRegisterContent('register_user_name');" name="user_name" id="register_user_name" type="text" size="" class="input_reg"/>
                                    <span id="register_user_name_desc" class="tips">请输入登录邮箱</span>
                                </li>
                                <li>
                                    <span class="name_reg"><b>*&nbsp;</b>密码：</span>
                                    <input onfocus="showDesc('register_password');" onblur="checkRegisterContent('register_password');" name="password" id="register_password" type="password" class="input_reg"/>
                                    <span id="register_password_desc" class="tips">请输入没密码</span>
                                </li>
                                <li>
                                    <span class="name_reg"><b>*&nbsp;</b>手机号：</span>
                                    <input onfocus="showDesc('mobile');" onblur="checkRegisterContent('mobile');" name="mobile" id="mobile" type="text" size="" class="input_reg" value=""/>
                                    <span id="mobile_desc" class="tips">请输入手机号</span>
                                </li>
                                <li>
                                    <span class="name_reg">推荐手机号：</span>
                                    <input name="recommen_mobile" onfocus="showDesc('recommen_mobile_register');" onblur="checkRegisterContent('recommen_mobile_register');" id="recommen_mobile_register" type="text" class="input_reg" />
                                    <span id="recommen_mobile_register_desc" class="tips">没有推荐人请留空,<a href="/user/recommend.php" target="_blank">什么是推荐人?</a></span>
                                </li>

                               <!--  <li style="margin-bottom:10px;">
                                    <span class="name_reg">英文名：</span>
                                    <input onfocus="showDesc('nick_name');" onblur="checkRegisterContent('nick_name');" name="nick_name" id="nick_name" type="text" class="input_reg" />
                                    <span class="tips" id="nick_name_desc">没有英文名请留空</span>
                                </li> -->
                                <li class="li_reg2">
                                    <input class="f_l" name="privacy" id="privacy" type="checkbox" value="checkbox" checked="checked" />
                                    <font class="f_l">我已阅读并同意<a href="../about/terms.php" target="_blank">《学纷享用户注册协议》</a></font>
                                </li>
                                <li style="margin-top:26px"><a href="javascript:void(0)" id='submitForm' class="a_reg"style="float: left;"><font class="f_l f_24">学员注册</font><font class="f_r">></font></a><a href="javascript:void(0)" id='submitForm' class="a_reg" style="margin-left: 230px;"><font class="f_l f_24">教师注册</font><font class="f_r">></font></a></li>

                            </ul>
                            <input type="hidden" name="user_type" value=""/>
                        </form>
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
