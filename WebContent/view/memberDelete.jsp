<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"  %>
	
<html>
<head>
<title>ȸ��Ż��</title>
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
			alert("���̵� �Է��ϼ���.");
			return false;
		}


		if (!form.pwd.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		
		
return true;		
}

	// ��� ��ư Ŭ���� ùȭ������ �̵�
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
				
				if(s=="ID�� PWD�� ��ġ�մϴ�."){
					alert("ȸ�� ���� ����");
					//$("#submbt").prop("disabled",true);
					//$("#submbt").css("background-color", "#aaaaaa");
				}else{
					alert("ȸ�� ���� ����");
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
	<b><font size="6" color="gray">ȸ��Ż��</font></b>
	<br>
	<br>
	<br>

	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
	<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
	<form action="memdelete.do" name="userInfo" method="POST" onsubmit="return checkValue()">
		<table class="memberDelete">
			<tr>
				<td id="title">���̵�</td>
				<td><input class="form-control"type="text" name="id" maxlength="50" id="id">
				     
				</td>

			</tr>

			<tr>
				<td id="title">��й�ȣ</td>
				<td><input class="form-control" type="password" name="pwd" maxlength="50"></td>
			</tr>

	
		
		</table>
		
		<br>
		<input id = "submbt" type="submit" value="Ż��" /> 
		<input type="button" value="���" onclick="goFirstForm()">
	</form>

</body>
</html>

