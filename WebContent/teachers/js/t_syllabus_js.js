$(document).ready(function(){
	var date=new Date;
	var week=['周日','周一','周二','周三','周四','周五','周六'];
	date.setDate(date.getDate()+6);
	for(var i=6;i>=0;i--){
		var y=date.toLocaleDateString();
		var d=date.getDate();
		var w=date.getDay();
		date.setDate(date.getDate()-1);
		$('.rq'+i).text(y);
		$('.zj'+i).text(week[w]);
	}
	date.setDate(date.getDate()+1);//恢复今天的日期
	$('.yf').text((date.getMonth()+1)+'月');
	$('.rq').text(date.getDate());
	$(".qhz li").click(function(event){
		var mt=$(this).children('span').eq(0).text();
		var mts=mt.split('/');
		$(this).siblings().each(function(e){
			$(this).removeClass('dqrq');
		});
		$(this).addClass('dqrq');
		$('.yf').text(mts[1]+'月');
		$('.rq').text(mts[2]);
	});
});
$(function(){
	$('#mydate').glDatePicker();
});