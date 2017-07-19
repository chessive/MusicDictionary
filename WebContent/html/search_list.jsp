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

<script type="text/javascript">
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
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var menu = getUrlParameter('menu');

		console.log(menu);

		var menu_template = "";

		menu_template = " <tr><th>명</th><th>수도</th><th>상세보기</th></tr>";

		if (menu == "artist") {
			$.ajax({
				url : "/gitProject_md/ArtistList.jsp",
				type : "GET",
				data : 	
				success : function(data) {
					console.log(data);
					console.log(data.length);
				}
			});
		}

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
			<li><a href="index.html">홈</a></li>
			<li class="active"><a href="search_list.jsp?menu=artist">가수</a></li>
			<li><a href="search_list.jsp?menu=song">노래</a></li>
			<li><a href="search_list.jsp?menu=album">앨범</a></li>
			<li><a href="search_list.jsp?menu=writer">작곡가</a></li>
			<li><a href="search_list.jsp?menu=composer">작사가</a></li>
			<li><a href="search_list.jsp?menu=remaker">편곡가</a></li>
		</ul>

	</div>
	</nav>

	<div class="container  table-responsive">
		<table id="table_menu" class="table">
			<thead>
				<tr>
					<th>이름</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody id="list">
				<tr>
					<th>김연우</th>
					<th>3</th>
				</tr>
				<tr>
					<th>윤종신</th>
					<th>4</th>
				</tr>


			</tbody>
		</table>
	</div>
</body>
</html>