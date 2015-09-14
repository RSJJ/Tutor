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
