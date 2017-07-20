<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myungjun.*"%>
<%@page import="service.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Music Dictionary</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<link href="../css/style.css" rel="stylesheet">

<!--  외장 함수들 유용한것들로만 -->
<script type="text/javascript">
	// Parameter 갖고오는 놈임. get 사용 가능.
	var getUrlParameter = function getUrlParameter(sParam) {
		var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL
				.split('&'), sParameterName, i;

		for (i = 0; i < sURLVariables.length; i++) {
			sParameterName = sURLVariables[i].split('=');

			if (sParameterName[0] === sParam) {
				return sParameterName[1] === undefined ? true
						: sParameterName[1];
			}
		}
	};
	
	// Json 데이터 소팅하는거임. int랑 string 가능.
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var menu = getUrlParameter('menu');
		var name = getUrlParameter('name');
		
		// name이 undefined일 경우 출력 안되서
		if(name == undefined)
			name = "";
		
		var s, str="";
		var param = {};
		//
		
		param.menu = "artist";
		param.name = name;
				
		$.ajax({
			url : "/gitProject_md/board.jsp",//여기 있는 url 변경 바람
			type : "GET",
			data : 	param,
			success : function(data) {
				console.log(data);
			}
		});
	});
</script>


</head>
<body>


</body>
</html>