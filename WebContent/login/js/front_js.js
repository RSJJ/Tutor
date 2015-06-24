 $(function(){
                $(".onfl").click(function(){
                    $(".box_r1").show();
                    $(this).removeClass('hover');
                    $(".box_r2").hide();
                    $(".onfr").addClass('hover');
                });
                $(".onfr").click(function(){
                    $(".box_r1").hide();
                    $(this).removeClass('hover');
                    $(".box_r2").show();
                    $(".onfl").addClass('hover');
                    if($.browser.version=="6.0"){
                        if(!$("#LoginForm").attr("ie6pl")){
                          $("#LoginForm").placeholder();
                          $("#LoginForm").attr("ie6pl",true);
                        }  
                    }
                });
            });

var tag_name_index = "index";
	var tag_name_userId= "0";
    //初始化加载视频
  
    $(function(){

    /*    //视频点击
        $("#example").click(function(){
          var video_name = $(this).attr('href');
          $.post('/user/ajax_add_videolog.php',{'video_name':video_name},function(){});
        });
        $("#example_two").click(function(){
          var video_name = $(this).attr('href');
          $.post('/user/ajax_add_videolog.php',{'video_name':video_name},function(){});
        });

        //初始化弹框
        $("#example").fancybox({
            'titlePosition':'inside',
            'transitionIn':'none',
            'scrolling':'no',
            'overflow':'hidden',
            'transitionOut':'none',
            'onClosed':function(){
                $(window).trigger('play');
            }
        });
*/
        $("#RegFormOne,#LoginForm").placeholder();
        $("#studentRegister").click(function(){
        	$("#RegFormOne").formCheck2("studentRegister");
        });
        $("#teacherRegister").click(function(){
        	$("#RegFormOne").formCheck2("teacherRegister");
        });
        $("#studentLogin").click(function(){
        	$("#LoginForm").formCheck2("studentLogin");
        });
        $("#teacherLogin").click(function(){
        	$("#LoginForm").formCheck2("teacherLogin");
        });
     
        /*
        //提交登录
        $("#submitLogin").click(function(){
            var password = $("#password").val(),
                user_name = $("#user_name").val();

            if( user_name == '' || user_name == '已验证手机号/邮箱' ){
                alert('请输入用户名');
                return ;
            }

            if( password == '' || password == '请输入您的密码' ){
                alert('请输入密码');
                return ;
            }
            $("#LoginForm").submit();
        });
        */
        //网站头部导航
        $('li.liMain').mousemove(function() {
            $(this).css({'background': '#ffa800'})
            $(this).find('ul').slideDown();
        });
        
        $('li.liMain').mouseleave(function() {
            var this_obj = $(this);
            if(this_obj.find('ul').html() == null){
                this_obj.css({'background': 'url(images/menu_bg.png) repeat-x'});
            }else{
                $('li.liMain').find('ul').slideUp("fast", function() {
                    $('li.liMain').css({'background': 'url(images/menu_bg.png) repeat-x'});
                });
            }
        });

        //验证表单数据
        $('#checkRegForm').click(function(){
            if(NewCheckRegisterForm()){
                setTimeout(function(){$('#RegFormOne').submit();},0);
            }
        });
        
        //显示QQ客服窗口与微博窗口
        var is_open = [],is_close = [];
        $(".showDialog").mouseover(function(){
            var index = $(".showDialog").index(this);
            var IdShow = $(this).attr('id');
            clearTimeout(is_close[index]);
            is_open[index] = setTimeout(function(){$("#"+IdShow + 'Div').slideDown();},100);
        }).mouseout(function(){
            var index = $(".showDialog").index(this);
            var IdShow = $(this).attr('id');
            clearTimeout(is_open[index]);
            is_close[index] = setTimeout(function(){$("#"+IdShow + 'Div').slideUp();},100);
        });
        
        //漂浮代码
        $(".theFirst").mouseover(function(){
            $(this).hide();
            $(".theLast").animate({opacity: 'show'}, 500);
        });
        $(".theLast").mouseout(function(){
             $(this).hide();
            $(".theFirst").show();
        });
        
        //漂浮代码
        $(".theFirstTwo").mouseover(function(){
            $(this).hide();
            $(".theLastTwo").animate({opacity: 'show'}, 500);
        });
        $(".theLastTwo").mouseout(function(){
            $(this).hide();
            $(".theFirstTwo").show();
        });

        //计算图片数量
        var strLength = $(".imgList").find('img').length;

        var focuse = $("#focus2").mogFocus({
            scrollWidth :1280,
            loadAnimation : false,

            time : 5000,
            animationWay : 'fade',
            btnStyle : 'noNumber',
            prevNextToggle : "show",
            thumCSS : {"right":"50%","top":578,"margin-right":-(29 * strLength)/2,"width":(29 * strLength)}
        });
        
        //暂停轮播图
        $(".focusSlide").click(function(){
            var i = $(".imgBtn").find('.hover').index();

		    if((tag_name_index=='index' && i==2) || (tag_name_index=='student' && i==0)){
			    $(".btn_topa a").attr("href","#").html("了解更多详情，猛戳这里");
		    }else{
				$(".btn_topa a").attr("href","#").html("立即注册，和Ta一起学纷享").css({"color":"","background":""});
			}
           $(window).trigger('stop');
        });
        
        //显示左右切换
        $(".header_all").mouseover(function(){
           $(".prev").show();
           $(".next").show();
        });
        $(".header_all").mouseout(function(){
            $(".prev").hide();
            $(".next").hide();
        });
		
		if(tag_name_index=='index' && tag_name_userId<=0){
			var aBtn=$(".imgBtn li");
			aBtn.removeClass('hover').last().addClass('hover').trigger('click');
			$("#example").attr('href','#example_video_'+(aBtn.length-1));
			$(".imgList li").hide().last().show();
			$(window).trigger('play');
		}


        setInterval(function() {
			var i = $(".imgBtn").find('.hover').index(),
                status = $("#example").attr('status');
                
				if( status != 'no'){
					$("#example").attr('href','#example_video_'+i);
				}

				if((tag_name_index=='index' && i==2) || (tag_name_index=='student' && i==0)){
					$(".btn_topa a").attr("href","#").html("了解更多详情，猛戳这里");
				}else{
					$(".btn_topa a").attr("href","#").html("立即注册，和Ta一起学纷享").css({"color":"","background":""});
				}
        }, 200);
        
     /*   //新网站切换
        $("#switch_on_off").click(function(){
            var isSwitch = getCookie('SWITCH_ON_OFF');
            if( isSwitch == 'FALSE' ){
                setCookie('SWITCH_ON_OFF','TRUE');
            }
            location.reload();
        });*/
    });
    
$(function(){
        
        //尾部注册
        $("#footerCheckRegForm").click(function(){
            //验证表单数据
            if(FooterCheckRegisterForm()){
                setTimeout(function(){$('#FooterRegForm').submit();},0);
            }
        })
        
        //兼容H5属性标签
        if(document.getElementById('FooterRegForm')){
            Placeholder.init({
                normal : "#985d00",
                placeholder : "#A9A9A9",
                range : document.getElementById('FooterRegForm')
            });
        }
    });

$(function () {
    //上课流程切换
    $(".clickStepTag").find('li').click(function () {
        var index = $(this).attr('i'),
                setp = $('.showStep'),
                showSetp = $('.showStep' + index),
                parent = $(".clickStepTag");

        for (i = 1; i <= 3; i++) {
            parent.removeClass('picGuide' + i);
        }
        setp.hide();
        showSetp.show();
        parent.addClass('picGuide' + index);
    })

    //提交登录
    $("#submitReg").click(function () {
        var password = $("#password").val(),
                user_name = $("#user_name").val();

        if (user_name == '') {
            alert('请输入用户名');
            return;
        }

        if (password == '') {
            alert('请输入密码');
            return;
        }
        $("#regFormTwo").submit();
    })

})

//兼容H5属性标签
if (document.getElementById('regFormTwo')) {
    Placeholder.init({
        normal: "#985d00",
        placeholder: "#A9A9A9",
        range: document.getElementById('regFormTwo')
    });
}

//tag标签切换
function selectTag(showContent, selfObj) {
    //操作标签
    var tag = document.getElementById("tags_ul").getElementsByTagName("li");
    var taglength = tag.length;
    for (i = 0; i < taglength; i++) {
        tag[i].className = "";
    }
    selfObj.parentNode.className = "selectTag";
    //操作内容
    for (i = 0; j = document.getElementById("tagContent" + i); i++) {
        j.style.display = "none";
    }
    document.getElementById(showContent).style.display = "block";
}