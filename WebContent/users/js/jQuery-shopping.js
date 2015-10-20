	 /*
      * Jquery—shopping   0.1
      * Copyright (c) 2013  Nicky Yan   个人网：站http://www.chinacoder.cn  QQ：525690001
      * Date: 2013-04-02
      * 使用Jquery—shopping可以很方便的实现加入购物车效果
	 */

;(function($){
	$.extend($.fn,{
		shoping:function(options){
			var self=this,
				$shop=$('.J-shoping'),
				$title=$('.J-shoping-title'),
				$body=$('.J-shoping-body'),
				$num=$('.J-shoping-num'),
				$close=$('.J-shoping-close');
			var S={
					
				init:function(){
					$title.bind('click',this.clickOnTitle);
					$close.live('click',this.removeList);
					$(self).data('click',true).live('click',this.addShoping);
					$(document).bind('click',S.slideBoxMini);
					$body.bind('click',this.clickOnBody);
				},
				clickOnBody:function(e){
					if(!$(e.target).hasClass('J-shoping-close')){
						e.stopPropagation(); //阻止冒泡	
					};
				},
				addShoping:function(e){
					e.stopPropagation();
					var $target=$(e.target),
						id=$target.attr('id'),
						dis=$target.data('click'),
					  x = $target.offset().left + 30,
						y = $target.offset().top + 10,
						X = $shop.offset().left+$shop.width()/2-$target.width()/2+10,
						Y = $shop.offset().top;
					var ttt=$('#'+id).parent().children('input').val();
					
					var teacher="李宏伟";
					var course="数学";
//					var time=$('#'+id).parent().parent().parent().children('td:eq(0)').text();
					var scheduleId = $('#'+id).parent().children("input[name='schduleId']").val();
//					var month=$('.yf').text(),
//						day=$('.rq').text(),
//						date=month+day+'日';
					if(dis){
						if ($('#floatOrder').length <= 0) {
							$('body').append('<div id="floatOrder"><img src="images/course.png" width="50" height="50" /></div');
						};
						var $obj=$('#floatOrder');
						if(!$obj.is(':animated')){
							$obj.css({'left': x,'top': y}).animate({'left': X,'top': Y-80},500,function() {
								$obj.stop(false, false).animate({'top': Y-20,'opacity':0},500,function(){
									$obj.fadeOut(300,function(){
										$obj.remove();	
										$target.data('click',false).addClass('dis-click');
										var l=$('.J-shoping-list').length,
											num=Number($num.text());
										$.ajax({
											 url:"post",
											 url:"getShopCart.action",
											 data:{
												 scheduleId:scheduleId,
												 courseId:$("#courseId").val()
												 
											 },
											 success:function(shopCarts){
												 $num.text(shopCarts.length);
												 var bodyHtml = "";
												 for(var i =0; i<shopCarts.length; i++){
													 var shopCart = shopCarts[i];
													 
													 bodyHtml += '<div class="J-shoping-list" data-id="'+i+
															 '"> <input type="hidden" name="scheduleIds" value="'+
															 shopCart.courseId+'" > <a href="javascript:void();"title=""><img src="images/course.png" width="50"height="50"/></a><div class="J-shoping-list-a"><p><span class="left">'+
															 shopCart.course.teacherName+'</span><span class="mright">'+
															 shopCart.course.courseName+'</span></p><p><span class="left">'+
															 shopCart.course.date+' '+
															 shopCart.course.time+'</span><span class="mright"><em>'+
															 shopCart.price+
															 '元</em></span></p></div><div class="baseBg J-shoping-close"></div></div>';
												 }
												 bodyHtml += '<div class="J-shoping-buy">' +
													'<a class="baseBg" href="javascript:void();" id="settlement" title="去购物车结算"></a>'+
													'</div>';
												 $body.html(bodyHtml);
											 }
										 });
									});
								});
							});	
						};
					};
				},
				clickOnTitle:function(e){
					e.stopPropagation();
					var length=$('.J-shoping-list').length;	
					if(length>0){
						if(!$shop.hasClass('J-shoping-small')){
							$body.slideToggle();	
						}else{
							$('.J-shoping-mx').hide();
							$('.J-shoping-px').show();
							$shop.animate({'width':289},100,function(){
								$shop.removeClass('J-shoping-small');
								$body.slideDown();
							});
						};
					};
				},
				slideBoxMini:function(){
					$('.J-shoping-px,.J-shoping-body').hide();
					$('.J-shoping-mx').show();
					$shop.animate({'width':119},100,function(){
						$shop.addClass('J-shoping-small');
					});	
				},
				removeList:function(e){
					e.stopPropagation();
					var $target=$(e.target),
						$parent=$target.parents('.J-shoping-list'),
						id=$parent.attr('data-id');
					$parent.addClass('J-shoping-list-remove').fadeOut(300,function(){
						$('#'+id).data('click',true).removeClass('dis-click');
						$parent.remove();
						S.hideBody();
						if(options&&options.callback){
							options.callback($(self));	
						};	
					});	
				},
				hideBody:function(){
					var length=$('.J-shoping-list').length;	
					$num.text(length);
					if(length==0){
						$('.J-shoping-px,.J-shoping-body').hide();
						$('.J-shoping-mx').show();
						$shop.animate({'width':119},100,function(){
							$shop.addClass('J-shoping-small');
						});	
					};
				}
			};
			S.init(); 
		}
	});	
})(jQuery);

