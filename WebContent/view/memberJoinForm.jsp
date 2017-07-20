<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"  %>
	
<html>
<head>
<title>ȸ������</title>
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
			alert("���̵� �Է��ϼ���.");
			return false;
		}

/* 		if (form.idDuplication.value != "idCheck") {
			alert("���̵� �ߺ�üũ�� ���ּ���.");
			return false;
		} */

		if (!form.pwd.value) {
		//	console.log("���Ȯ��");
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}

		// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
		if (form.pwd.value != form.pwdcheck.value) {
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}
		
		if(form.m_birth.value){
			var year = Number(form.m_birth.value.substr(0,4));
			var month = Number(form.m_birth.value.substr(5,2));
			var day = Number(form.m_birth.value.substr(8,2));
			console.log("��¥Ȯ��"+month);
			
			if(year >2018||year<1800 ){
				alert("��Ȯ�� ������ �Է��ϼ���.");
				return false;
			}
			
			if(month<1||month>12){
				alert("��Ȯ�� ���� �Է��ϼ���");
				return false;
			}
			
			if(day<1||day>31){
				alert("��Ȯ�� ���� �Է��ϼ���");
				return false;
			} 
		}
		
return true;		
}

	// ��� ��ư Ŭ���� ùȭ������ �̵�
	function goFirstForm() {
		location.href = "index.html";
	}


/* 	// ���̵� �ߺ�üũ ȭ��open
	function openIdChk() {
		var form = document.userInfo;
		var url = 'IdCheckForm.jsp?id='+form.id.value;
 		window.name = "parentForm";		
		window.open(url, "chkForm",
		 */		//"width=500, height=300, resizable = no, scrollbars = no");
 
/* 		function inputIdChk(){
            document.userInfo.idDuplication.value ="idcheck";
        } */

		//��� �� ����
	
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
					//�ߺ�X
					alert("id ��� �����մϴ�.");
					$("#submbt").prop("disabled",false);
					//$("#submbt").css("background-color", "#aaaaaa");
				}else if(s=="fail"){
					alert("�̹� ��� ���� id�Դϴ�.");
					$("#submbt").prop("disabled",true);
					//$("#submbt").css("background-color", "#4CAF50");
				}else{
					alert("����� id�� �Է��ϼ���.");
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
	<b><font size="6" color="gray">ȸ������</font></b>
	<br>
	<br>
	<br>

	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
	<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
	<form action="memjoin.do" name="userInfo" method="POST" onsubmit="return checkValue()">
		<table class="memberJoin">
			<tr>
				<td id="title">���̵�</td>
				<td><input class="form-control"type="text" name="id" maxlength="50" id="id">
				     <input id="chkBtn" type="button" value="�ߺ�Ȯ��"  >
				</td>

			</tr>

			<tr>
				<td id="title">��й�ȣ</td>
				<td><input class="form-control" type="password" name="pwd" maxlength="50"></td>
			</tr>

			<tr>
				<td id="title">��й�ȣ Ȯ��</td>
				<td><input class="form-control"type="password" name="pwdcheck" maxlength="50">
				</td>
			</tr>

			<tr>
				<td id="title">����</td>
				<td><input type="radio" name="gender" value="1">�� &nbsp; 
					<input type="radio" name="gender" value="2">��</td>
			</tr>
			<tr>
				<td id="title">�������</td>
				<td>
					<input class="form-control" name="m_birth" type="text" maxlength="10" placeholder="yyyy-mm-dd">
<!-- 					<input class="form-control" name="date2" type="text" maxlength="10" placeholder="mm">
					<input class="form-control" name="date3" type="text" maxlength="10" placeholder="dd"> -->
        		</td>
			</tr>

			<tr>
				<td id="title">�̸���</td>
				<td><input type="text" class="form-control" name="email" maxlength="50" placeholder="e-mail">
				</td>
			</tr>
		
		</table>
		
		<br>
		<input id = "submbt" type="submit" value="����" disabled="disabled"/> 
		<input type="button" value="���" onclick="goFirstForm()">
	</form>

</body>
</html>

