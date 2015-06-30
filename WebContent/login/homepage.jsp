<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>学纷享家教</title>
        <meta name="keywords" content="学纷享家教" />
    </head>
    
                <link href="css/global.css" rel="stylesheet" type="text/css"  charset="utf-8"  />

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<!-- <script src="js/index_register.js" type="text/javascript" charset="utf-8" language="javascript"></script>  -->
<script src="js/jquery.scrollto.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/placeholder.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8" language="javascript"></script> 
<script src="js/front_js.js" type="text/javascript" charset="utf-8" language="javascript"></script> 

<!-- 首页轮播图 start --> 
<script src="js/MogFocus.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/easing.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<link href="css/css.css" rel="stylesheet" type="text/css"  charset="utf-8"  /> 
<!-- 首页轮播图 end --> 

<!-- 视频播放弹框 start --> 
<script src="js/jquery.mousewheel-3.0.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<link href="css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css"  charset="utf-8"  />
<script src="js/ckplayer.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<!-- 视频播放弹框 end --> 
<!--[if IE 6]>
<script src="js/background.png.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<![endif]--> 

<!-- ntalker start --> 
<!-- ntalker end --> 


<body>
<div>

<!-- 用户中心文件 --> 

<div class="header_all focusSlide">
<div class="header_img">     
<!--   <div class="video_play focusSlide" id="example" href="#example_video_1"></div> --> 
    <div id="warpper2">
      <div id="focus2">
        <div class="focusWarp">
          <ul class="imgList">
            <li><a href="javascript:void(0)" ><img width="1280" height="606" src="images/index1.png" /></a></li>
            <li><a href="javascript:void(0)"><img width="1280" height="606" src="images/index2.png" /></a></li>
            <li><a href="javascript:void(0)"><img width="1280" height="606" src="images/index3.png" /></a></li>
			<li><a href="javascript:void(0)"><img width="1280" height="606" src="images/index4.png" /></a></li>
			<li><a href="javascript:void(0)"><img width="1280" height="606" src="images/index5.png" /></a></li>
          </ul>
        </div>
      </div>
    </div>
</div>
  <div class="header">
    <div class="content">
    	<jsp:include page="header.jsp"></jsp:include>

          <div class="register_new">
          <div id="login_before">
          	<ul class="register_ul">
                      <li class="f_l onfl  hover"><a href="javascript:void(0)">注册</a></li><li class="f_r onfr"><a href="javascript:void(0)">登录</a></li>
                  </ul>
                  <div class="register_box">

                      <form name="RegFormOne" method="post" action="#" id='RegFormOne' autocomplete="off" > 
                          <ul class="box_r1" style="display:none;">
                              <li>
                                <input type="text" name="userName" placeholder="请填写邮箱" check />
                                <span style="display:none;">请填写邮箱</span>
                              </li>
                              <li>
                                <input type="password" name="password" placeholder='请填写密码' check />
                                <span style="display:none;">密码未填写</span></li>
                              <li class="bg_bs">
                                <input type="text" name="mobile" placeholder="填写手机号" style="width:103px;" check />
                                <span style="display:none;">填写手机号</span><span class="hqyzm"><a href="#">获取验证码</a></span>
                              </li>
                              <li>
                                <input type="text" name="recommen_mobile" placeholder="填写验证码"/>
                                <span style="display:none;">填写验证码</span>
                              </li>
                              <li>
                              <span class="hqyzm xyzc "><input type="button" id="studentRegister" value="学员注册" submit  style="border:none; width:78px;"/></span>
                              <span class="hqyzm xyzc" style="float:right;"><input type="button" id="teacherRegister" value="老师注册" submit  style="border:none; width:78px;"/></span>
                              </li>
                          </ul>
                      </form>
                      <div class="box_r2">
                          <form name="RegForm" method="POST" action="#" id="LoginForm" >
                              <ul class="box_r2_ul">
                                  <li>
                                    <input name="userName" id="loginUserName" placeholder="已验证手机号/邮箱" type="text" check />
                                    <span style="display:none;">请填写邮箱</span>
                                  </li>
                                  <li>
                                    <input name="password" id="loginPassword" type="password" placeholder="请输入您的密码" check />
                                    <span style="display:none;">请填写邮箱</span>
                                  </li>
                                  <li class="li_ico">
                                      <input type="checkbox" name="aotu_login" id="aotu_login" class="check_input f_l" />
                                      <label for="aotu_login" class="f_l f_w">&nbsp;下次自动登录</label><a href="#" class="f_r f_w">忘记密码？</a>
                                  </li>
                                  <li class="li_btn">
                                  <span class="hqyzm xyzc "><input type="button" id="studentLogin" value="学员登录" submit style="border:none; width:78px;height:31px;"/></span>
                              	<span class="hqyzm xyzc" style="float:right;"><input type="button" id="teacherLogin" submit value="老师登录"  style="border:none; width:78px;height:31px;"/></span>
                                  </li>
                              </ul>
                          </form>
                      </div>
                  </div>
          </div>
          <div id="login_after">
          	<div class="register_title">
                      Hi,student:
                  </div>
                  <div class="register_box2 f_w" style="position:relative;">
                  	  <a href="/trial/reserve" class="a_rbtn" style="right:10px; top:18px;">预约课程</a>
                      <a href="/pay/product" class="a_rbtn" style="right:10px; top:132px;">购买课程</a>
                      <p>您已完成<b>&nbsp;0&nbsp;</b>节课,</p>
                      <p class="p_b5" style="border-bottom:1px solid #918f8a;">累计学习<b>&nbsp;0&nbsp;</b>小时</p>
                      <p>剩余次卡：<b>&nbsp;0&nbsp;</b>次</p>
                      <p class="p_b5 f_g20" style="font-size:12px;">
                          <a class="f_g20" href="/user/purchase.php">请购买次卡套餐</a>                      </p>
                                                <p>剩余包月：<b>&nbsp;0&nbsp;</b>天</p>
                          <p class="p_b5 f_g20" style="border-bottom:1px solid #918f8a; font-size:12px;">
                              <a class="f_g20" href="/user/purchase.php">请购买包月套餐</a>                          </p>
                                            <div class="btn_box_r"><a href="/user/index" class="a_rbtn2">进入我的会员中心</a></div>
                  </div> 
          </div>                 
              </div>
                <div class="btn_topa"><a href="#" target="_blank" class="f_y">立即注册，和Ta一起学纷享</a></div>
    </div>
  </div>
  </div>
<div class="floatDiv">
  <div class="floatDivOne">
    <div class="theFirst"><img src="images/zxzx.png" /></div>
    <div class="theLast"> <img onClick="NTKF.im_openInPageChat()" src="images/intalker.jpg" /> </div>
  </div>
  <div class="floatDivTwo">
    <div class="theFirstTwo"><img src="images/wexin_4.png" /></div>
    <div class="theLastTwo"><img src="images/weixin_2.png" /></div>
  </div>
</div>

            <!-- 加载视频 start -->
           <!--  <div id="video" style="overflow: hidden; display: none;"><div id="example_video_0"></div></div>
            <div id="video" style="overflow: hidden; display: none;"><div id="example_video_1"></div></div>
            <div id="video" style="overflow: hidden; display: none;"><div id="example_video_2"></div></div>
            <div id="video" style="overflow: hidden; display: none;"><div id="example_video_3"></div></div>
            <div id="video" style="overflow: hidden; display: none;"><div id="example_video_5"></div></div> -->
            <!-- 加载视频 end -->

            <div class="main">
                <div class="content">
<!--  4个理由  -->
                    <div class="tab_youshi">
                        <div class="title m_b30"><b class="f_y f_24">学纷享家教——致力于为千万学子打造学习好帮手、好平台</b><font class="f_18">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="f_c" target="_blank">学纷享家教四大优势></a></font></div>
                        <ul id="tags_ul">
                            <li class="selectTag">
                                <a onClick="selectTag('tagContent0', this)" href="javascript:void(0)"><font class="f_80">1</font><font class="f_14" style="line-height:20px;">教师团队是</font><font class="f_18" style="line-height:30px;">最优秀<br />最专业的</font></a> 
                            </li>
                            <li>
                                <a onClick="selectTag('tagContent1', this)" href="javascript:void(0)"><font class="f_80">2</font><font class="f_18" style="line-height:44px;">老师</font><font class="f_18" style="line-height:30px;">听你说</font></a> 
                            </li>
                            <li>
                                <a onClick="selectTag('tagContent2', this)" href="javascript:void(0)"><font class="f_80">3</font><font class="f_18" style="line-height:40px;">全部</font><font class="f_18" style="line-height:34px;">省起来</font></a> 
                            </li>
                            <li>
                                <a onClick="selectTag('tagContent3', this)" href="javascript:void(0)"><font class="f_80">4</font><font class="f_14" style="line-height:24px;">一次注册<br />多种体验</font><font class="f_18" style="line-height:30px;">沟通无极限</font></a>
                            </li>
                        </ul>
                        <div id="tags_full">
                            <div class="tags_box selectTag" id="tagContent0">
                                <p>依托北京海淀区核心区域，教师资源丰富且优质</p>
                                <p>平台承诺教师所授课程与自身专业高度一致</p>
                                <p>教师团队来源于在校大学生，更加了解学员学习状况</p>
                                <p><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></p>
                            </div>
                            <div class="tags_box selectTag" id="tagContent1" style="display:none;">
                                <p>授课方式真正做到一对一，课程设计完全为你量身定做</p>
                                <p>上课时间你说了算</p>
                                <p>模拟真实课堂情景，完全做到体验式、互动式教学</p>
                                <p><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></p>
                            </div>
                            <div class="tags_box selectTag" id="tagContent2" style="display:none;">
                                <p>平台页面简洁、注册流程简单，更加省时</p>
                                <p>网上学习，真正为老实交代、学员节省路上时间</p>
                                <p>相比传统教育机构，平台课程定价更加合理，学员学习成本更加低</p>
                                <p><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></p>
                            </div>
                            <div class="tags_box selectTag" id="tagContent3" style="display:none;">
                                <p>除教师授课指导外，平台将免费赠送多种学习套餐（相关课程电子版资料、试卷等）</p>
                                <p>从此，学习路上你将不在孤独</p>
                                <p>学员可以在平台配备的论坛、QQ群、微信平台与小伙伴愉快地交流、探讨学习问题</p>
                                <p><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></p>
                            </div>
                        </div>
                    </div>
<!--  3步流程  -->
                    <div class="tab_guide">
                        <div class="title m_b30"><b class="f_y f_24" style="_line-height:32px;">在线找家教，只需<font size="+3">3</font>步</b><font class="f_18">&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="#" class="f_c">学纷享的上课流程></a></font></div>
                        <div class="clickStepTag pic_guide picGuide1">
                            <ul>
                                <li i="1"></li>
                                <li i="2"></li>
                                <li i="3"></li>
                            </ul>
                            <div class="showStep showStep1">
                                <form name="regFormTwo" method="POST" action="#" id="regFormTwo" >
                                    <p class="f_18 f_y" style="padding-top:20px; margin-bottom:25px;">登录学纷享会员中心，开始学习之旅</p>
                                    <p><input name="user_name" id="user_name" type="text" class="index_input" value="" placeholder="请输入邮箱地址"  /></p>
                                    <p><input name="password" type="password" id="password" class="index_input" value="" placeholder="请填写密码" /><a class="dl_a" href="javascript:void(0)" id="submitReg"><font class="f_l">登录</font> <font class="f_r">&gt;</font></a></p>
                                    <p><a href="#" class="f_l m_r20">忘记密码</a><a href="#" target="_blank" class="f_c">新用户点此注册</a></p>
                                    <a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a>
                                </form>
                            </div>
                            <div class="showStep showStep2"><img src="images/ban_2.png" /><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></div>
                            <div class="showStep showStep3"><img src="images/box_3.png" style="margin:25px;" /><a href="#" target="_blank" class="btn_a"><font class="f_l">现在就来体验</font> <font class="f_r">></font></a></div>
                        </div>
                    </div>
                </div>
            </div>
<!--  学员  -->
            <div class="main b_g5" style=" padding:20px 0;">
                <div class="content">
                    <div class="title"><span class="f_l f_18 m_l10"><b><a href="#" class="f_g50" target="_blank">学员&nbsp;&nbsp;></a></b></span><a class="f_r f_g50 m_r10" href="#" target="_blank">更多学员自述></a></div>
                    <div class="ul_6tips">
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Ernie-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Ernie<br /></font>——汽车开发工程师</p>
                                    <p>我喜欢通过经典英语的教材和老师进行话题讨论，有助于我组织语言能力的提高。老师也非常有耐心，而且很善解人意，教学非常认真，帮我改正了很多错误。课下的时候，我也会坚持自学，背新概念，听BBC，看美剧……学英语是非常辛苦的，但只有付出辛劳，才能最终收获。现在的我已经能掌握日常沟通了，还会继续努力！</p>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Tina-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Tina<br /></font>——小学四年级</p>
                                    <p>之前给孩子报过培训班，主要是学语法上的知识，而在51Talk，我们主要是想提高口语。在线上课的方式很灵活方便，孩子自己就能约课上课，不用家长操心了。孩子最喜欢上的是free talk的课程，她可以和外教聊很多有趣的话题。现在，她已经把讲英语当成习惯了，英语考试也能考100分了。</p>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Connie-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Connie<br /></font>——外企助理</p>
                                    <p>我现在在外企做助理，工作中用英语的地方很多，而我的口语却很弱。平时加班也很多，在51Talk上课感觉很方便，而且很轻松，不仅能提高自己的口语水平，还能作为生活的调剂。我一直都上Majee老师的课，她非常有热情，让整个上课过程都充满乐趣，我也学到了很多地道的口语表达，现在我已经敢于开口讲英语了。</p>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Moon-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Moon<br /></font>——小学二年级</p>
                                    <p>我一直很重视Moon的教育问题，之前也参加过一些英语培训班，在51Talk学习了这么久，发现这里才是最适合孩子学习的平台。上课的时候，Liza老师非常有耐心，也很了解小孩子的心理，引导孩子在课上积极表达、锻炼口语，还跟孩子分享很多课本之外的知识。现在孩子已经能自己在网上约课上课了，自主性非常强，作为母亲非常欣慰。</p>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Nankwok-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Nankwok<br /></font>——医生</p>
                                    <p>我平时对英语很感兴趣，工作中有时也会用到，因此我想进一步提高自己的英语水平。51Talk的老师有丰富的教学经验，教给我很多固定搭配，课上我开口讲英语的时间也很充足，我意识到“活学活用”的重要性。Ronamae老师和Peter老师是我很喜欢的老师，他们教给我很多实用的东西。课下我也自学英语，通过练习场景来记单词。</p>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img class="ulImg1" src="images/Cindy-150.jpg" />
                                <span class="ul_6txt">
                                    <p><font class="f_18">Cindy<br /></font>——编辑</p>
                                    <p>我有一定的英语基础，为了通过雅思考试实现出国的梦想，我选择在51Talk上提高自己的英语水平。感觉教材的内容非常实用，能综合提高英语的各个方面，而且我还学会了一个高效的单词记忆方法，就是通过特定的话题来记忆单词。现在，我的词汇量已经达到5000了，口语也有了很大的提高，感谢51Talk。</p>
                                </span>
                            </a>
                        </li>
                    </div>

                   
                    
                </div>
            </div>
            <script src="js/placeholder.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<div class="main b_g20" style=" background:url(images/bg3.gif) repeat-y center #737373;">

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


    <!-- <script type="text/javascript">
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
    
        </div>
    </body>
</html>