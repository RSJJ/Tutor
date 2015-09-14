<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%String path = request.getContextPath();  
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
 %>
  <%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
    <head>
        <title>精英学员</title>
        <meta charset="utf-8">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
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
        <link rel="stylesheet" href="../template/font-awesome-4.3.0/css/font-awesome.min.css">
		<script type="text/javascript" src="../template/js/com/jquery.min.js"></script>  
		<script type="text/javascript" src="../template/js/com/STATICVAR.js"></script>  
        
    </head>
    <body>
       
        <div class="com-content">
            <div class="com-header-area" id="js-com-header-area">
                <a href="../index.jsp" class="com-header-logo"></a>
                <p>
                    <a href="../login/default.jsp" class="com-header-user "><del></del></a>
                    <i></i>
                    <a href="../cart/default.htm" class="com-header-cart "><b id="header-cart-num">0</b><del></del></a>
                </p>
				<div class="clear"></div>
                
            </div>
            <div class="com-content-area" id="js-com-content-area">
<!--content-->
	<link type="text/css" rel="stylesheet" href="../template/css/tuan/tuan.css"/>
	<div class="page-role">
    	<div class="page-title">
		<a href="javascript:history.back();void(0)" class="return">返 回</a>
		全部
		</div>
		
		<div id="js-goodlist">
		
			
		</div>
        <div class="pxui-pages">
        	<a id="firstPage"><i class="arrow-left"></i>&nbsp;&nbsp;首页</a>
			<a id="previousPage"><i class="arrow-left"></i>&nbsp;&nbsp;上一页</a>
			<div class="pxui-select">
		        <span>1</span><del class="arrow-bottom"></del>
		        <select id="selectPage">
		        </select>
		    </div>
			<a id="nextPage">下一页&nbsp;&nbsp;<i class="arrow-right"></i></a>
			<a id="lastPage">末页&nbsp;&nbsp;<i class="arrow-right"></i></a>
		</div>
	</div>

</div>
<!--content-end-->
<div class="com-footer-area" id="js-com-footer-area">
			<div class="com-footer-nav">
				<a href="../index.html">首页</a><a href="../feedback/index.html">反馈建议</a>
			</div>
</div>
</div>
</body>
</html>
<script>
	function getJsonLength(jsonData){
	
		var jsonLength = 0;
	
		for(var item in jsonData){
	
		jsonLength++;
	
		}

	return jsonLength;

	}
	function showStuInfo(data){
		$("#js-goodlist").empty();
		var list =  data.stuList;
		for(var i=0;i<list.length;i++){
			var temp = '<div class="tuan-list"><div class="img120"><a><img src="<%=basePath%>'+list[i].icon+'"/></a></div><a href="#">'+
						'<div class="title"><div class="name">'+list[i].name+'</div>'+
		        		'<div class="detail"><div class="icon"><ul>'+
									//'<li><i class="fa fa-location-arrow"></i><span>'+list[i].+'</span></li>'+
									//'<li><i class="fa fa-suitcase"></i>'+list[i].profession+'</li>'+
						'</ul></div><div class="motto">'+list[i].introduction+'</div></a></div>'
			$("#js-goodlist").append(temp);		
		}
	}
	function cPageStatue(page){
		var temp = $(".pxui-pages");
		if(page.hasFirst){
			temp.find("#firstPage").attr("href","showAllStuByPage?page=1")
		}else{
			temp.find("#firstPage").attr("href","#")
		}
		if(page.hasLast){
			temp.find("#lastPage").attr("href","showAllStuByPage?page="+page.totalPage)
		}else{
			temp.find("#lastPage").attr("href","#")
		}
		if(page.hasNext){
			var a = page.currentPage+1;
			temp.find("#nextPage").attr("href","showAllStuByPage?page="+a)
		}else{
			temp.find("#nextPage").attr("href","#")
		}
		if(page.hasPrevious){
			var a = page.currentPage-1;
			temp.find("#previousPage").attr("href","showAllStuByPage?page="+a)
		}else{
			temp.find("#previousPage").attr("href","#")
		}
		temp.find(".pxui-select span").html(page.currentPage+"/"+page.totalPage);
		temp.find("#selectPage").empty();
		for(var i=1;i<=page.totalPage;i++){
			temp.find("#selectPage").append("<option><a href='showAllStuByPage?page='"+i+">"+i+"/"+page.totalPage+"</a></option>")
		}
	}
	function getByPage(page){
		$.ajax({
			url:"showAllStuByPage?page="+page,
			dataType:"json",
			type:"GET",
			success:function(data){
				console.log(data)
				if(getJsonLength(data.stuList)<1) 
					$("#js-goodlist").html("<center>暂无信息！</center>");
				else{
					cPageStatue(data.page);
					showStuInfo(data);
				}
			},
			error:function(data){
				alert("连接失败！");
			},
		})
	}
		$(function(){
			getByPage(1);
		})
	</script>
