<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Music Dictionary</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
		var index = getUrlParameter('index');
		
		var result;		
		
		// name이 undefined일 경우 출력 안되서
		if(name == undefined)
			name = "";
		if(menu == undefined)
			menu = "artist";
		
		console.log(index);
		
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
		param.name = name;
		param.menu = menu;
		param.index = index;
		console.log(menu);
		console.log(name);

		
		if(menu=="song"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.song_index == index){
							result = item;
							console.log(item);
							console.log(result);
					   		console.log(result.name);
						}
					});

			   		$("#content-title").empty;
			   		$("#content-title").append(result.name);

			   		console.log(result.name);
			   		console.log("content title 추가됨");		
				}
			});
		} // if문 song 종료.
		
		else if(menu=="artist"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.song_index == index){
							result = item;
							console.log(item);
							console.log(result);
						}
					});

			   		$("#content-title").empty;
			   		$("#content-title").append(result.artist_name);

			   		console.log(result.artist_name);
			   		console.log("content title 추가됨");		
				}
			});
		} // if문 artist 종료.

		else if(menu=="composer"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.composer_id == index){
							result = item;
							console.log(item);
							console.log(result);
						}
					});

			   		$("#content-title").empty;
		   			$("#content-title").append(result.composer_name);

			   		console.log("content title 추가됨");		
				}
			});
		} // if문 composer 종료.

		else if(menu=="writer"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.writer_id == index){
							result = item;
							console.log(item);
							console.log(result);
						}
					});

			   		$("#content-title").empty;
		   			$("#content-title").append(result.writer_name);

			   		console.log("content title 추가됨");		
				}
			});
		} // if문 writer 종료.
		
		else if(menu=="remaker"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.remaker_id == index){
							result = item;
							console.log(item);
							console.log(result);
						}
					});

			   		$("#content-title").empty;
		   			$("#content-title").append(result.remaker_name);

			   		console.log("content title 추가됨");		
				}
			});
		} // if문 remaker 종료.
		

		else if(menu=="album"){
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.album_name == name){
							result = item;
							console.log(item);
							console.log(result);
						}
					});

			   		$("#content-title").empty;
		   			$("#content-title").append(result.album_name);

			   		console.log("content title 추가됨");		
				}
			});
		} // if문 album 종료.
		
		<%		
//		String name = request.getParameter("name");
//		String menu = request.getParameter("menu");
		
		%>
		
		//////////////////////////  표 출력 부분 /////////////////////////////
		var sub_button_head_template = "";

		if(menu=="artist")
		{
			sub_button_head_template = "<div class='col-md-3'><a class='list-group-item'  id='sub_button1'>주요정보</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button2'>앨범</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button3'>노래</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button4'>평점</a></div>";
		}
		else if(menu=="writer" || menu=="composer" || menu=="remaker")
		{
			sub_button_head_template = "<div class='col-md-3'><a class='list-group-item'  id='sub_button1'>주요정보</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button2'>참여노래</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button3'>평점</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='sub_button4'>함께한 가수</a></div>";
		}		
		else if(menu=="song")
		{
			sub_button_head_template = "<div class='col-md-6'><a class='list-group-item'  id='sub_button1'>주요정보</a></div>"
				+ "<div class='col-md-6'><a class='list-group-item'  id='sub_button2'>평점</a></div>"
		}
		else if(menu=="album")
		{
			sub_button_head_template = "<div class='col-md-4'><a class='list-group-item'  id='sub_button1'>수록곡</a></div>"
				+ "<div class='col-md-4'><a class='list-group-item'  id='sub_button2'>가수</a></div>"
				+ "<div class='col-md-4'><a class='list-group-item'  id='sub_button3'>평점</a></div>"
		}		
		
   		$("#sub_menu").empty;					
   		$("#sub_menu").append(sub_button_head_template);
		console.log(menu);
		////////////////////////////////////////////////////////////////////

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
			<li id="li1"><a href="index.html">홈</a></li>
			<li id="li2"><a href="search_list.jsp?menu=artist">가수</a></li>
			<li id="li3"><a href="search_list.jsp?menu=song">노래</a></li>
			<li id="li4"><a href="search_list.jsp?menu=album">앨범</a></li>
			<li id="li5"><a href="search_list.jsp?menu=composer">작곡가</a></li>
			<li id="li6"><a href="search_list.jsp?menu=writer">작사가</a></li>
			<li id="li7"><a href="search_list.jsp?menu=remaker">편곡가</a></li>
		</ul>
	</div>
	</nav>

	<div class = "container">
		<div class="row"><br></div>
		<div class="row"><br></div>
		<div class="row">
			<div class="col-md-12  text-vertical-center">
				<p class="lead">
				   <h1 id = "content-title"> 
				   
				   </h1>
				   <h3> </h3>
				</p>
			</div>
		</div>
		<div class="row"><br></div>
		<div class="row"><br></div>
		
		<div class="row  text-center"  id = "sub_menu">

		</div>
		
	</div>


	<div class="container  table-responsive">

	</div>
	
</body>
</html>