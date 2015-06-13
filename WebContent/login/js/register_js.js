   $(function(){
        
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
                $(this).find('ul').slideUp("fast", function() {
                    this_obj.css({'background': 'url(images/menu_bg.png) repeat-x'});
                });
            }
        });

        //验证表单数据
        $('#checkRegForm').click(function(){
            if(NewCheckRegisterForm()){
                setTimeout(function(){$('#RegForm').submit();},0);
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
        })
        
        //漂浮代码
        $(".theFirst").mouseover(function(){
            $(this).hide();
            $(".theLast").animate({opacity: 'show'}, 500);
        })
        $(".theLast").mouseout(function(){
             $(this).hide();
            $(".theFirst").show();
        })
        
        //漂浮代码
        $(".theFirstTwo").mouseover(function(){
            $(this).hide();
            $(".theLastTwo").animate({opacity: 'show'}, 500);
        })
        $(".theLastTwo").mouseout(function(){
            $(this).hide();
            $(".theFirstTwo").show();
        })

        //新网站切换
        $("#switch_on_off").click(function(){
            var isSwitch = getCookie('SWITCH_ON_OFF');
            if( isSwitch == 'FALSE' ){
                setCookie('SWITCH_ON_OFF','TRUE');
            }
            location.reload();
        })
        
    })

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
 
 $(function(){
     $("#submitForm").click(function(){
         if(checkRegisterForm()){
             $("#regForm").submit();
         }
     })
 });
 
 function check_register_user_name(user_name) {

     $.ajax({
         type: "POST",
         dataType: "json",
         url: "check_user_name.php",
         data: "user_name=" + user_name,
         success: function(msg) {
             if (msg.status) {
                 $("#register_user_name_desc").addClass('correct').html('');
             } else {
                 $("#register_user_name_desc").removeClass('correct').addClass('tips').html('该邮箱地址已经被注册,请使用其他邮箱').show();
             }
         }
     });
 }
 
 //用户注册提示（已整理）
 function showDesc(sid) {
     var sid = String(sid),
         str = {
             user_name:'请填写正确的邮箱地址,将作为登录会员中心的用户名',
             register_user_name:'请填写正确的邮箱地址,将作为登录会员中心的用户名',
             password:'长度6-20位,数字/字母/特殊字符(!@#$%^&*())',
             register_password:'长度6-20位,数字/字母/特殊字符(!@#$%^&*())',
             nick_name:'仅限字母,便于老师上课时称呼您',
             skype_id:'您的skype用户名',
             mobile:'请填写正确的手机号码',
             recommen_mobile_register:'请填写正确的推荐手机号/推荐码',
         };
         
     $("#" + sid + "_desc").html(str.sid);
     if( !$("#" + sid + "_desc").hasClass("correct") ){
         $("#" + sid + "_desc").addClass('tips');
     }
 }

 function checkRegisterContent(sid) {
     if (sid == 'register_user_name') {
         var user_name = $('#register_user_name').val();
         if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
             $('#' + sid + '_desc').html('请填写正确的邮箱地址，作为登录用户名');
             $('#' + sid + '_desc').addClass("tips").removeClass("prompt").removeClass("correct");
             $('#' + sid + '_desc').show();
         } else {
             check_register_user_name(user_name);
             $('#' + sid + '_desc').removeClass("correct").addClass("erro02");
             $('#' + sid + '_desc').html("").removeClass("tips");
         }
     } else if (sid == "user_name") {
         var user_name = $('#user_name').val();
         if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
             $('#' + sid + '_desc').html('请填写正确的邮箱地址，作为登录用户名');
             $('#' + sid + '_desc').addClass("erro02");
             $('#' + sid + '_desc').show();
         } else {
             check_user_name(user_name);
             $('#' + sid + '_desc').removeClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }
     } else if (sid == "register_password") {
         var password = $("#register_password").val();
         if (password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null) {
             $('#' + sid + '_desc').html('6-20位字符，可使用数字、字母和特殊字符的组合');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else {
             $('#' + sid + '_desc').addClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }

     } else if (sid == "password") {
         var password = $("#password").val();
         if (password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null) {
             $('#' + sid + '_desc').html('6-20位字符，可使用数字、字母和特殊字符的组合');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else {
             $('#' + sid + '_desc').addClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }

     } else if (sid == "chk_password") {
         var chk_password = $("#chk_password").val(),
             password = $("#password").val(),
             register_password = $('#register_password').val();
     
         if (chk_password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null) {
             $('#' + sid + '_desc').html('请填写正确的密码');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else if (password != chk_password && register_password != chk_password) {
             $('#' + sid + '_desc').html('两次填写的密码不一致');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else {
             $('#' + sid + '_desc').removeClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }
     } else if (sid == "nick_name") {
         var nick_name = $("#nick_name").val();
         if (nick_name.match(/^[A-Za-z]{2,20}$/) == null) {
             $('#' + sid + '_desc').html('方便老师上课时称呼您，没有请留空！');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else {
             $('#' + sid + '_desc').addClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }
     }else if (sid == "mobile") {
         var mobile = $("#mobile").val();
         var mobile_register = $("#recommen_mobile_register").val();
         if (mobile.match(/^1[0-9]{10}$/) == null) {
             $('#' + sid + '_desc').html('请填写正确的手机号码');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         }else if (mobile == mobile_register) {
             $('#' + sid + '_desc').html('请填写正确的推荐手机号/推荐码');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else {
             $('#' + sid + '_desc').addClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }
     }else if (sid == "recommen_mobile_register") {
         var mobile = $("#mobile").val();
         var mobile_register = $("#recommen_mobile_register").val();
         if (mobile_register.match(/^1[0-9]{10}$/) == null) {
             $('#' + sid + '_desc').html('请填写正确的推荐手机号/推荐码');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         } else if(mobile_register == mobile ){
             $('#' + sid + '_desc').html('推荐手机号不可以和注册号码相同！');
             $('#' + sid + '_desc').addClass("tips");
             $('#' + sid + '_desc').show();
         }else {
             $('#' + sid + '_desc').addClass("correct").removeClass("tips");
             $('#' + sid + '_desc').html("");
         }
     }

 }
 
 //校验注册表单
 function checkRegisterForm() {
     
     //用户名
     var user_name = $('#register_user_name').val();
     if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
         alert('请填写正确的邮箱地址');
         return false;
     }
     //密码
     var password = $('#register_password').val();
     if (password == "") {
         alert('密码不能为空');
         return false;
     }
     if (password.length < 6 || password.length > 20) {
         alert('密码长度应在6-20位之间');
         return false;
     }
     
     //mobile
     var mobile = $('#mobile').val();
     if (mobile.match(/^1[0-9]{10}$/) == null) {
         alert('请填写正确的手机号码');
         return false;
     }
     
     //英文名
     var nick_name = $('#nick_name').val();
     if (nick_name != "" && nick_name != '选填') {
         if (nick_name.match(/^[A-Za-z]{2,20}$/) == null) {
             alert('英文名仅限字母，方便老师上课时称呼您！');
             return false;
         }
     }
     
     if (!$('#privacy').attr("checked")) {
         alert('请阅读法律声明');
         return false;
     }
     return true;
 }