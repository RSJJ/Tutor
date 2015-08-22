$(document).ready(function(){
	var date=new Date;
	var week=['周日','周一','周二','周三','周四','周五','周六'];
	date.setDate(date.getDate()+6);
	for(var i=6;i>=0;i--){
		var y=timeformat(date.getFullYear(),date.getMonth(),date.getDate());
		var d=date.getDate();
		var w=date.getDay();
		date.setDate(date.getDate()-1);
		$('.rq'+i).text(y);
		$('.zj'+i).text(week[w]);
	}
	date.setDate(date.getDate()+1);//恢复今天的日期
	$('.yf').text((date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1)+'月');
	$('.rq').text(date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
	$(".qhz li").click(function(event){
		var li_index=$(this).index()+1;
		var mt=$(this).children('span').eq(0).text();
		var mts=mt.split('/');
		$(this).siblings().each(function(e){
			$(this).removeClass('dqrq');
		});
		$(this).addClass('dqrq');
		$('.yf').text(mts[0]+'月');
		$('.rq').text(mts[1]);
		for(var j=1;j<8;j++){
			if(j==li_index){
				$('#kb_r'+j).css('display','block');
			}else{
				$('#kb_r'+j).css('display','none');
			}	
		}
	});
	
	
/*购物车*/
	$('.kb-sz').mouseover(function(){
		$('.kb-sz .gwxq').css('display','block');
	}).mouseout(function(){
		$('.kb-sz .gwxq').css('display','none');
	});
});
function timeformat(year,month,date){
    var datetime = new Date();
    datetime.setFullYear(year);
    datetime.setMonth(month);
    datetime.setDate(date);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    /*var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();*/
    return  month + "/" + date;
}