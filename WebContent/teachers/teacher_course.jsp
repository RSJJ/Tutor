<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.List , com.tutor.entity.* " %>
	<%@page import="com.tutor.entity.server.*" %>
	<%
		User user = (User)session.getAttribute("user");
		Teacher teacher = null;
		if(user != null)
		{
			teacher = (Teacher)user.getUser();
		}
		List<NorCourse> norCourses = request.getAttribute("norCourses") == null ? (List<NorCourse>)request.getAttribute("norCourses"):new ArrayList<NorCourse>();
		List<GraCourse> graCourses = request.getAttribute("graCourses") == null ? (List<GraCourse>)request.getAttribute("gracourses"):new ArrayList<GraCourse>();
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/global.css" rel="stylesheet" type="text/css"
	charset="utf-8" />
<link href="css/erji.css" rel="stylesheet" type="text/css"
	charset="utf-8" />
<link href="css/gwc.css" rel="stylesheet" type="text/css"
	charset="utf-8" />
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"
	language="javascript"></script>
<script src="js/formCheck.js" type="text/javascript" charset="utf-8"
	language="javascript"></script>
<script src="js/jquery.fancybox-1.3.4.js" type="text/javascript"
	charset="utf-8" language="javascript"></script>
<script src="js/teacher_js.js" type="text/javascript" charset="utf-8"
	language="javascript"></script>
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
				<div class="theFirst">
					<img src="images/zxzx.png" />
				</div>
				<div class="theLast">
					<img onclick="NTKF.im_openInPageChat()" src="images/intalker.jpg" />
				</div>
			</div>
			<div class="floatDivTwo">
				<div class="theFirstTwo">
					<img src="images/wexin_4.png" />
				</div>
				<div class="theLastTwo">
					<img src="images/weixin_2.png" />
				</div>
			</div>
		</div>

		<!--微信 stop-->

		<div class="main" style="background: #fff; padding-bottom: 20px;">
			<div class="w_960">
				<div class="erji_te">首页>教师个人中心</div>
				<div class="container" style="background: none;">
					<div class="grkj">
						<div class="grkj-top clearfix">
							<div class="grkj-l">
								<p class="tx">
									<%if(teacher != null && teacher.getIcon() != null){ %>
									<img alt="头像" title="头像" src="<%= request.getContextPath() + teacher.getIcon() %>">
									<%
									}
									else
									{%>
									<img alt="头像" title="头像" src="images/incimg12.gif">
									<%} %>
								</p>
								<p class="nrxx">
									<a href="javascript:void(0);" class="user">花花</a>
								</p>
							</div>
							<div class="grkj-r">
								<ul class="clearfix">
									<li><a href="/cart/shopcart.html">购物车<span>1</span> <b>1</b></a></li>
									<li><a href="/space/remindlist.html"><span>0</span>个提醒</a></li>
									<li class="y"><a href="/space/kjwdyyjl.html?state=2"><span>0</span>个预约</a>
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
							<div class="incrlspacea" style="border-bottom: 1px solid #D3D3D3">
								<span class="incrlspacea1">我的课程信息</span>

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
								<div class="wdkc_top">基础年级</div>

								<div id="layout">
									<div class="tabcontentstyledd top0">
										<div id="tcontent14">
											<div>
												<div class="incwdddcona">
													<div class="incwdddcona1">年级</div>
													<div class="incwdddcona2" style="width: 100px;">科目</div>
													<div class="incwdddcona5">价格/半小时</div>
													<div class="incwdddcona6" style="width: 200px;">创建时间
													</div>
													<div class="incwdddcona7">操作</div>
													<div class="clear"></div>
												</div>
												<%for(NorCourse norCourse:norCourses) %>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 100px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 200px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 100px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 200px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 100px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 200px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="tjkc">
													<a onclick="openDiv()"><font size="+2">+</font>添加基础课程</a>
												</div>

												<!-- 弹出框 start -->


												<div id="winDiv">
													<div class="topDiv">
														<span class="fl">添加基础课程</span><span class="fr" id="close"
															onclick="closeDiv()"><img src="images/close.jpg" /></span>
														<div class="clear"></div>
													</div>
													<div class="condiv">
														<p class="condiv_p">
															年级：&nbsp;&nbsp;<label><select
																style="width: 100px;"><option>高一</option></select></label>&nbsp;&nbsp;&nbsp;&nbsp;科目&nbsp;&nbsp;<label><select
																style="width: 100px;"><option>物理</option></select></label><br />
															线上价格：&nbsp;&nbsp;<input type="text" value="25.00"
																class="condiv_ipt" />&nbsp;元/半小时&nbsp;&nbsp;<input
																name="" type="checkbox" value="" /><br />
															线下价格：&nbsp;&nbsp;<input type="text" value="25.00"
																class="condiv_ipt" />&nbsp;元/半小时&nbsp;&nbsp;<input
																name="" type="checkbox" value="" /><br />

														</p>
														<div style="vertical-align: top; padding-left: 30px;">
															备注：
															<textarea name="" cols="" rows="" class="condiv_tex">其它说明（0-200字）</textarea>
														</div>
														<div class="re_con4">
															<input name="" value="" type="button" class="btn_yz">
														</div>
													</div>
												</div>

												<!-- 弹出框 stop -->

											</div>

											<div class="wdkc_top">考研模块</div>

											<div>
												<div class="incwdddcona">
													<div class="incwdddcona1">学校</div>
													<div class="incwdddcona2" style="width: 50px;">学院</div>
													<div class="incwdddcona2" style="width: 50px;">课程</div>
													<div class="incwdddcona2" style="width: 50px;">专业</div>
													<div class="incwdddcona5">价格/半小时</div>
													<div class="incwdddcona6" style="width: 170px;">创建时间
													</div>
													<div class="incwdddcona7">操作</div>
													<div class="clear"></div>
												</div>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 170px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 170px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="incwdddcona11">
													<div class="incwdddcona1">小一</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona2" style="width: 50px;">语文</div>
													<div class="incwdddcona5">25.00</div>
													<div class="incwdddcona6" style="width: 170px;">
														2015-4-20 15:00</div>
													<div class="incwdddcona7">
														<a href="#">修改</a>/<a href="#">删除</a>
													</div>
													<div class="clear"></div>
												</div>
												<div class="tjkc">
													<a onclick="openDiv1()"><font size="+2">+</font>添加基础课程</a>
												</div>



											</div>
											<div id="winDiv1">
												<div class="topDiv">
													<span class="fl">添加基础课程</span><span class="fr" id="close"
														onclick="closeDiv1()"><img src="images/close.jpg" /></span>
													<div class="clear"></div>
												</div>
												<div class="condiv">
													<p class="condiv_p">
														学校：&nbsp;&nbsp;<label><select
															style="width: 100px;"><option>北交</option></select></label>&nbsp;&nbsp;&nbsp;&nbsp;学院：&nbsp;&nbsp;<label><select
															style="width: 100px;"><option>计算机</option></select></label><br />
														专业：&nbsp;&nbsp;<label><select
															style="width: 100px;"><option>计算机</option></select></label>&nbsp;&nbsp;&nbsp;&nbsp;课程：&nbsp;&nbsp;<label><select
															style="width: 100px;"><option>操作系统</option></select></label><br />
														线上价格：&nbsp;&nbsp;<input type="text" value="25.00"
															class="condiv_ipt" />&nbsp;元/半小时&nbsp;&nbsp;<input
															name="" type="checkbox" value="" /><br />
														线下价格：&nbsp;&nbsp;<input type="text" value="25.00"
															class="condiv_ipt" />&nbsp;元/半小时&nbsp;&nbsp;<input
															name="" type="checkbox" value="" /><br />

													</p>
													<div style="vertical-align: top; padding-left: 30px;">
														备注：
														<textarea name="" cols="" rows="" class="condiv_tex">其它说明（0-200字）</textarea>
													</div>
													<div class="re_con4">
														<input name="" value="" type="button" class="btn_yz">
													</div>
												</div>
											</div>
											<div class="page">
												<ul>
													<li class="page_sy" style="width: 40px;"><a href="#">首页</a></li>
													<li style="width: 54px;"><a href="#">上一页</a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li style="border: none"><a href="#">...</a></li>
													<li><a href="#">80</a></li>
													<li style="width: 54px;"><a href="#">下一页></a></li>
													<li class="page_sy" style="width: 40px;"><a href="#">末页</a></li>
													<div class="clear"></div>
												</ul>
											</div>

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
		<jsp:include page="t_bottom.jsp"></jsp:include>
		<!--底部 stop-->
	</div>

</body>
</html>
