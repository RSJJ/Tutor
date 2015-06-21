
//选择一级课程
function SelectSubCourse(TopCourseID)
{
    //provincebox = document.all.Province;
    var tSubCourse = new Array();
    var selSubCourse = TopCourseID;

    var tSubCourse = tSubCourses[selSubCourse];
    var SubCoursebox = document.getElementById('SubCourse');
    var ThirdCoursebox = document.getElementById('ThirdCourse');
    if (tSubCourse !== null)
    {
        document.getElementById('SubCourseArea').style.display = "";
        document.getElementById('lesson_area').style.display = "";
        document.getElementById('ThirdCourseArea').style.display = "none";
        SubCoursebox.length = 1;
        SubCoursebox.options[0] = new Option("Please Select...", -1);
        var j = 1;
        var str = '';
        for (var i in tSubCourse)
        {
            str = tSubCourse[i];
            SubCoursebox.options[j] = new Option(str, i);
            j++;
        }
        if (str == '')
        {
            document.getElementById('SubCourseArea').style.display = "none";
            document.getElementById('lesson_area').style.display = "none";
        }
        //不管二级是不是为空,第三级都要为空
        document.getElementById('ThirdCourseArea').style.display = "none";
        if (ThirdCoursebox != null)
        {
            ThirdCoursebox.options[0] = new Option("Please Select...", -1);
            ThirdCoursebox.length = 1;
        }

    }
    else
    {
        document.getElementById('SubCourseArea').style.display = "none";
        document.getElementById('lesson_area').style.display = "none";
        if (SubCoursebox != null)
        {
            SubCoursebox.options[0] = new Option("Please Select...", -1);
            SubCoursebox.length = 1;
        }
        document.getElementById('ThirdCourseArea').style.display = "none";
        if (ThirdCoursebox != null)
        {
            ThirdCoursebox.options[0] = new Option("Please Select...", -1);
            ThirdCoursebox.length = 1;
        }

    }
    document.getElementById('previewArea').style.display = "none";
}

//选择二级课程
function SelectThirdCourse(SubCourseID)
{
    //provincebox = document.all.Province;

    var tSubCourse = new Array();
    var selSubCourse = SubCourseID;
    var tThirdCourse = tThirdCourses[selSubCourse];
    var SubCoursebox = document.getElementById('ThirdCourse');
    if (tThirdCourse != null)
    {
        document.getElementById('ThirdCourseArea').style.display = "";
        SubCoursebox.length = 1;
        SubCoursebox.options[0] = new Option("Please Select...", -1);
        var j = 1;
        var str = '';
        for (var i in tThirdCourse)
        {
            str = tThirdCourse[i];
            SubCoursebox.options[j] = new Option(str, i);
            j++;
        }
        if (str == '')
        {
            document.getElementById('ThirdCourseArea').style.display = "none";
            if (SubCourseID != 2050)
                document.getElementById('previewArea').style.display = "";
            else
                document.getElementById('previewArea').style.display = "none";
            document.getElementById('firstCourseId').value = document.getElementById('TopCourse').value;
            document.getElementById('secondCourseId').value = document.getElementById('SubCourse').value;
            document.getElementById('thirdCourseId').value = "";
        }
        else
        {
            document.getElementById('previewArea').style.display = "none";
        }
    }
    else
    {
        document.getElementById('previewArea').style.display = "none";
        document.getElementById('ThirdCourseArea').style.display = "none";
        if (SubCoursebox != null)
        {
            SubCoursebox.options[0] = new Option("Please Select...", -1);
            SubCoursebox.length = 1;
        }

    }
}


function changeThirdCourse(thirdCourseId)
{
    if (thirdCourseId != -1)
    {
        document.getElementById('previewArea').style.display = "";
        document.getElementById('firstCourseId').value = document.getElementById('TopCourse').value;
        document.getElementById('secondCourseId').value = document.getElementById('SubCourse').value;
        document.getElementById('thirdCourseId').value = document.getElementById('ThirdCourse').value;
    }
    else
    {
        document.getElementById('previewArea').style.display = "none";
    }
}


function submitView()
{
    document.viewForm.submit();
}




function checkForm()
{
    if (document.getElementById('TopCourse').value == "-1")
    {
        alert("请选择课程");
        return false;
    }
    if (document.getElementById('SubCourse').value == "-1" && document.getElementById('SubCourseArea').style.display == "")
    {
        alert("请选择课程");
        return false;
    }
    if (document.getElementById('ThirdCourse').value == "-1" && document.getElementById('ThirdCourseArea').style.display == "")
    {
        alert("请选择课程");
        return false;
    }
    return true;
}



//点击预约按钮
var polling = '';
function changeStyle(obj,is_buy,left) {
    
    //定义jq常量
    var dateTime = obj.id.replace("button_", ""),
        Time = dateTime.split("_"),
        nextTime,
        i = 0,
        length = $(".btnopenyuyue").length,
        teacher_name = $("#teacher_name").html();

    //清除效果
    clearClass();
    
    if ($("#" + obj.id).hasClass("btnopen")) {
        
        //自动执行
        nextTime = $("#button_" + Time[0] + "_" + (parseInt(Time[1]) + 1));
        if (nextTime[0] && nextTime.hasClass("btnopen") && length == 0) {
            polling = setInterval(function() {
                if (i % 2 == 0) {
                    nextTime.addClass('loopOne').removeClass('loopTwo');
                } else {
                    nextTime.addClass('loopTwo').removeClass('loopOne');
                }
                i++;
            }, 200);
            
            if( left == 'left' ){
                nextTime.after("<div class='looPLeftpop'>"+teacher_name+"老师人气很高噢！<br />可以再约一节，连续上1小时！<a href='javascript:void(0)' style='width: 20px;height: 20px;display: block; position: absolute;top: 3px;left: 13px;' class='closeLoopPop'></a></div>");
            }else{
                nextTime.after("<div class='looPpop'>"+teacher_name+"老师人气很高噢！<br />可以再约一节，连续上1小时！<a href='javascript:void(0)' style='width: 20px;height: 20px;display: block; position: absolute;top: 3px;left: 206px;' class='closeLoopPop'></a></div>");
            }
        }

        obj.className = "btnopenyuyue";
        $("#" + dateTime).attr('checked', true);

    } else {
        obj.className = "btnopen";
        $("#" + dateTime).attr('checked', false);
    }
}

//清除效果
function clearClass(){
    clearInterval(polling);
    $(".looPpop").remove();
    $(".looPLeftpop").remove();
    $('.loopOne').removeClass('loopOne');
    $('.loopTwo').removeClass('loopTwo');
}

//校验注册表单
function checkRegisterForm()
{
    //用户名
    var user_name = document.getElementById('register_user_name').value;
    if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null)
    {
        alert('请填写正确的邮箱地址');
        return false;
    }
    //密码
    var password = document.getElementById('register_password').value;
    //var chk_password = document.getElementById('chk_password').value;
//	if(password == "" || chk_password == "")
    if (password == "")
    {
        alert('密码不能为空');
        return false;
    }
    /*if(password != chk_password)
     {
     alert('两次密码填写的不一致');
     return false;			
     }*/
    if (password.length < 6 || password.length > 20)
    {
        alert('密码长度应在6-20位之间');
        return false;
    }
    //mobile
    var mobile = document.getElementById('mobile').value;
    if (mobile.match(/^1[0-9]{10}$/) == null)
    {
        alert('请填写正确的手机号码');
        return false;
    }
    //英文名
    var nick_name = document.getElementById('nick_name').value;
    if (nick_name != "" && nick_name != '选填')
    {
        if (nick_name.match(/^[A-Za-z]{2,20}$/) == null)
        {
            alert('英文名仅限字母，方便老师上课时称呼您！');
            return false;
        }
    }
    //skype
    var skype_id = document.getElementById('skype_id').value;
    if (skype_id.match(/^[A-Za-z]{1}[A-Za-z0-9\-\_\.]{5,31}$/) == null && skype_id != "")
    {
        alert('skype填写错误');
        return false;
    }
    if (!document.getElementById('privacy').checked)
    {
        alert('请阅读法律声明');
        return false;
    }

    return true;

}




function showCourseDesc(sid)
{
    if (document.getElementById(sid + '_desc').style.display == "")
        document.getElementById(sid + '_desc').style.display = "none";
    else
        document.getElementById(sid + '_desc').style.display = "";
}



function check_user_name(user_name)
{
    //var user_name = document.getElementById('user_name').value;
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "check_user_name.php",
        data: "user_name=" + user_name,
        success: function(msg) {
            if (msg.status)
            {
                document.getElementById('user_name_desc').className = "correct";
                document.getElementById('user_name_desc').innerHTML = "";
            }
            else
            {
                document.getElementById('user_name_desc').innerHTML = "该邮箱地址已经被注册,请使用其他邮箱";
                document.getElementById('user_name_desc').className = "erro02";
                document.getElementById('user_name_desc').style.display = "";
            }
        }
    });
}

function check_register_user_name(user_name)
{
    //var user_name = document.getElementById('user_name').value;
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "check_user_name.php",
        data: "user_name=" + user_name,
        success: function(msg) {
            if (msg.status)
            {
                document.getElementById('register_user_name_desc').className = "correct";
                document.getElementById('register_user_name_desc').innerHTML = "";
            }
            else
            {
                document.getElementById('register_user_name_desc').innerHTML = "该邮箱地址已经被注册,请使用其他邮箱";
                document.getElementById('register_user_name_desc').className = "erro02";
                document.getElementById('register_user_name_desc').style.display = "";
            }
        }
    });
}

var one_time;
/**
 * 增加了第二次点击发送语音的方法
 * @param user_id
 * @param mobileid
 * @param msg
 * @returns {Boolean}
 */
function new_send_check_code(user_id, mobileid, msg)
{
    var user_mobile = document.getElementById(mobileid).value;

    //验证手机号是否合法
    if (user_mobile.match(/^1[0-9]{10}$/) == null)
    {
        alert('请填写正确的手机号码');
        return false;
    }

    $.ajax({
        type: "POST",
        dataType: "json",
        url: "do_send_check_code.php",
        data: "user_id=" + user_id + "&user_mobile=" + user_mobile + "&msg=" + msg,
        success: function(msg) {
            if (msg.status)
            {
                alert('验证码已经发送至您的手机，如果长时间没有收到验证码，请点击通过语音助手获取验证码');
                document.getElementById('get_code_button').disabled = true;
                document.getElementById('get_code_b').className = 'get_code_g';
                document.getElementById('get_code_button').value = '60秒后求助语音助手';
                //启动定时器
                one_time = setInterval(show_seconds_new, 1000);
            }
            else
            {
                alert(msg.msg);
                document.getElementById('get_code_button').setAttribute("style", 'display:none');
                document.getElementById('get_code_button_yy').setAttribute("style", 'display:block');
                document.getElementById('get_code_button_yy').disabled = false;
            }
        }
    });
}
function show_seconds_new()
{
    var now_sec = parseInt(document.getElementById('secs_num').value);
    document.getElementById('get_code_button').value = '';
    document.getElementById('get_code_button').value = (now_sec - 1) + '秒后重新获取验证码';
    document.getElementById('secs_num').value = now_sec - 1;
    if (now_sec == 1)
    {
        clearInterval(one_time);
        /*document.getElementById('get_code_b').remove();*/

        document.getElementById('get_code_button').style.display="none";
        document.getElementById('get_code_button_yy').style.display="block";
        document.getElementById('get_code_b').className = 'get_code_blue';
        document.getElementById('secs_num').value = 60;
    }
}
function show_seconds_yy()
{
    var now_sec = parseInt(document.getElementById('secs_num').value);
    document.getElementById('get_code_button_yy').value = (now_sec - 1) + '秒后继续求助语音助手';
    document.getElementById('secs_num').value = now_sec - 1;
    if (now_sec == 1)
    {
        clearInterval(one_time);
        document.getElementById('get_code_button_yy').disabled = false;
        document.getElementById('get_code_button_yy').value = '通过语音助手获取验证码';
        document.getElementById('secs_num').value = 60;
    }
}
function send_check_code_yuyin(user_id, mobileid, msg)
{
    var user_mobile = document.getElementById(mobileid).value;
    //验证手机号是否合法
    if (user_mobile.match(/^1[0-9]{10}$/) == null)
    {
        alert('请填写正确的手机号码');
        return false;
    }
    var ajax_type = 'send_yy';
    alert('语音助手正在拨打您的手机，请立即接听电话');
    document.getElementById('get_code_button_yy').disabled = true;
    document.getElementById('get_code_button_yy').value = '60秒后继续求助语音助手';
    //启动定时器
    one_time = setInterval(show_seconds_yy, 1000);

    $.ajax({
        type: "POST",
        dataType: "json",
        url: "ajax_update_user_info.php",
        data: "user_id=" + user_id + "&user_mobile=" + user_mobile + "&msg=" + msg + '&ajax_type=' + ajax_type,
        success: function(msg) {
            if (msg == 1)
            {
                return true;
            }
            else if (msg == '-3')
            {
                alert('请您直接联系客服，4000-51-51-51');
            } else if (msg == '-4')
            {
                alert('您的手机号已经验证过，不能重复验证，请联系客服人员');
            } else
            {
                alert('发送语音请求失败，请您联系客服，4000-51-51-51');
            }
        }
    });
}
//ajax方式发送验证码
function send_check_code(user_id, mobileid, msg)
{
    var user_mobile = document.getElementById(mobileid).value;
    //验证手机号是否合法
    if (user_mobile.match(/^1[0-9]{10}$/) == null)
    {
        alert('请填写正确的手机号码');
        return false;
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "do_send_check_code.php",
        data: "user_id=" + user_id + "&user_mobile=" + user_mobile + "&msg=" + msg,
        success: function(msg) {
            if (msg.status)
            {
                alert('验证码已经发送至您的手机，如果长时间没有收到验证码，请再次点击获取验证码按钮');
                //将按钮置为disabble状态
                document.getElementById('get_code_button').disabled = true;
                document.getElementById('get_code_b').className = 'get_code_g';
                document.getElementById('get_code_button').value = '60秒后重新获取验证码';
                //启动定时器
                one_time = setInterval(show_seconds, 1000);
            }
            else
            {
                alert(msg.msg);
            }
        }
    });
}
//ajax方式发送验证码
function send_check_code2(user_id, mobileid, msg)
{
    var user_mobile = document.getElementById(mobileid).value;
    //验证手机号是否合法
    if (user_mobile.match(/^1[0-9]{10}$/) == null)
    {
        alert('请填写正确的手机号码');
        return false;
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "do_send_check_code.php",
        data: "user_id=" + user_id + "&user_mobile=" + user_mobile + "&msg=" + msg,
        success: function(msg) {
            if (msg.status)
            {
                alert('验证码已经发送至您的手机，如果长时间没有收到验证码，请再次点击获取验证码按钮');
                //将按钮置为disabble状态
                document.getElementById('get_code_button2').disabled = true;
                document.getElementById('get_code_b2').className = 'get_code_g';
                document.getElementById('get_code_button2').value = '60秒后重新获取验证码';
                //启动定时器
                one_time = setInterval(show_seconds2, 1000);
            }
            else
            {
                alert(msg.msg);
            }
        }
    });
}

function show_seconds()
{
    var now_sec = parseInt(document.getElementById('secs_num').value);

    document.getElementById('get_code_button').value = (now_sec - 1) + '秒后重新获取验证码';
    document.getElementById('secs_num').value = now_sec - 1;
    if (now_sec == 1)
    {
        clearInterval(one_time);
        document.getElementById('get_code_button').disabled = false;
        document.getElementById('get_code_b').className = 'get_code_blue';
        document.getElementById('get_code_button').value = '点击获取验证码';
        document.getElementById('secs_num').value = 60;


    }
}
function show_seconds2()
{
    var now_sec = parseInt(document.getElementById('secs_num').value);

    document.getElementById('get_code_button2').value = (now_sec - 1) + '秒后重新获取验证码';
    document.getElementById('secs_num').value = now_sec - 1;
    if (now_sec == 1)
    {
        clearInterval(one_time);
        document.getElementById('get_code_button2').disabled = false;
        document.getElementById('get_code_b2').className = 'get_code_blue';
        document.getElementById('get_code_button2').value = '点击获取验证码';
        document.getElementById('secs_num').value = 60;


    }
}



function checkRegisterContent(sid)
{
    if (sid == 'register_user_name') {
        var user_name = document.getElementById('register_user_name').value;
        if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的邮箱地址";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            check_register_user_name(user_name);
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
    }
    else if (sid == "user_name")
    {
        var user_name = document.getElementById('user_name').value;
        if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的邮箱地址";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            check_user_name(user_name);
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
    }
    else if (sid == "register_password")
    {
        var password = document.getElementById(sid).value;
        if (password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的密码";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }

    }
    else if (sid == "password")
    {
        var password = document.getElementById(sid).value;
        if (password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的密码";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }

    }
    else if (sid == "chk_password")
    {
        var chk_password = document.getElementById(sid).value;
        var password = document.getElementById('password').value;
        var register_password = document.getElementById('register_password').value;
        if (chk_password.match(/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的密码";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else if (password != chk_password && register_password != chk_password)
        {
            document.getElementById(sid + '_desc').innerHTML = "两次填写的密码不一致";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
    }
    else if (sid == "nick_name")
    {
        var nick_name = document.getElementById(sid).value;
        if (nick_name.match(/^[A-Za-z]{2,20}$/) == null)
        {
//			document.getElementById(sid+'_desc').innerHTML = "请填写正确的英文名";
//			document.getElementById(sid+'_desc').className = "erro02";
//			document.getElementById(sid+'_desc').style.display = "";
            document.getElementById(sid + '_desc').innerHTML = "*没有英文名请留空！";
            document.getElementById(sid + '_desc').className = "ok";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
    }
    else if (sid == "skype_id")
    {
        var skype_id = document.getElementById(sid).value;
        if (skype_id.match(/^[A-Za-z]{1}[A-Za-z0-9\-\_\.]{5,31}$/) == null && skype_id != "")
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的skypeID";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else if (skype_id != "")
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
        else
        {
            document.getElementById(sid + '_desc').style.display = "none";
        }
    }
    else if (sid == "mobile")
    {
        var mobile = document.getElementById(sid).value;
        if (mobile.match(/^1[0-9]{10}$/) == null)
        {
            document.getElementById(sid + '_desc').innerHTML = "请填写正确的手机号码";
            document.getElementById(sid + '_desc').className = "erro02";
            document.getElementById(sid + '_desc').style.display = "";
        }
        else
        {
            document.getElementById(sid + '_desc').className = "correct";
            document.getElementById(sid + '_desc').innerHTML = "";
        }
    }

}


function selectNickName(nick_name)
{
    document.getElementById('nick_name').value = nick_name;
    document.getElementById('nick_name').focus();
}

if (typeof $ != 'undefined') {
//控制显示评价的div
    $(document).ready(function() {
        $("#infoClose").click(function() {
            //var $stateBox = $("#stateDetailsBox");
            //$stateBox.slideUp();
            $('#opinioncontent').slideUp();
        });
        $('#showcoursebtn').bind('click', function() {
            $("#courseDetailsBox").slideDown();
        });
    });
}


function closeDetailsBox()
{
    if (document.all)
    {
        document.getElementById('stateDetails').click();
    }
    else
    {
        var evt = document.createEvent("MouseEvents");
        evt.initEvent("click", true, true);
        document.getElementById('stateDetails').dispatchEvent(evt);
    }

}



function selctLevel(level)
{
    for (var i = 1; i <= 5; i++)
    {
        if (i <= level)
        {
            document.getElementById('star_level_' + i).className = "aixin";
            document.getElementById('confirm_star_level_' + i).className = "aixin";
        }
        else
        {
            document.getElementById('star_level_' + i).className = "haixin";
            document.getElementById('confirm_star_level_' + i).className = "haixin";
        }
    }
    setLevelDesc(level);
}



function selctComplete()
{
    var level = document.getElementById('selectedLevel').value;
    for (var i = 1; i <= 5; i++)
    {
        if (i > level)
        {
            document.getElementById('star_level_' + i).className = "haixin";
            document.getElementById('confirm_star_level_' + i).className = "haixin";
        }
        else
        {
            document.getElementById('star_level_' + i).className = "aixin";
            document.getElementById('confirm_star_level_' + i).className = "aixin";
        }
    }
    setLevelDesc(level);
}


function setSelectedLevel(level)
{
    document.getElementById('selectedLevel').value = level;
}

function setLevelDesc(level)
{
    if (level > 0)
    {
        var levelDescArr = {1: '很差', 2: '差', 3: '一般', 4: '好', 5: '很好'};
        document.getElementById('levelDesc').innerHTML = levelDescArr[level];
        document.getElementById('confirmLevelDesc').innerHTML = levelDescArr[level];
    }
    else
    {
        document.getElementById('levelDesc').innerHTML = '';
        document.getElementById('confirmLevelDesc').innerHTML = '';
    }
}



function selectLevel(lid)
{
    var levelArr = {1: "All", 2: "1", 3: "2", 4: "3", 5: "4"};
    for (var tmpid in levelArr)
    {
        if (lid == levelArr[tmpid])
        {
            document.getElementById("level_" + levelArr[tmpid]).className = "selected";
        }
        else
        {
            document.getElementById("level_" + levelArr[tmpid]).className = "";
        }
    }
    document.getElementById('level').value = lid;
}



function showDesc(sid)
{
    sid = String(sid);
    if (sid == "user_name")
    {
        document.getElementById(sid + '_desc').innerHTML = "请填写正确的邮箱地址,将作为登录会员中心的用户名";
        document.getElementById(sid + '_desc').className = "prompt";
    }
    else if (sid == "register_user_name")
    {
        document.getElementById(sid + '_desc').innerHTML = "请填写正确的邮箱地址,将作为登录会员中心的用户名";
        document.getElementById(sid + '_desc').className = "prompt";
    }
    else if (sid == "password")
    {
        document.getElementById(sid + '_desc').innerHTML = "长度6-20位,支持数字、字母和特殊字符(仅限!@#$%^&*())";
        document.getElementById(sid + '_desc').className = "prompt";
    }
    else if (sid == "register_password")
    {
        document.getElementById(sid + '_desc').innerHTML = "长度6-20位,支持数字、字母和特殊字符(仅限!@#$%^&*())";
        document.getElementById(sid + '_desc').className = "prompt";
    }
    else if (sid == "chk_password")
    {
        document.getElementById(sid + '_desc').innerHTML = "请再次输入登录密码，以确认密码的正确性";
        document.getElementById(sid + '_desc').className = "prompt02";
    }
    else if (sid == "nick_name")
    {
        document.getElementById(sid + '_desc').innerHTML = "仅限字母,便于老师上课时称呼您";
        document.getElementById(sid + '_desc').className = "prompt02";
    }
    else if (sid == "skype_id")
    {
        document.getElementById(sid + '_desc').innerHTML = "您的skype用户名";
        document.getElementById(sid + '_desc').className = "prompt02";
    }
    else if (sid == "mobile")
    {
        document.getElementById(sid + '_desc').innerHTML = "请填写正确的手机号码,客服人员只会在您上课过程中需要帮助时联系您";
        document.getElementById(sid + '_desc').className = "prompt";
    }

}

function selectClassRoom(tag) {
    if (document.getElementById(tag).checked == true)
    {
        document.getElementById(tag).checked = false;
        document.getElementById('buy_button_' + tag).className = "btngouwuche";
    }
    else
    {
        document.getElementById(tag).checked = true;
        document.getElementById('buy_button_' + tag).className = "btnyjgouwuche";
    }
}



function selectPoint(sid)
{
    if (sid != undefined)
    {
        var sid_list = sid.split('_');
        var input_id = "pointtype_" + sid_list[0];
        if (document.getElementById(input_id).checked == true)
        {
            document.getElementById(input_id).checked = false;
            document.getElementById('buy_button_' + sid_list[0]).className = "btngouwuche";
        }
        else
        {
            document.getElementById(input_id).checked = true;
            document.getElementById('buy_button_' + sid_list[0]).className = "btnyjgouwuche";
        }
    }

    var tmpPrice = 0;
    var total_package_price = 0;
    var total_price = 0;
    var total_num = 0;
    var total_cash_card = 0;
    var input_list = document.getElementsByTagName('input');


    for (var i = 0; i < input_list.length; i++)
    {
        var obj = input_list[i];
        var input_value = obj.id;
        if (input_value.indexOf("pointtype") !== -1)
        {
            var input_obj = document.getElementById(input_value);

            if (input_obj.checked == true)
            {
                var sid_list = input_obj.value.split('_');
                var id = sid_list[0];
                var price = parseInt(sid_list[1]);
                var package_price = parseInt(sid_list[2]);
                var cash_card = parseInt(sid_list[3]);
                tmpPrice = tmpPrice + price;
                total_package_price = total_package_price + package_price;
                total_num = total_num + 1;
                total_cash_card = total_cash_card + cash_card;
            }
        }
    }
    if (document.getElementById('package').checked == true)
    {
        total_price = tmpPrice + total_package_price;
    }
    else
    {
        total_price = tmpPrice;
    }
    document.getElementById("point_total_price").innerHTML = tmpPrice;
    document.getElementById("total_price").innerHTML = total_price;
    document.getElementById("total_package_price").innerHTML = total_package_price;
    document.getElementById("total_num").innerHTML = total_num;
    //document.getElementById("total_cash_card").innerHTML = total_cash_card;
    if (tmpPrice == 0)
    {
        document.getElementById('phone_package').style.display = "none";
        document.getElementById("package").checked = false;
        document.getElementById('price_area').style.display = "none";
    }
    else if (tmpPrice > 0)
    {
        if (document.getElementById('phone_package').style.display == "none") {
            document.getElementById('phone_package').style.display = "";
        }
        if (total_package_price == 0) {
            document.getElementById('phone_package').style.display = "none";
        }
        if (document.getElementById('price_area').style.display == "none") {
            document.getElementById('price_area').style.display = "";
        }
    }
    //如果属于满3000减300的用户。进行如下操作
    /*    var lastPrice = document.getElementById("total_price").innerHTML;
     if(document.getElementById('is_full_reduce').value && lastPrice > 3000){
     document.getElementById('full_reduce_box').style.display='';
     document.getElementById('full_reduce_total_source').innerHTML = lastPrice;
     document.getElementById('full_reduce_total_target').innerHTML = lastPrice-300;
     document.getElementById('total_price').innerHTML = lastPrice-300;
     }else{
     document.getElementById('full_reduce_box').style.display = 'none';
     }*/
}



function selectCashCard(card_id)
{
    var discount_money = 0;
    var cash_card_list = new Array();
    if (card_id == 0)
    {
        document.getElementById('discount_price').innerHTML = document.getElementById('total_price').innerHTML;
    }
    else
    {
        var input_list = document.getElementsByTagName('input');
        for (var i = 0; i < input_list.length; i++)
        {
            var obj = input_list[i];
            var input_name = obj.name;

            if (input_name.indexOf("cashcard") !== -1)
            {
                if (obj.checked == true)
                {
                    //cash_card_list.push(input_name.replace("cashcard_",""));//多选改单选
                    cash_card_list.push(obj.value);
                    discount_money += parseInt(document.getElementById(obj.value + '_money').innerHTML);
                }
            }
        }
        var discount_price = parseInt(document.getElementById('total_price').innerHTML) - discount_money;
        if (discount_price <= 0)
        {
            document.getElementById('pay_area').style.display = "none";
        }
        else
        {
            document.getElementById('pay_area').style.display = "";
        }
        document.getElementById('discount_price').innerHTML = parseInt(document.getElementById('total_price').innerHTML) - discount_money;
        if (discount_money > 0)
        {
            document.getElementById('confirmCashCardInfo').innerHTML = "您使用了" + discount_money + "元代金券";
        }
        var cash_card_str = cash_card_list.join(',');
        document.getElementById('cash_card').value = cash_card_str;
    }
}


function confirmCashCard()
{
    selectCashCard('cashcard');
    document.getElementById('stateDetailsBox').style.display = "none";
    document.getElementById('stateDetails').innerHTML = "[+]使用代金券";
    if (document.getElementById('cash_card').value != "")
    {
        document.getElementById('closeDetailsBox').style.display = "";
        document.getElementById('closeDetailsBox').innerHTML = '<a href="javascript:void(0);" onclick="closeDetailsBox();">修改</a>';
        document.getElementById('confirmCashCardBox').style.display = "";
    }
    else
    {
        document.getElementById('closeDetailsBox').style.display = "none";
        document.getElementById('confirmCashCardBox').style.display = "none";
    }
}


function addCashCard()
{

    var card_id = document.getElementById('discount_id').value;
    var price = document.getElementById('total_price').innerHTML;
    if (card_id == '直接输入您的现金券号码') {
        $.dialog.alert("请输入您的现金券号码", {autoclose: 2000, globalBackground: '#E74378', lock: false, globalBorder: '#E74378 solid 1px'});
        return;
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "add_cash_card.php",
        data: "card_id=" + card_id + '&price=' + price,
        success: function(msg) {
            if (msg.status)
            {
                var myTable = document.getElementById('discount_table');
                var rowNum = myTable.rows.length;
                var myRow = myTable.insertRow(rowNum);
                var myCell1 = myRow.insertCell(0);
                myCell1.innerHTML = msg.card_id;
//				myCell1.style.background = '#ffffff';
//				myCell1.style.border = '1px solid #FE860E';

                var myCell2 = myRow.insertCell(1);
                myCell2.innerHTML = '<span id="' + msg.real_card_id + '_money">' + msg.money + '</span>';
//				myCell2.style.background = '#ffffff';
//				myCell2.style.border = '1px solid #FE860E';	

                var myCell3 = myRow.insertCell(2);
                myCell3.innerHTML = msg.expire;
//				myCell3.style.background = '#ffffff';
//				myCell3.style.border = '1px solid #FE860E';	 

                var myCell1 = myRow.insertCell(3);
                myCell1.innerHTML = '<input type="radio"  name="cashcard_id" value="' + msg.real_card_id + '" >' + '使用';
                //myCell1.innerHTML = '<input type="checkbox" name="cashcard_' + msg.card_id + '" value="' + msg.card_id + '" >' + '使用'; 
//				document.getElementById('card_error_msg').innerHTML = "添加成功";
                $.dialog.alert("添加成功", {autoclose: 2000, globalBackground: '#E74378', lock: false, globalBorder: '#E74378 solid 1px'});
            }
            else
            {
//	     	document.getElementById('card_error_msg').innerHTML = msg.msg;
                $.dialog.alert(msg.msg, {autoclose: 2000, globalBackground: '#E74378', lock: false, globalBorder: '#E74378 solid 1px'});
            }
        }
    });
}

//添加代金卷新方法
function addCashCardNew()
{
    var card_id = document.getElementById('discount_id_input').value;
    var price = document.getElementById('total_price').innerHTML;
    if (card_id == '请您选择代金券号码') {
        $.dialog.alert("请您选择代金券号码", {
            autoclose: 2000,
            globalBackground: '#E74378',
            lock: false,
            globalBorder: '#E74378 solid 1px'
        });
        return;
    }
    var str_dis = '';
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "add_cash_card.php",
        data: "card_id=" + card_id + '&price=' + price,
        success: function(msg) {
            if (msg.status)
            {
                var myDiv = $('#dis_div'),
                        myP = $('#dis_div').find('p').html();

                //插入数据
                str_dis += '<p>';
                str_dis += '<span class="a_span_dis">' + msg.card_id + '</span>';
                str_dis += '<span class="b_span_dis" id="' + msg.card_id + '_money">' + msg.money + '(元)</span>';
                str_dis += '<span class="c_span_dis"><input type="radio" name="cashcard_id" value="' + msg.real_card_id + '" onclick="dis_radio(this)" /></span>';
                str_dis += '</p>';

                if (myP == '您还没有代金卷') {
                    myDiv.html(str_dis);
                } else {
                    myDiv.append(str_dis);
                }

                alert('添加成功');
            } else {
                alert(msg.msg);
            }
        }
    });
}


function showGateway()
{
    document.getElementById('gateway_desc').style.display = "";
}

function hiddenGateway()
{
    document.getElementById('gateway_desc').style.display = "none";
}




//选择学习目标
function SelectPurpose(PurposeID)
{
    var selPurposeID = PurposeID;
    var subPurpose = purposeArr[selPurposeID];
    var SubPurposebox = document.getElementById('subPurpose');
    if (subPurpose != null)
    {
        document.getElementById('subPurpose').style.display = "";
        SubPurposebox.length = 1;
        SubPurposebox.options[0] = new Option("Please Select...", -1);
        var j = 1;
        var str = '';
        for (var i in subPurpose)
        {
            str = subPurpose[i];
            SubPurposebox.options[j] = new Option(str, i);
            j++;
        }
        if (str == '')
            document.getElementById('subPurpose').style.display = "none";
    }
    else
    {
        document.getElementById('subPurpose').style.display = "none";
        if (SubPurposebox != null)
        {
            SubPurposebox.options[0] = new Option("Please Select...", -1);
            SubPurposebox.length = 1;
        }

    }
}


//选择目前水平
function SelectLevel1(levelID)
{
    var selLevelID = levelID;
    var subLevel = levelArr[selLevelID];
    var subLevelbox = document.getElementById('subLevel');
    if (subLevel != null)
    {
        document.getElementById('subLevel').style.display = "";
        subLevelbox.length = 1;
        subLevelbox.options[0] = new Option("Please Select...", -1);
        var j = 1;
        var str = '';
        for (var i in subLevel)
        {
            str = subLevel[i];
            subLevelbox.options[j] = new Option(str, i);
            j++;
        }
        if (str == '')
            document.getElementById('subLevel').style.display = "none";
    }
    else
    {
        document.getElementById('subLevel').style.display = "none";
        if (subLevelbox != null)
        {
            subLevelbox.options[0] = new Option("Please Select...", -1);
            subLevelbox.length = 1;
        }

    }
}



function getCookie(objName)
{
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName)
        {
            return unescape(temp[1]);//返回一个包含charstring内容的字符串值
        }
    }
}



function setCookie(name, value, expires, path, domain)
{
    if (!expires)
        expires = -1;
    if (!path)
        path = "/";
    var d = "" + name + "=" + value;

    var e;
    if (expires < 0) {
        e = "";
    }
    else if (expires == 0) {
        var f = new Date(1970, 1, 1);
        e = ";expires=" + f.toUTCString();
    }
    else {
        var now = new Date();
        var f = new Date(now.getTime() + expires * 86400000);
        e = ";expires=" + f.toUTCString();
    }
    var dm;
    if (!domain) {
        dm = "";
    }
    else {
        dm = ";domain=" + domain;
    }

    document.cookie = name + "=" + value + ";path=" + path + e + dm;
}




function checkSimulation()
{
    if (document.getElementById('purpose').value == 0)
    {
        alert("请选择您的目的");
        return false;
    }
    if (document.getElementById('subPurpose').style.display == "" && document.getElementById('subPurpose').value == -1)
    {
        alert("请选择您的目的");
        return false;
    }
    if (document.getElementById('levelArea').style.display == "" && document.getElementById('level').value == 0)
    {
        alert("请选择您的当前的水平");
        return false;
    }
    if (document.getElementById('subLevel').style.display == "" && document.getElementById('subLevel').value == -1)
    {
        alert("请选择您的当前的水平");
        return false;
    }
    if (document.getElementById('objectiveArea').style.display == "" && document.getElementById('objective').value == 0)
    {
        alert("请选择您的目标");
        return false;
    }
    return true;
}

//校验注册表单
function checkRegisterFormFromCaibei()
{
    //用户名
    var user_name = $('#user_name').val();
    if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
        alert('请填写正确的邮箱地址');
        return false;
    }
    if ($('#user_name_desc').text() == '该邮箱地址已经被注册,请使用其他邮箱') {
        alert('该邮箱地址已经被注册,请使用其他邮箱');
        return false;
    }

    //密码
    var password = $('#password').val();
    if (password == "")
    {
        alert('密码不能为空');
        return false;
    }
    if (password.length < 6 || password.length > 20)
    {
        alert('密码长度应在6-20位之间');
        return false;
    }
    var chk_password = $('#chk_password').val();
    if (chk_password != password) {
        alert('两次输入密码不一样');
        return false;
    }
    //英文名
    var nick_name = $('#nick_name').val();
    if (nick_name != "" && nick_name != '选填')
    {
        if (nick_name.match(/^[A-Za-z]{2,20}$/) == null)
        {
            alert('英文名仅限字母，方便老师上课时称呼您！');
            return false;
        }
    }
    return true;
}

function checkInfoForm()
{

    if (document.getElementById('mobile_code') && document.getElementById('mobile_code').value == 0)
    {
        alert("请填写您的手机验证码");
        return false;
    }
    if (document.getElementById('skype_id').value == "" && document.getElementById('qq').value == "")
    {
        alert("上课使用免费的语音软件Skype或者QQ。请填写至少一项您的账号。");
        return false;
    }
    if (document.getElementById('occup').value == 0)
    {
        alert("请选择您的人群定位");
        return false;
    }

    if (document.getElementById('purpose').value == 0)
    {
        alert("请选择您的学习目的");
        return false;
    }

    if (document.getElementById('is_test').value == 0)
    {
        if (document.getElementById('level').value == 0)
        {
            alert("请选择您当前的英语水平");
            return false;
        }
        if (document.getElementById('subLevel').style.display == "" && document.getElementById('subLevel').value == -1)
        {
            alert("请选择您的当前的英语水平");
            return false;
        }
    }
    if (document.getElementById('is_test_new').value == 'y')
    {
        if (document.getElementById('course_id').value == '')
        {
            alert('请选择教材');
            return false;
        }
    }
    return true;
}



function click_tip(sid)
{
    //不显示
    document.getElementById(sid).style.display = 'none';
    //记录
    setCookie(sid, 'y', 30, '/', '51talk.com');

}

function checkOpinionInfo()
{
    if (document.getElementById('OpinionList4').value == "")
    {
        alert('请您填写给老师的留言');
        return false;
    }
}
function opencourseDetailsBox() {
    $("#courseDetailsBox").slideDown();
}
