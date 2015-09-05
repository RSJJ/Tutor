$(document).ready(function(e) {
	
	$('#js-show-psw').click(function(){
		if($(this).attr('checked')){
			$('#js-password').attr('type','text');
			/*$('#js-password-2').attr('type','text');*/
		}else{
			$('#js-password').attr('type','password');
			/*$('#js-password-2').attr('type','password');*/
		}
	});
	var phoneBox = $('.phone-box');
	var mode = 'Email';
	var isloaded = false;
	$('#js-password').change(function(){ 
		var Password = $(this).val($.trim($(this).val())).val();
		/*PXVerify.Phone(phoneNum,false,function(isok,error){
				if(isok){
					phoneBox.show();
				}else{
					if(error=='该手机已存在!'){
						showError('对不起！账号：'+phone+'已被注册！您可以使用该账号<a class="a" href="../login/@username='+username+'">直接登录</a>，或者使用其他账号注册。');
					}
				}
		});*/
		var msg = PXVerify.Password(Password)
		if(msg!=null){
			$(this).removeClass("vs").addClass("vf");
			showError(msg)
		}else{
			$(this).removeClass("vf").addClass("vs");
			clearError();
		}
	})
	
	$('#js-phone').change(function(){ 
		var phoneNum = $(this).val($.trim($(this).val())).val();
		/*PXVerify.Phone(phoneNum,false,function(isok,error){
				if(isok){
					phoneBox.show();
				}else{
					if(error=='该手机已存在!'){
						showError('对不起！账号：'+phone+'已被注册！您可以使用该账号<a class="a" href="../login/@username='+username+'">直接登录</a>，或者使用其他账号注册。');
					}
				}
		});*/
		var msg = PXVerify.Phone(phoneNum,false)
		if(msg!=null){
			$(this).removeClass("vs").addClass("vf");
			showError(msg)
		}else{
			phoneBox.show();
			$(this).removeClass("vf").addClass("vs");
			clearError();
		}
	})
	$('#js-email').change(function(){ 
		var email = $(this).val($.trim($(this).val())).val();
		/*PXVerify.Email(email,false,function(isok,error){
				if(!isok){
					if(error=='该邮箱已存在！'){
						showError('对不起！账号：'+email+'已被注册！');
					}else{
						showError(error);
					}
				}
		});*/
		var msg = PXVerify.Email(email,false)
		if(msg!=null){
			$(this).removeClass("vs").addClass("vf");
			showError(msg)
		}else{
			$(this).removeClass("vf").addClass("vs");
			clearError();
		}
	})
	
	$('#js-username').change(function(){
		var username = $(this).val($.trim($(this).val())).val();
		if(/\d{10,11}/.test(username)){
			PXVerify.Phone(username,true,function(isok,error){
				if(isok){
					phoneBox.show();
				}else{
					if(error=='该手机已存在，请登录！'){
						showError('对不起！账号：'+username+'已被注册！您可以使用该账号<a class="a" href="../login/@username='+username+'">直接登录</a>，或者使用其他账号注册。');
					}
				}
			});
			mode = 'Phone';
		}else{
			var error = PXVerify.Email(username,true,function(isok,error){
				if(!isok){
					if(error=='该邮箱已存在，请登录！'){
						showError('对不起！账号：'+username+'已被注册！您可以使用该账号<a class="a" href="../login/@username='+username+'">直接登录</a>，或者使用其他账号注册。');
					}else{
						showError(error);
					}
				}
			});
			if(error){
				if(error=='邮箱地址格式错误！'){
					showError('您输入的账号格式错误，请重新输入。');
				}else if(error=='邮箱地址不能为空！'&&!isloaded){
					
				}else{
					showError(error);
				}
			}
			phoneBox.hide();
			mode = 'Email';
		}
	}).change();
	isloaded = true;
	var isCodeOk = false;
	var rcode = null;
	$("#js-code").prop('disabled',true)//发送验证码前禁用验证码输入框；
	$('#js-get-phone').click(function(){
		var self = this;
		if($(self).data('issending'))return;
		$(self).data('issending',true);
		$(self).data('issend',false);
		$(self).prop('disabled',true).val('正在发送验证码...');
		$('#js-phone-code-tip').show();
		var error = PXVerify.SendPhoneCode($.trim($('#js-phone').val()),true,function(isok,msg){
			if(isok==1){
				rcode = msg;
				$("#js-code").prop('disabled',false)
				$(self).data('issend',true);
				var time = 60;
				$(self).val(time+'后重可新获取');
				$(self).data('sendcode-setInterval',setInterval(function(){
					if(time==0){
						clearInterval($(self).data('sendcode-setInterval'));
						$(self).prop('disabled',false).val('发送验证码').data('issending',false);
						return;
					}
					$(self).val((--time)+'后重可新获取');
				},1000));
			}else{
				alert(msg);
				$(self).prop('disabled',false).val('发送验证码').data('issending',false);
			}
		});
		if(error){
			alert(error);
			$(self).prop('disabled',false).val('发送验证码').data('issending',false);
		}
	});
	$("#js-code").change(function(){
		var value = $(this).val();
		var code = rcode;
		if(value==code){
				$(this).addClass("vs").removeClass("vf");
				isCodeOk = true;
			}else{
				$(this).addClass("vf").removeClass("vs");
				isCodeOk = false;
				}
	})
	
	var issubmit = false;
	
	$('.js-register').click(function(){
		
		if(issubmit){
			alert("请勿重复提交")
			return false;
		}
		if(!isCodeOk) {
			alert("请输入正确的验证码")
			return false;
		}
		$(".loading").show();
		var type = $(this).data("type") //获取注册类型
		var email = $('#js-email').val($.trim($('#js-email').val())).val();
		var phone = $('#js-phone').val($.trim($('#js-phone').val())).val();
		var password = $('#js-password').val($.trim($('#js-password').val())).val();
		/*var password2 = $('#js-password-2').val($.trim($('#js-password-2').val())).val();*/
		var code = $('#js-code').val($.trim($('#js-code').val())).val();
		var error = PXVerify.Register(email,phone, password, code, type , true, function(isok,error){
	        if(isok==200){
        			showError('注册成功，5秒后跳转至个人中心。。。点击'+"<a href='../user' style='color:blue;'>个人中心</a>直接跳转");
                    url = '../user';
                    setTimeout(function(){window.location.href  = url;},5000)
			}else{
				$(".loading").hide();
				$("#title").html("用户注册");
				showError(error);
				issubmit = false;
				}
			});
		if(error!=null){
			$(".loading").hide();
			showError(error);
			return false;
		}else{
			clearError();
			issubmit = true;
			$("#title").html("注册中");
		}
	});
});