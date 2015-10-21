function checkBasicInf(teaId)
{
   var url = 'checkBasicInf?teacherId='+teaId;
   $.ajax({
	  url:url,
	  type:'post',
	  datatype:'json',
	  error:function(a){
		 alert("连接服务器失败")
	  },success:function(a){
	        if(a.status==400){
	        	 alert(a.statement);
	        	 location.href = "default.jsp";
	        	 //history.go(-1);
	         }
	  }
   });         
}
/**
 * @author STerOTto
 * @date 2015-6-29 11:26:06
 */

function setJson(jsonStr,name,value)
{
    if(!jsonStr)jsonStr="{}";
    var jsonObj = JSON.parse(jsonStr);
    jsonObj[name] = value;
    //JSON.stringify(jsonObj)
    return JSON.stringify(jsonObj);
}
//删除数据
function deleteJson(jsonStr,name)
{
    if(!jsonStr)return null;
    var jsonObj = JSON.parse(jsonStr);
    delete jsonObj[name];
        return JSON.stringify(jsonObj); 
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") 
//(new Date()).Format("yyyy-M-d h:m:s.S")      
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "h+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
}