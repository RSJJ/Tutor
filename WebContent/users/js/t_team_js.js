$(document).ready(function(){
  $(".course-category-more" ).each( function( index){
       $( this ).mouseover( function(){
	    $(this).children("div.course-category-sort").show();
		$(this).siblings(".course-category-more").children("div.course-category-sort").hide();
	   }).mouseleave(function(){
		   $(this).children("div.course-category-sort").hide();
	   });
   });

});


var tag_name_index = "index";
	var tag_name_userId= "0";
    //初始化加载视频
  
    $(function(){



        
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

    });