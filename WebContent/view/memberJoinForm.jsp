<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"  %>
	
<html>
<head>
<title>회원가입</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" >
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" >
<style type="text/css">
table.memberJoin {
    border-collapse: seperate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
   margin : 20px 10px;

}
table.memberJoin th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.memberJoin td {
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

/* 		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		} */

		if (!form.pwd.value) {
		//	console.log("비번확인");
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (form.pwd.value != form.pwdcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if(form.m_birth.value){
			var year = Number(form.m_birth.value.substr(0,4));
			var month = Number(form.m_birth.value.substr(5,2));
			var day = Number(form.m_birth.value.substr(8,2));
			console.log("날짜확인"+month);
			
			if(year >2018||year<1800 ){
				alert("정확한 연도를 입력하세요.");
				return false;
			}
			
			if(month<1||month>12){
				alert("정확한 달을 입력하세요");
				return false;
			}
			
			if(day<1||day>31){
				alert("정확한 일을 입력하세요");
				return false;
			} 
		}
		
return true;		
}

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "index.html";
	}


/* 	// 아이디 중복체크 화면open
	function openIdChk() {
		var form = document.userInfo;
		var url = 'IdCheckForm.jsp?id='+form.id.value;
 		window.name = "parentForm";		
		window.open(url, "chkForm",
		 */		//"width=500, height=300, resizable = no, scrollbars = no");
 
/* 		function inputIdChk(){
            document.userInfo.idDuplication.value ="idcheck";
        } */

		//경로 재 설정
	
</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#chkBtn").click(function(){
		var id = $("#id").val();
		console.log(id);
		$.ajax({
			url : "IdCheckForm.jsp",
			type : "GET",
			data : { id:id},
			success : function(data) {
				
				var s = data.trim();
				console.log(s +" : "+s.length);
				
				if(s=="ok"){
					//중복X
					alert("id 사용 가능합니다.");
					$("#submbt").prop("disabled",false);
					//$("#submbt").css("background-color", "#aaaaaa");
				}else if(s=="fail"){
					alert("이미 사용 중인 id입니다.");
					$("#submbt").prop("disabled",true);
					//$("#submbt").css("background-color", "#4CAF50");
				}else{
					alert("사용할 id를 입력하세요.");
					$("#submbt").prop("disabled",true);
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
	<b><font size="6" color="gray">회원가입</font></b>
	<br>
	<br>
	<br>

	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
	<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
	<form action="memjoin.do" name="userInfo" method="POST" onsubmit="return checkValue()">
		<table class="memberJoin">
			<tr>
				<td id="title">아이디</td>
				<td><input class="form-control"type="text" name="id" maxlength="50" id="id">
				     <input id="chkBtn" type="button" value="중복확인"  >
				</td>

			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td><input class="form-control" type="password" name="pwd" maxlength="50"></td>
			</tr>

			<tr>
				<td id="title">비밀번호 확인</td>
				<td><input class="form-control"type="password" name="pwdcheck" maxlength="50">
				</td>
			</tr>

			<tr>
				<td id="title">성별</td>
				<td><input type="radio" name="gender" value="1">남 &nbsp; 
					<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr>
				<td id="title">생년월일</td>
				<td>
					<input class="form-control" name="m_birth" type="text" maxlength="10" placeholder="yyyy-mm-dd">
<!-- 					<input class="form-control" name="date2" type="text" maxlength="10" placeholder="mm">
					<input class="form-control" name="date3" type="text" maxlength="10" placeholder="dd"> -->
        		</td>
			</tr>

			<tr>
				<td id="title">이메일</td>
				<td><input type="text" class="form-control" name="email" maxlength="50" placeholder="e-mail">
				</td>
			</tr>
		
		</table>
		
		<br>
		<input id = "submbt" type="submit" value="가입" disabled="disabled"/> 
		<input type="button" value="취소" onclick="goFirstForm()">
	</form>

</body>
</html>

