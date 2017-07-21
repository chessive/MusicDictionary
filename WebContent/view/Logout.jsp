<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeleteMemberForm</title>
</head>
<body>

<script type="text/javascript">

function logoutcheck(){
	var msg = "로그아웃 하시겠습니까?";
	var flag = confirm(msg);

	if(flag == true){
		console.log("로그아웃");
		<%session.invalidate();%>
		msg = "로그아웃 성공";
		alert("로그아웃성공");
		//response.sendRedirect("index.html");
		history.go(-1);
	}
	else{ 
		alert("로그아웃취소");
		window.history.back();
		response.sendRedirect("index.html");
		//location.href="index.html";
	}
	
	
}
	
</script>

<input type = "button" name="logoutbtn" onclick="logoutcheck()" value="로그아웃">
</body>
</html>