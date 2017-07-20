<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
		if(menu=="artist")
			document.getElementById("li2").className = "active";
		else if(menu=="song")
			document.getElementById("li3").className = "active";
		else if(menu=="album")
			document.getElementById("li4").className = "active";
		else if(menu=="composer")
			document.getElementById("li5").className = "active";
		else if(menu=="writer")
			document.getElementById("li6").className = "active";
		else if(menu=="remaker")
			document.getElementById("li7").className = "active";
		
		var s, str="";
		
		var param = {};
		param.id = id;
		param.menu = menu;
		console.log(menu);
		console.log(name);

	});

</script>


</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">음악 대백과사전</a>
		</div>
		<ul class="nav navbar-nav">
			<li id = "li1"><a href="index.html">홈</a></li>
			<li id = "li2"><a href="search_list.jsp?menu=artist">가수</a></li>
			<li id = "li3"><a href="search_list.jsp?menu=song">노래</a></li>
			<li id = "li4"><a href="search_list.jsp?menu=album">앨범</a></li>
			<li id = "li5"><a href="search_list.jsp?menu=composer">작곡가</a></li>
			<li id = "li6"><a href="search_list.jsp?menu=writer">작사가</a></li>
			<li id = "li7"><a href="search_list.jsp?menu=remaker">편곡가</a></li>
		</ul>
	</div>
	</nav>

	<div class="container  table-responsive">
		<table id="table_menu" class="table">
			<thead id="table_head">
			</thead>
			<tbody id="table_body">

			</tbody>
		</table>
	</div>
</body>
</html>