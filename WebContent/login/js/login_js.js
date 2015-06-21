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
        });
        
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


$(function(){

    $('li.liMain').mousemove(function() {
        $(this).css({'background': '#ffa800'})
        $(this).find('ul').slideDown();//you can give it a speed
    });
    $('li.liMain').mouseleave(function() {
        var this_obj = $(this);
        $(this).find('ul').slideUp("fast", function() {
            this_obj.css({'background': 'url({generate_link type="img" module="images/" name="menu_bg.png"}) repeat-x'})
        });
    });
    
    //提交登录
    $("#submitReg").click(function(){
        var password = $("#password").val(),
            user_name = $("#user_name").val();
        
        if( user_name == '' ){
            alert('请输入用户名');
            return ;
        }
        
        if( password == '' ){
            alert('请输入密码');
            return ;
        }
        $("#regForm").submit();
    })
});

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

