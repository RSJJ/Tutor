//校验注册表单
function checkRegisterForm() {
    //用户名
    var user_name = $('#fast_user_name').val();
    if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
        alert('请填写正确的邮箱地址');
        return false;
    }
    //密码
    var password = $('#fast_password').val();
    if (password == "") {
        alert('密码不能为空');
        return false;
    }
    if (password.length < 6 || password.length > 20) {
        alert('密码长度应在6-20位之间');
        return false;
    }
    //英文名
    var nick_name = $('#fast_nick_name').val();
    if (nick_name != '选填' && nick_name != '') {
        if (nick_name.match(/^[A-Za-z]{2,20}$/) == null) {
            alert('英文名仅限字母，方便老师上课时称呼您！');
            return false;
        }
    }
    //mobile
    var mobile = $('#fast_mobile').val();
    if (mobile.match(/^1[0-9]{10}$/) == null) {
        alert('请填写正确的手机号码');
        return false;
    }
    //推荐人的手机号码是否合法,合法返回true提交，不合法返回false取消提交
    //return validate_recommen_mobile();
    //因推荐码格式多样化，暂时取消验证推荐人的判断
	return true;
}

//验证推荐人
function validate_recommen_mobile() {
    var mobile = $('#fast_mobile').val();
    var recommenMobile = $('#recommen_mobile').val() || '没有推荐人请留空';
    if (recommenMobile != '' && recommenMobile != '没有推荐人请留空' && recommenMobile != '手机号/推荐码/留空') {
        if (recommenMobile.match(/^1[0-9]{10}$/) == null && recommenMobile.toLowerCase() != 'dcm' && recommenMobile != '1335151' && recommenMobile.toLowerCase() != 'happynewyear' && recommenMobile.match(/^[a-zA-z]{2,3}1[0-9]{10}$/) == null && recommenMobile.match(/^[a-zA-z0-9]{6}$/) == null && recommenMobile.toLowerCase() != 'vipt4a2lk' && recommenMobile.match(/^[0-9]{14}$/) == null && recommenMobile.toLowerCase() != '51talk888') {
            alert('请填写正确的推荐人手机号码，没有推荐人请留空！');
            return false;
        } else if (mobile == recommenMobile) {
            alert('推荐人手机号不可以写自己的手机号哦，亲！');
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
}

//去掉前后空格
function trimStr(value) {
    return value.replace(/(^\s*)|(\s*$)/g, "");
}

//校验注册表单
function NewCheckRegisterForm() {
    //用户名
    var user_name = $('#fast_user_name').val();
    if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
        alert('请填写正确的邮箱地址');
        return false;
    }
    //密码
    var password = $('#fast_password').val();
    if (password == "") {
        alert('密码不能为空');
        return false;
    }
    if (password.length < 6 || password.length > 20) {
        alert('密码长度应在6-20位之间');
        return false;
    }

    //mobile
    var mobile = $('#fast_mobile').val();
    if (mobile.match(/^1[0-9]{10}$/) == null) {
        alert('请填写正确的手机号码');
        return false;
    }
    //推荐人的手机号码是否合法,合法返回true提交，不合法返回false取消提交
    return NewValidateRecommenMobile();
}

//验证推荐人
function NewValidateRecommenMobile() {
    var mobile = $('#fast_mobile').val();
    var recommenMobile = $('#recommen_mobile').val() || '没有推荐人请留空';
    if (recommenMobile != '' && recommenMobile != '没有推荐人请留空' && recommenMobile != '推荐人手机号/优惠码' && recommenMobile != '[可不填]推荐人手机号/优惠码') {
        if (recommenMobile.match(/^1[0-9]{10}$/) == null && recommenMobile.toLowerCase() != 'dcm' && recommenMobile != '1335151' && recommenMobile.toLowerCase() != 'happynewyear' && recommenMobile.match(/^[a-zA-z]{2,3}1[0-9]{10}$/) == null && recommenMobile.match(/^[a-zA-z0-9]{6}$/) == null && recommenMobile.toLowerCase() != 'vipt4a2lk' && recommenMobile.toLowerCase() != '51talk888') {
            alert('请填写正确的推荐人手机号码，没有推荐人请留空！');
            return false;
        } else if (mobile == recommenMobile) {
            alert('推荐人手机号不可以写自己的手机号哦，亲！');
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
}

//校验注册表单
function FooterCheckRegisterForm() {
    //用户名
    var user_name = $('#footer_user_name').val();
    if (user_name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == null) {
        alert('请填写正确的邮箱地址');
        return false;
    }
    //密码
    var password = $('#footer_password').val();
    if (password == "") {
        alert('密码不能为空');
        return false;
    }
    if (password.length < 6 || password.length > 20) {
        alert('密码长度应在6-20位之间');
        return false;
    }

    //mobile
    var mobile = $('#footer_mobile').val();
    if (mobile.match(/^1[0-9]{10}$/) == null) {
        alert('请填写正确的手机号码');
        return false;
    }
    //推荐人的手机号码是否合法,合法返回true提交，不合法返回false取消提交
    return FooterValidateRecommenMobile();
}

//验证推荐人
function FooterValidateRecommenMobile() {
    var mobile = $('#footer_mobile').val();
    var recommenMobile = $('#footer_recommen_mobile').val() || '没有推荐人请留空';
    if (recommenMobile != '' && recommenMobile != '没有推荐人请留空' && recommenMobile != '推荐人手机号/优惠码') {
        if (recommenMobile.match(/^1[0-9]{10}$/) == null && recommenMobile.toLowerCase() != 'dcm' && recommenMobile != '1335151' && recommenMobile.toLowerCase() != 'happynewyear' && recommenMobile.match(/^[a-zA-z]{2,3}1[0-9]{10}$/) == null && recommenMobile.match(/^[a-zA-z0-9]{6}$/) == null && recommenMobile.toLowerCase() != 'vipt4a2lk') {
            alert('请填写正确的推荐人手机号码，没有推荐人请留空！');
            return false;
        } else if (mobile == recommenMobile) {
            alert('推荐人手机号不可以写自己的手机号哦，亲！');
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
}