/**
 * 
 * @authors Saturday (13811774679@163.com)
 * @date    2014-09-19 10:46:34
 * @version 1.0.0
 */
(function($){
	$.fn.extend({
		placeholder:function(){
			return this.each(function(index,ele){
				var bSupport="placeholder" in document.createElement("input");
				//for循环中我们使用continue；终止本次循环计入下一个循环，使用break终止整个循环。 
				//而在jquery中each则对应的使用return true 和return false。 
				if(bSupport) return true;
				var aInput=$(ele).find("input");

				aInput.each(function(index,ele){
					var oInput=$(ele);
					var placeholder=oInput.attr("placeholder");
					if(!placeholder) return true;
					var oSpan=$("<span>"+placeholder+"</span>");
					oInput.parent().css("position","relative").append(oSpan);

					var left=oInput.position().left+2;
					var top=oInput.position().top;
					var height=oInput.outerHeight();
					oSpan.css({
						"position":"absolute",
						"top":top+"px",
						"left":left+"px",
						"height":height+"px",
						"line-height":height+"px",
						"color":"#cccccc",
						"font-size":"13px"
					}).click(function(){
						oInput.focus();
						oSpan.hide();
					});
					
					oInput.focusin(function(){
						oSpan.hide();
					}).focusout(function(){
						if(this.value==""){
							oSpan.show();
						}
					});
				});
			});
			
		},
		/**
		 * 
		 * addText :  Boolean  默认:false      true:是否在表单右侧添加文本提示
		 * type    :  String   login/register  默认:login
		 * 
		 */
		formCheck:function(type,addText){
			type=type || "login";
			addText=addText || false;
			//表单验证常用的正则表达式
			var json={
				"email":{//邮箱
					"reg":/^([a-z0-9][\w\.\-]*@[0-9a-z\-]+(\.[a-z]{2,6}){1,2})$/i,
					"error":"请填写正确的邮箱地址",
					"empty":"邮箱不能为空",
					"prompt":"请填写正确的邮箱地址"
				},
				"mobile":{//手机号，不太严谨
					"reg":/^1\d{10}$/,
					"error":"请填写正确的手机号码",
					"empty":"手机号码不能为空",
					"prompt":"请填写正确的手机号码"
				},
				"register_user_name":{
					"reg":/^([a-z0-9][\w\.\-]*@[0-9a-z\-]+(\.[a-z]{2,6}){1,2})$/i,
					"error":"请填写正确的邮箱地址",
					"empty":"邮箱不能为空",
					"prompt":"请填写正确的邮箱地址，作为登录用户名"
				},
				"login_user_name":{//手机号，不太严谨
					"reg":/^([a-z0-9][\w\.\-]*@[0-9a-z\-]+(\.[a-z]{2,6}){1,2})|(1\d{10})$/i,
					"error":"用户名或手机号不存在",
					"empty":"用户名不能为空",
					"prompt":"请填写正确的邮箱地址，作为登录用户名"
				},
				"password":{
					"reg":/^([a-z0-9]{6,20})$/,
					"error":"密码长度应在6-20位之间",
					"empty":"密码不能为空",
					"prompt":"6-20位字符，可使用数字、字母和特殊字符的组合"
				},
				"recommen_mobile":{
					"reg":/^([a-z0-9]{6,20})$/,
					"error":"请填写正确的推荐手机号/推荐码",
					"empty":"推荐手机号/推荐码不能为空",
					"prompt":"请填写正确的推荐手机号/推荐码"
				},
				"nick_name":{
					"reg":/^([a-z0-9]{6,20})$/,
					"error":"请输入正确的英文名字",
					"empty":"",
					"prompt":"方便老师上课时称呼您，没有请留空！"
				},
				"age":{
					"reg":/^(\d{1,2}|100)$/,
					"error":"年龄格式不正确",
					"empty":"年龄不能为空",
					"prompt":"方便老师上课时称呼您，没有请留空！"
				},
				"address":{
					"reg":/[^\s]{1,}/,
					"error":"地址不能为空",
					"empty":"地址不能为空",
					"prompt":"地址不能为空"
				},
				"QQ":{
					"reg":/^[1-9]\d{4,11}$/,
					"error":"qq格式不正确",
					"empty":"qq不能为空",
					"prompt":"qq不能为空"
				},
				"auto_user_name":{
					"reg":/[^\s]{1,}/,
					"error":"名字格式错误",
					"empty":"名字不能为空",
					"prompt":"名字不能为空"
				}
			};

			return this.each(function(index,ele){
				var oForm=$(ele);
				var aInput=oForm.find("input[check]");
				var oBtn=oForm.find("*[submit]");
				oBtn.click(function(){
					var bOk=false;
					aInput.each(function(index,ele){
						var oInput=$(ele);
						var val=$.trim(oInput.val());
						var oSpan=oInput.next();
						
						var name=oInput.attr("name");
						if(name=="user_name"){
							name=type+"_"+name;
						}
						var regJson=json[name];
						
						var reg=regJson.reg;
						var error=regJson.error;
						var empty=regJson.empty;
						var prompt=regJson.prompt;

						//当前字段是否可以为空 empty 允许为空
						if(val==""){
							if(oInput.attr("empty")==undefined){
								//不能为空
								if(addText){
									oSpan.html(empty).addClass("tips jserror").show();
								}else{
									alert(empty);
								}
								return bOk=false;
							}else{
								return true;
							}
						}
						
						if(!reg.test(val)){
							if(addText){
								oSpan.html(error).removeClass().addClass("tips jserror").show();
							}else{
								alert(error);
							}
							return bOk=false;
						}else{
							bOk=true;
						}
					});
					//解决在ie6下用a作为提交按钮的bug  三种方案：①去掉a的href②延时③return false
					if(bOk){
						//setTimeout(function(){
						oForm.submit();
						return false;
						//},1);
					}
				});

				//添加右侧文本提示
				if(addText){
					aInput.each(function(index,ele){
						var oInput=$(ele);
						var oSpan=oInput.next();
						var name=oInput.attr("name");
						if(name=="user_name"){
							name=type+"_"+name;
						}
						var regJson=json[name];
						var reg=regJson.reg;
						var error=regJson.error;
						var empty=regJson.empty;
						var prompt=regJson.prompt;

						oInput.focusin(function(){
							oSpan.html(prompt).removeClass().addClass("tips").show();
						});
						oInput.focusout(function(){
							var val=$.trim(oInput.val());
							if(val==""){
								oInput.val("");
								oSpan.hide();
							}else{
								if(!reg.test(val)){
									oSpan.html(error).addClass("jserror").show();
								}else{
									if(oInput.attr("name")=="user_name"){
										$.ajax({
						                    type: "POST",
						                    dataType: "json",
						                    url: "check_user_name.php",
						                    data: "user_name=" + val,
						                    success: function(msg){
						                        if(msg.status){
						                            oSpan.removeClass().addClass("correct").html("").show();
						                        }else{
						                            oSpan.removeClass().addClass("tips jserror").html("该邮箱地址已经被注册,请使用其他邮箱").show();
						                        }
						                    }
						                });
									}else{
										oSpan.removeClass().addClass("correct").html("").show();
									}
								}
								
							}
							
						});
					});
				}
				
			});
		},
		formCheck2:function(type){
			type=type || "login";

			//表单验证常用的正则表达式
			var json={
				"email":{//邮箱
					"reg":/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i,
					"error":"邮箱格式不正确",
					"empty":"请填写邮箱"
				},
				"mobile":{//手机号
					"reg":/^1[0-9]{10}$/,
					"error":"请填写正确的手机号码",
					"empty":"手机号码不能为空"
				},
				"register_user_name":{
					"reg":/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i,
					"error":"邮箱格式不正确",
					"empty":"请填写邮箱",
					"used":"该邮箱地址已经被注册"
				},
				"login_user_name":{//手机号
					"reg":/^(([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6})|(1[0-9]{10})$/i,
					"error":"用户名格式错误",
					"empty":"请输入用户名",
					"notexist":"手机号尚未验证，请重新输入"
				},
				"register_password":{
					"reg":/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/,
					"error":"密码长度应在6-20位",
					"empty":"密码不能为空"
				},
				"login_password":{
					"reg":/^[^\s]{6,20}$/,
					"error":"密码格式错误",
					"empty":"密码不能为空"
				},
				"recommen_mobile":{
					"reg":/^1[0-9]{10}$/,
					"error":"请填写正确的推荐手机号/推荐码",
					"empty":"推荐手机号/推荐码不能为空"
				},
				"nick_name":{
					"reg":/^[A-Za-z0-9]{2,20}$/i,
					"error":"请输入正确的英文名字",
					"empty":""
				},
				"age":{
					"reg":/^(\d{1,2}|100)$/,
					"error":"年龄格式不正确",
					"empty":"年龄不能为空"
				},
				"address":{
					"reg":/[^\s]{1,}/,
					"error":"地址不能为空",
					"empty":"地址不能为空"
				},
				"QQ":{
					"reg":/^[1-9]{1}[0-9]{4,}$/i,
					"error":"qq格式不正确",
					"empty":"qq不能为空"
				},
				"auto_user_name":{
					"reg":/[^\s]{1,}/,
					"error":"名字格式错误",
					"empty":"名字不能为空"
				},
				"skype":{
					"reg":/^[A-Za-z]{1}[A-Za-z0-9\_\.-]{5,31}$/i,
					"error":"skype格式错误",
					"empty":"skype不能为空"
				}
			};


			return this.each(function(index,ele){
				var oForm=$(ele);
				var aInput=oForm.find("input[check]");
				var oBtn=oForm.find("input[submit]");
				oBtn.click(function(){
					var bOk=false;

					aInput.each(function(index,ele){
							var oInput=$(ele);
							var val=$.trim(oInput.val());
							var oSpan=oInput.next();
							
							var name=oInput.attr("name");
							if(name=="user_name" || name=="password"){
								name=type+"_"+name;
							}
							var regJson=json[name];
							
							var reg=regJson.reg;
							var error=regJson.error;
							var empty=regJson.empty;
							var prompt=regJson.prompt;

							//当前字段是否可以为空 empty 允许为空
							if(val==""){
								if(oInput.attr("empty")==undefined){
									//不能为空
									oInput.addClass("hover");
									oSpan.html(empty).addClass("error").slideDown();
									return bOk=false;
								}else{
									return true;
								}
							}
							
							if(!reg.test(val)){
								oInput.addClass("hover");
								oSpan.html(error).removeClass().addClass("error").slideDown();
								return bOk=false;
							}else{
								bOk=true;
							}
						});

						if(bOk){
							if(type=="register"){
								var val1=$.trim(oForm.find("input[name='recommen_mobile']").val());
								var val2=$.trim(oForm.find("input[name='mobile']").val());
								if(val1 && val1==val2){
									oForm.find("input[name='recommen_mobile']").next().removeClass().addClass("error").html("推荐人手机号不能与自己手机号相同").slideDown();
									return;
								}
								var oInput_user=oForm.find("input[name='user_name']");
								var oInput_pwd =oForm.find("input[name='password']");
								$.ajax({
				                    type: "POST",
				                    dataType: "json",
				                    url: "/user/ajax_register.php",
				                    async:false,
				                    data: "user_name=" + oInput_user.val(),
				                    success: function(msg){
				                        if(msg.status){
				                        	 bOk=true;
				                            //oSpan.slideDown();
				                        }else{
				                        	oInput_user.addClass("hover");
				                            oInput_user.next().removeClass().addClass("error").html("该邮箱地址已经被注册").slideDown();
				                            bOk=false;
				                        }
				                    }
				                });
                                /*
				                if(val1){
				                	$.ajax({
					                    type: "POST",
					                    dataType: "json",
					                    url: "/user/ajax_register.php",
					                    async:false,					                    
					                    data: {"user_name":oInput_user.val(),"password":oInput_pwd.val(),"mobile":val2,"recommen_mobile":val1},
					                    success: function(msg){
					                        if(msg.status){
					                        	 bOk=true;
					                            //oSpan.slideDown();
					                        }else{
					                        	oForm.find("input[name='recommen_mobile']").addClass("hover").next().removeClass().addClass("error").html(msg.msg).slideDown();
					                            bOk=false;
					                        }
					                    }
					                });
				                }*/
								bOk && oForm.submit();
							}else{
								var user_name=oForm.find("input[name='user_name']");
								var password=oForm.find("input[name='password']");
								$.ajax({
				                    type: "POST",
				                    dataType: "json",
				                    url: "/user/ajax_login.php",
				                    data: {"user_name":user_name.val(),"password":password.val()},
				                    success: function(msg){
				                        if(msg.status){
				                            oForm.submit();
				                        }else{
				                           if(msg.type){
				                           		password.addClass("hover").next().removeClass().addClass("error").html(msg.msg).slideDown();
				                           }else{
				                           		user_name.addClass("hover").css("border","red").next().removeClass().addClass("error").html(msg.msg).slideDown();
				                           }
				                        }
				                    }
				                });
							}

						}
					
					
				});
				//增加回车提交功能
				aInput.keyup(function(event){
				    if(event.keyCode ==13){
				   	 	oBtn.click();
				  	}
				});
				//添加文本提示
				aInput.each(function(index,ele){
					var oInput=$(ele);
					var oSpan=oInput.next();
					var name=oInput.attr("name");
					if(name=="user_name" || name=="password"){
						name=type+"_"+name;
					}

					var regJson=json[name];
					
					var reg=regJson.reg;
					var error=regJson.error;
					var empty=regJson.empty;
					var used=regJson.used;
					var prompt=regJson.prompt;

					oInput.focusin(function(){
						oSpan.slideUp();
						oInput.removeClass("hover");
					});
					oInput.focusout(function(){
						var val=$.trim(oInput.val());
						if(val==""){
							oInput.val("");
							oSpan.slideUp();
							oInput.removeClass("hover");
						}else{
							if(!(reg.test(val))){
								oInput.addClass("hover");
								oSpan.html(error).addClass("error").slideDown();
							}else{
							//新用户注册要 校验是否已注册过
								if(oInput.attr("name")=="user_name" && type=="register"){
									$.ajax({
					                    type: "POST",
					                    dataType: "json",
					                    url: "/user/ajax_register.php",
					                    data: "user_name=" + val,
					                    success: function(msg){
					                        if(msg.status){
					                            //oSpan.slideDown();
					                        }else{
					                        	oInput.addClass("hover");
					                            oSpan.removeClass().addClass("error").html(used).slideDown();
					                        }
					                    }
					                });
								}else{
									//oSpan.removeClass().addClass("correct").html("").show();
								}
								
							}
							
						}
						
					});
				});
			});

			
		},
		formCheck3:function(options){
			options=options || {};
			var defaults={
				"focus"		:false,
				"alertType"	:"alert",
				"json"		:defaultJson
			};
			
			var settings=$.extend(true,defaults,options);
			var type=settings.type;
			var alertType=settings.alertType;
			var json=settings.json;
			return this.each(function(index,ele){
				var oForm=$(ele);
				var oBtn=oForm.find(".jsSubmit");
				oBtn.click(function(){
					var aInput=oForm.find("[name].jsCheck");
					if(oForm.attr("submited")) return;
					var bOk=true;
					var errorMsg=null;
					var oNow=null;
					aInput.each(function(index,ele){
						var oInput=$(ele);
						var name=oInput.attr("name");
						var oBtn=oForm.find(".jsSubmit");
						var oInput=$(ele);
						var inputType=oInput.attr("type");
						if(inputType=="radio" || inputType=="checkbox"){
							var val=$.trim($("[name="+name+"]"+":checked").val());
						}else{
							var val=$.trim(oInput.val());
						}
						var regJson=json[name];
						var reg=regJson.reg;
						var error=regJson.error;
						var empty=regJson.empty;
						var prompt=regJson.prompt;
						var same=regJson.same;
						var choice=regJson.choice;
						//当前字段是否可以为空 empty 允许为空
						if(val=="" || val==oInput.attr("placeholder")){
							if(oInput.hasClass("jsEmpty")){
								return bOk=true;
							}else{
								if(oInput.hasClass("jsChoice")){
									bOk=false;
									errorMsg=choice;
									oNow=oInput;
									$(".jsChoice").each(function(){
										if($.trim(this.value)){
											bOk=true;
											return false;
										}
									});
									return bOk;
								}else{
									errorMsg=empty;
									oNow=oInput;
									return bOk=false;
								}
							}
						}else{
							if(!reg.test(val)){
								errorMsg=error;
								oNow=oInput;
								return bOk=false;
							}
						}
						if(oInput.hasClass("jsSame")){
							if(oInput.val()!=aInput.eq(index-1).val()){
								errorMsg=same;
								oNow=oInput;
								return bOk=false;
							}
						}
						if(oInput.hasClass("jsAjax")){
							$.ajax({
							   type: "POST",
							   dataType:"json",
							   url: regJson.url,
							   async:false,
							   data: oInput.serializeArray(),
							   success: function(res){
							   		if(!res.status){
							   			errorMsg=res.info || res.msg;
							   			oNow=oInput;
							   			bOk=false;
							   		}
								}	   
							}); 
							return bOk;
						}
					});
					if(bOk){
						_submit(oForm,settings.cb,alertType);
					}else{
						_alert(alertType,oNow,errorMsg);
					}
					
				});
	
				//失去焦点时添加文本提示
				if(settings.focus){
					var aInput=oForm.find(".jsCheck");
					aInput.each(function(index,ele){
						var oInput=$(ele);
						var name=oInput.attr("name");
						var regJson=json[name];
						var reg=regJson.reg;
						var error=regJson.error;
						var empty=regJson.empty;
						var used=regJson.used;
						var prompt=regJson.prompt;

						oInput.focusin(function(){
							hideAlert(alertType,oInput);
						});
						oInput.focusout(function(){
							var val=oInput.val();
							if(val==""){
								//oInput.val("");
							}else{
								if(!(reg.test(val))){
									_alert(alertType,oInput,error);
								}else{
									//是否需要ajax及时校验
									if(oInput.hasClass("jsAjax")){
										$.ajax({
										   type: "POST",
										   dataType:"json",
										   url: regJson.url,
										   data: oInput.serializeArray(),
										   success: function(res){
										   		if(!res.status){
										   			_alert(alertType,oInput,res.info || res.msg);
										   		}
											}	   
										}); 
									}
									
								}
								
							}
							
						});
					});
				}
				
			});
		}
	});

	//表单验证常用的正则表达式
	var defaultJson={
		"user_name":{//邮箱
			"reg":/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i,
			"error":"邮箱格式不正确",
			"empty":"请填写邮箱",
			"url":"/user/ajax_register.php"
		},
		"mobile":{//手机号
			"reg":/^1[0-9]{10}$/,
			"error":"请填写正确的手机号码",
			"empty":"手机号码不能为空"
		},
		"password":{
			"reg":/^[A-Za-z0-9\!\@\#\$\%\^\&\*\(\)]{6,20}$/,
			"error":"密码格式错误",
			"empty":"密码不能为空"
		},
		"recommen_mobile":{
			"reg":/^1[0-9]{10}$/,
			"error":"请填写正确的推荐手机号/推荐码",
			"empty":"推荐手机号/推荐码不能为空"
		}
	};
	function _alert(alertType,oInput,error){
		switch(alertType){
			case "bottom":
				oInput.addClass("hover").next().html(error).addClass("error").slideDown();
				break;
			case "left":
				//莫名其妙的报错？？？
				oInput.next().html(error).addClass("error").show();
				break;
			case "alert":
				alert(error);
				break;
			case "$alert":
				$.alert(error);
				break;
			default:
				alert(error);
				break;
		}
		
	}
	function hideAlert(alertType,oInput){
		switch(alertType){
			case "bottom":
				oInput.next().slideDown();
				break;
			case "left":
				oInput.next().hide();
				break;
		}
	}
	function _submit(oForm,cb,alertType){
		if(cb){
			$.ajax({
                type: oForm.attr("method"),
                dataType: "json",
                url: oForm.attr("action"),
                data: oForm.serializeArray(),
                success: function(res){
                	cb(res);
                }
            });
		}else{
			setTimeout(function(){
        		oForm.submit();
        	},1);
		}
		
	}
})(jQuery);