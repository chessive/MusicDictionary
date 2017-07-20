<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"  %>
	
<html>
<head>
<title>ȸ�� ���� ����</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" >
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" >
<style type="text/css">
table.memberUpdate {
    border-collapse: seperate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
   margin : 20px 10px;

}
table.memberUpdate th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.memberUpdate td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.js"></script>

<script type="text/javascript">
	function checkValue() {
		var form = document.userInfo;

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

	
	String nid = session.getAtrribute("id");
	String npwd = session.getAtrribute("pwd");
	int ngender = session.getAtrribute("gender");
	String nm_birth = session.getAttribute("m_birth");
	String nemail = session.getAttribute("email");
	
</script>


</head>
<body>
	<br>
	<br>
	<b><font size="6" color="gray">ȸ�� ���� ����</font></b>
	<br>
	<br>
	<br>

	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
	<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
	<form action="memupdate.do" name="userInfo" method="POST" onsubmit="return checkValue()">
		<table class="memberUpdate">
			<tr>
				<td id="title">���̵�</td>
				<td><input class="form-control" type="text" name="id" maxlength="50" id="id" value = nid >
				     
				</td>

			</tr>

			<tr>
				<td id="title">��й�ȣ</td>
				<td><input class="form-control" type="password" name="pwd" maxlength="50" value = npwd></td>
			</tr>

			<tr>
				<td id="title">��й�ȣ Ȯ��</td>
				<td><input class="form-control"type="password" name="pwdcheck" maxlength="50" value = npwd>
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
					<input class="form-control" name="m_birth" type="text" maxlength="10" placeholder="yyyy-mm-dd" value = nm_birth >
<!-- 					<input class="form-control" name="date2" type="text" maxlength="10" placeholder="mm">
					<input class="form-control" name="date3" type="text" maxlength="10" placeholder="dd"> -->
        		</td>
			</tr>

			<tr>
				<td id="title">�̸���</td>
				<td><input type="text" class="form-control" name="email" maxlength="50" placeholder="e-mail" value = nemail >
				</td>
			</tr>
		
		</table>
		
		<br>
		<input id = "submbt" type="submit" value="����" disabled="disabled"/> 
		<input type="button" value="���" onclick="history.back()">
	</form>

</body>
</html>

