<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<script src="js/glDatePicker.min.js" type="text/javascript" charset="utf-8" language="javascript"></script>
<link href="css/glDatePicker.default.css" rel="stylesheet" type="text/css"  /> 
<script type="text/javascript">
$(function(){
	$('#mydate').glDatePicker();
});
</script>
<body>
	<div style=" margin:50px auto; width:300px;">
		<input type="text" id="mydate" gldp-id="mydate"/>
		<div gldp-el="mydate" style="width:240px;height:240px;"></div>
	</div>
</body>
</html>