<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"  %>
	
<html>
<head>
<title>회원탈퇴</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" >
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" >
<style type="text/css">
table.memberDelete {
    border-collapse: seperate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
   margin : 20px 10px;

}
table.memberDelete th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.memberDelete td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>

<script type="text/javascript">
	function checkValue() {
		var form = document.userInfo;

		if (!form.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}


		if (!form.pwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		
return true;		
}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "index.html";
	}


</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#chkBtn").click(function(){
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		console.log(id);
		console.log(pwd);
		$.ajax({
			url : "deleteCheckForm.jsp",
			type : "GET",
			data : {id:id, pwd:pwd},
			success : function(data) {
				
				var s = data.trim();
				console.log(s +" : "+s.length);
				
				if(s=="ID와 PWD가 일치합니다."){
					alert("회원 인증 성공");
					//$("#submbt").prop("disabled",true);
					//$("#submbt").css("background-color", "#aaaaaa");
				}else{
					alert("회원 인증 실패");
					//$("#submbt").prop("disabled",false);
					//$("#submbt").css("background-color", "#4CAF50");
				}
				
			}
		});
	});
})

</script>
</head>
<body>
	<br>
	<br>
	<b><font size="6" color="gray">회원탈퇴</font></b>
	<br>
	<br>
	<br>

	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
	<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
	<form action="memdelete.do" name="userInfo" method="POST" onsubmit="return checkValue()">
		<table class="memberDelete">
			<tr>
				<td id="title">아이디</td>
				<td><input class="form-control"type="text" name="id" maxlength="50" id="id">
				     
				</td>

			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td><input class="form-control" type="password" name="pwd" maxlength="50"></td>
			</tr>

	
		
		</table>
		
		<br>
		<input id = "submbt" type="submit" value="탈퇴" /> 
		<input type="button" value="취소" onclick="goFirstForm()">
	</form>

</body>
</html>

