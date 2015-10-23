<!doctype html>
<html>
<head>
<title>课程表</title>
<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta
	content="width=device-width, minimum-scale=1,initial-scale=1, maximum-scale=1, user-scalable=1"
	id="viewport" name="viewport" />
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
<link type="text/css" rel="stylesheet"href="../template/css/com/com.css" />
<link type="text/css" rel="stylesheet"href="../template/css/user/t_syllabus.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">

<script src="../template/js/com/jquery.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<style type="text/css">
.wrap {
	margin: 10px 0;
	background: white;
	width: 100%;
	height: auto;
	padding: 5px;
}

#footer {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 0;
}

.icon {
	margin: -15px;
	height: 130px;
	background: url("../template/images/good/background.jpg") no-repeat 0 0;
	background-size: 100% 100%;
	overflow: hidden;
}

.icon .img {
	margin-left: 20px;
	text-align: left;
	line-height: 112px;
}

.icon .img h3 {
	color: white;
}

.icon img {
	border-radius: 50%;
	vertical-align: middle;
	width: 70px;
	height: 70px;
}

.condiv_ipt {
	width: 40% !important;
}
</style>
<script>
	$(function() {
		$(".table_c tr:odd").find("td").addClass("tr_odd"); 
		//设置偶数行背景色 
		$(".table_c tr:even").find("td").addClass("tr_even"); 
		
		$("#daily1-list").bind("swipeleft", function() {
			$.mobile.changePage("#daily2",{transition:"none"});
		});
		$("#daily2-list").bind("swiperight", function() {
			$.mobile.changePage("#daily1",{transition:"none"});
		}).bind("swipeleft", function() {
			$.mobile.changePage("#daily3",{transition:"none"});
		});
		$("#daily3-list").bind("swiperight", function() {
			$.mobile.changePage("#daily2",{transition:"none"});
		});
	});
</script>
</head>
<body>
	<div data-role="page" id="daily1">
		<div data-role="header">
			<div class="com-header-area" id="js-com-header-area">
				<a href="../index.jsp" data-ajax="false" class="com-header-logo"></a>
				<dfn></dfn>
				<p>
					<a href="default.jsp" class="com-header-user selected"><del></del></a>
					<i></i> <a href="../cart/default.htm" data-ajax="false"
						class="com-header-cart "><b id="header-cart-num">0</b> <del></del></a>
				</p>
				<div class="clear"></div>
			</div>
		</div>
		<div data-role="content">
			<div id="daily1-list">
				<div class="sy_back">
					<a href="teacher_course.jsp">返回</a>
				</div>
			
				<table class="table_h">
					<tr>
						<td><img alt="左箭头" src="../template/images/arrow/larrow.png" class="larrow"></td>
						<td style="width:40%;"><span class="sy_date">2015-10-22</span></td>
						<td><img alt="左箭头" src="../template/images/arrow/rarrow.png" class="rarrow"></td>
					</tr>
				</table>
				<span class="sy_time">上午：</span>
				<table class="table_c">
					<tr>
						<td><span>数学</span></td>
						<td><span>初二</span></td>
						<td><span>10:00--12:00</span></td>
					</tr>
				</table>
				<span class="sy_time">下午：</span>
				<table class="table_c">
					<tr>
						<td><span>化学</span></td>
						<td><span>初三</span></td>
						<td><span>14:00--15:00</span></td>
					</tr>
					<tr>
						<td><span>英语</span></td>
						<td><span>初二</span></td>
						<td><span>16:00--18:00</span></td>
					</tr>
				</table>
				<span class="sy_time">晚上：</span>
				<table class="table_c">
				</table>
				
			</div>

		</div>
		<div data-role="footer" id="footer">
			<div data-role="navbar" data-iconpos="left">
				<ul>
					<li><a href="../index.jsp" data-ajax="false"
						data-role="button">首页</a></li>
					<li><a href="#pageone" data-ajax="false" data-role="button">个人中心</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div data-role="page" id="daily2">
		<div data-role="header">
			<div class="com-header-area" id="js-com-header-area">
				<a href="../index.jsp" data-ajax="false" class="com-header-logo"></a>
				<dfn></dfn>
				<p>
					<a href="default.jsp" class="com-header-user selected"><del></del></a>
					<i></i> <a href="../cart/default.htm" data-ajax="false"
						class="com-header-cart "><b id="header-cart-num">0</b> <del></del></a>
				</p>
				<div class="clear"></div>
			</div>
		</div>
		<div data-role="content">
			<div id="daily2-list">
				<div class="sy_back">
					<a href="teacher_course.jsp">返回</a>
				</div>
				<table class="table_h">
					<tr>
						<td><img alt="左箭头" src="../template/images/arrow/larrow.png" class="larrow"></td>
						<td style="width:40%;"><span class="sy_date">2015-10-23</span></td>
						<td><img alt="左箭头" src="../template/images/arrow/rarrow.png" class="rarrow"></td>
					</tr>
				</table>
				<span class="sy_time">上午：</span>
				<table class="table_c">
					<tr>
						<td><span>数学</span></td>
						<td><span>初二</span></td>
						<td><span>10:00--12:00</span></td>
					</tr>
				</table>
				<span class="sy_time">下午：</span>
				<table class="table_c">
					<tr>
						<td><span>化学</span></td>
						<td><span>初三</span></td>
						<td><span>14:00--15:00</span></td>
					</tr>
					<tr>
						<td><span>英语</span></td>
						<td><span>初二</span></td>
						<td><span>16:00--18:00</span></td>
					</tr>
				</table>
				<span class="sy_time">晚上：</span>
				<table class="table_c">
					<tr>
						<td><span>化学</span></td>
						<td><span>高一</span></td>
						<td><span>19:00--20:00</span></td>
					</tr>
					<tr>
						<td><span>英语</span></td>
						<td><span>高三</span></td>
						<td><span>21:00--22:00</span></td>
					</tr>
				</table>

			</div>
		</div>
		<div data-role="footer" id="footer">
			<div data-role="navbar" data-iconpos="left">
				<ul>
					<li><a href="../index.jsp" data-ajax="false"
						data-role="button">首页</a></li>
					<li><a href="#pageone" data-ajax="false" data-role="button">个人中心</a></li>
				</ul>
			</div>
		</div>
	</div>
	
		<div data-role="page" id="daily3">
		<div data-role="header">
			<div class="com-header-area" id="js-com-header-area">
				<a href="../index.jsp" data-ajax="false" class="com-header-logo"></a>
				<dfn></dfn>
				<p>
					<a href="default.jsp" class="com-header-user selected"><del></del></a>
					<i></i> <a href="../cart/default.htm" data-ajax="false"
						class="com-header-cart "><b id="header-cart-num">0</b> <del></del></a>
				</p>
				<div class="clear"></div>
			</div>
		</div>
		<div data-role="content">
			<div id="daily3-list">
				<div class="sy_back">
					<a href="teacher_course.jsp">返回</a>
				</div>
				<table class="table_h">
					<tr>
						<td><img alt="左箭头" src="../template/images/arrow/larrow.png" class="larrow"></td>
						<td style="width:40%;"><span class="sy_date">2015-10-24</span></td>
						<td><img alt="左箭头" src="../template/images/arrow/rarrow.png" class="rarrow"></td>
					</tr>
				</table>
				<span class="sy_time">上午：</span>
				<table class="table_c">
					<tr>
						<td><span>数学</span></td>
						<td><span>初二</span></td>
						<td><span>10:00--11:00</span></td>
					</tr>
					<tr>
						<td><span>英语</span></td>
						<td><span>初二</span></td>
						<td><span>11:00--12:00</span></td>
					</tr>
				</table>
				<span class="sy_time">下午：</span>
				<table class="table_c">
					<tr>
						<td><span>化学</span></td>
						<td><span>初三</span></td>
						<td><span>14:00--15:00</span></td>
					</tr>
				</table>
				<span class="sy_time">晚上：</span>
				<table class="table_c">
					<tr>
						<td><span>化学</span></td>
						<td><span>高一</span></td>
						<td><span>19:00--20:00</span></td>
					</tr>
					<tr>
						<td><span>英语</span></td>
						<td><span>高三</span></td>
						<td><span>21:00--22:00</span></td>
					</tr>
				</table>
			</div>
		</div>
		<div data-role="footer" id="footer">
			<div data-role="navbar" data-iconpos="left">
				<ul>
					<li><a href="../index.jsp" data-ajax="false"
						data-role="button">首页</a></li>
					<li><a href="#pageone" data-ajax="false" data-role="button">个人中心</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>