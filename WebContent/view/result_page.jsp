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


	// Sorting 방법론
	function nameSort(a, b) {
	  if(a.name == b.name){ return 0} return  a.name > b.name ? 1 : -1;
	}


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
		
		// 이곳에 나중에 각 오브젝트 저장될 것임.
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
//							console.log(item);
//							console.log(result);
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
//							console.log(item);
//							console.log(result);
						}
					});

			   		$("#content-title").empty;
		   			$("#content-title").append(result.album_name);

			   		console.log("content title 추가됨");		
				}
			});
		} // if문 album 종료.
		
		<%//		String name = request.getParameter("name");
			//		String menu = request.getParameter("menu");%>
		
		//////////////////////////  표 출력 부분 /////////////////////////////
		var sub_button_head_template = "";

		if(menu=="artist")
		{
			sub_button_head_template = "<div class='col-md-3'><a class='list-group-item'  id='artist_info'>주요정보</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='artist_album'>앨범</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='artist_song'>노래</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='rating'>평점</a></div>";
		}
		else if(menu=="writer" || menu=="composer" || menu=="remaker")
		{
			sub_button_head_template = "<div class='col-md-3'><a class='list-group-item'  id='wcr_info'>주요정보</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='wcr_song'>참여노래</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='rating'>평점</a></div>"
				+ "<div class='col-md-3'><a class='list-group-item'  id='wcr_singer'>함께한 가수</a></div>";
		}		
		else if(menu=="song")
		{
			sub_button_head_template = "<div class='col-md-6'><a class='list-group-item'  id='song_info'>주요정보</a></div>"
				+ "<div class='col-md-6'><a class='list-group-item'  id='rating'>평점</a></div>"
		}
		else if(menu=="album")
		{
			sub_button_head_template = "<div class='col-md-4'><a class='list-group-item'  id='album_song'>수록곡</a></div>"
				+ "<div class='col-md-4'><a class='list-group-item'  id='album_singer'>가수</a></div>"
				+ "<div class='col-md-4'><a class='list-group-item'  id='rating'>평점</a></div>"
		}		
		
   		$("#sub_menu").empty;					
   		$("#sub_menu").append(sub_button_head_template);
		console.log(menu);
		////////////////////////////////////////////////////////////////////

		var sub_menu_state = 1;
		var sub_content_html = "";
		var sub_param = {};
		var sub_result, s;
		var sub_menu_head = "";
		var sub_menu_template = "";
		var sub_result_url = "";

		// 가수의 정보창 쳤을 때
			$(document).on("click", "#artist_info", function() {
				$('#sub_content').show();  
		   		$("#main_content").empty();
		   		$("#table_head").empty();
		   		$("#table_body").empty();
	   			$("#main_content").append("<img src =" + result.url + "><br><br>");
	   			$("#main_content").append("이름 : " + result.artist_name + "<br>");
	   			$("#main_content").append("데뷔날짜 : " + result.debut_date + "<br>");
	   			if(result.member_num > 1)
	   				$("#main_content").append("멤버 수 : " + result.member_num + "<br>");

   				$("#main_content").append("<br><br>" + result.info + "<br>");
   				
	   			return false;
		 });

			// 가수 앨범 선택했을 때
			$(document).on("click", "#artist_album", function() {
				menu_template_head = "<tr><th>#</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
				menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";

				sub_param.menu = "album";

				$('#sub_content').hide();  
		   		$("#table_head").empty();
		   		$("#table_head").append(menu_template_head);
		   		$("#table_body").empty();
				
				$.ajax({
					url : "/gitProject_md/searchService.jsp",
					type : "GET",
					data : sub_param,
					success : function(data) {
						data = JSON.parse(data);
						data.forEach(function(item, ind) {							
							if( ( item.artist_id_1 != undefined && item.artist_id_1 == result.artist_id )
							| 	( item.artist_id_2 != undefined && item.artist_id_2 == result.artist_id )
							| 	( item.artist_id_3 != undefined && item.artist_id_3 == result.artist_id )
							| 	( item.artist_id_4 != undefined && item.artist_id_4 == result.artist_id )
							| 	( item.artist_id_5 != undefined && item.artist_id_5 == result.artist_id )
							| 	( item.artist_id_6 != undefined && item.artist_id_6 == result.artist_id )
							)
							{
								console.log("SEARCH 성공!");
					   			s = menu_template;
					   			sub_result_url = "result_page.jsp?menu=album&name=" + item.album_name;
		 			   			s = s.replace("_site", sub_result_url);
		 			   			s = s.replace("_index", item.album_id);
					   			s = s.replace("_name", item.album_name);
					   			s = s.replace("_artist", item.artist_name);
					   			s = s.replace("_rating", item.rating_id);
					   			s = s.replace("_count", item.count);
						   		$("#table_body").append(s);
							}
						});
					}
				});
		 }); // 가수->앨범 선택	on 이벤트 끝
		
			// 가수 노래 선택했을 때
			$(document).on("click", "#artist_song", function() {
				menu_template_head = "<tr><th>#</th><th>노래명</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
				menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_album</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";

				sub_param.menu = "song";

				$('#sub_content').hide();  
		   		$("#table_head").empty();
		   		$("#table_head").append(menu_template_head);
		   		$("#table_body").empty();
				
				$.ajax({
					url : "/gitProject_md/searchService.jsp",
					type : "GET",
					data : sub_param,
					success : function(data) {
						data = JSON.parse(data);
						data.sort(nameSort);
						data.forEach(function(item, ind) {							
							if( ( item.artist_id_1 != undefined && item.artist_id_1 == result.artist_id )
							| 	( item.artist_id_2 != undefined && item.artist_id_2 == result.artist_id )
							| 	( item.artist_id_3 != undefined && item.artist_id_3 == result.artist_id )
							| 	( item.artist_id_4 != undefined && item.artist_id_4 == result.artist_id )
							| 	( item.artist_id_5 != undefined && item.artist_id_5 == result.artist_id )
							)
							{
								console.log("SEARCH 성공!");
					   			sub_result = menu_template;
					   			sub_result_url = "result_page.jsp?menu=song&index=" + item.song_index;
		 			   			sub_result = sub_result.replace("_site", sub_result_url);
		 			   			sub_result = sub_result.replace("_index", item.song_index);
					   			sub_result = sub_result.replace("_name", item.name);
					   			sub_result = sub_result.replace("_album", item.album_name);
					   			sub_result = sub_result.replace("undefined", "");
					   			sub_result = sub_result.replace("_artist", item.artist_name);
					   			sub_result = sub_result.replace("_rating", item.rating_id);
					   			sub_result = sub_result.replace("_count", item.count);
						   		$("#table_body").append(sub_result);
							}
						});
					}
				});
		 }); // 가수->노래 선택	on 이벤트 끝
		
		// 노래의 정보창 쳤을 때
		$(document).on("click", "#song_info", function() {
			$('#sub_content').show();  
	   		$("#main_content").empty();
			$("#table_head").empty();
		  	$("#table_body").empty();
	   		$("#main_content").append("이름 : " + result.name + "<br>");
	   		$("#main_content").append("발매날짜 : " + result.publish_date + "<br>");
	   		if(result.publisher_name != undefined)
	   			$("#main_content").append("기획사 : " + result.publisher_name + "<br>");
	   		if(result.album_name != undefined)
	   			$("#main_content").append("앨범명 : " + result.album_name + "<br>");
	   		return false;
		 });
		 
		// 평점창 쳤을 때
		$(document).on("click", "#rating", function() {

			menu_template_head = "<tr><th>평점</th><th>코멘트</th></tr>";
			menu_template = "<tr><td>_rating</td><td>_comment</td></tr>";
			
			sub_param = {};
			sub_param.rating_id = result.rating_id;
			sub_param.url = location.href;
			
			$('#sub_content').show();  
			$("#main_content").empty();
			$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
		  	$("#table_body").empty();

			$.ajax({
				url : "/gitProject_md/html/Review.jsp",
				type : "GET",
				data : 	sub_param,
				success : function(data){
			   		$("#main_content").html(data);	
				}
			});		  	
		  	
			$.ajax({
				url : "/gitProject_md/tempsearchreview.jsp",
				type : "GET",
				data : 	sub_param,
				success : function(data){
					data = JSON.parse(data);
					data.forEach(function(item, ind) {
						if(item.rating_id == result.rating_id){
				   			sub_result = menu_template;
				   			console.log(item.comment_id);
				   			sub_result = sub_result.replace("_rating", item.rating);
				   			sub_result = sub_result.replace("_comment", item.review_comment);
					   		$("#table_body").append(sub_result);							
						}
					});
				}
			});
			
		}); // 평점 끝
		
		// 작곡가, 작사가, 편곡가 노래 선택했을 때
		$(document).on("click", "#wcr_song", function() {
			menu_template_head = "<tr><th>#</th><th>노래명</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_album</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";

			sub_param.menu = "song";

			$('#sub_content').hide();  
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
	   		$("#table_body").empty();
			
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : sub_param,
				success : function(data) {
					data = JSON.parse(data);
					data.sort(nameSort);
					data.forEach(function(item, ind) {
						if((menu == 'composer' && ( ( item.composer_id_1 != undefined && item.composer_id_1 == result.composer_id )
								| 	( item.composer_id_2 != undefined && item.composer_id_2 == result.composer_id )
								| 	( item.composer_id_3 != undefined && item.composer_id_3 == result.composer_id )
								| 	( item.composer_id_4 != undefined && item.composer_id_4 == result.composer_id )
								| 	( item.composer_id_5 != undefined && item.composer_id_5 == result.composer_id )
								)) |
								(menu == 'writer' && ( ( item.writer_id_1 != undefined && item.writer_id_1 == result.writer_id )
										| 	( item.writer_id_2 != undefined && item.writer_id_2 == result.writer_id )
										| 	( item.writer_id_3 != undefined && item.writer_id_3 == result.writer_id )
										| 	( item.writer_id_4 != undefined && item.writer_id_4 == result.writer_id )
										| 	( item.writer_id_5 != undefined && item.writer_id_5 == result.writer_id )
										)) |
										(menu == 'remaker' && ( ( item.remaker_id_1 != undefined && item.remaker_id_1 == result.remaker_id )
												| 	( item.remaker_id_2 != undefined && item.remaker_id_2 == result.remaker_id )
												| 	( item.remaker_id_3 != undefined && item.remaker_id_3 == result.remaker_id )
												| 	( item.remaker_id_4 != undefined && item.remaker_id_4 == result.remaker_id )
												| 	( item.remaker_id_5 != undefined && item.remaker_id_5 == result.remaker_id )
												)) 
						)
						{
							console.log("SEARCH 성공!");
				   			sub_result = menu_template;
				   			sub_result_url = "result_page.jsp?menu=song&index=" + item.song_index;
	 			   			sub_result = sub_result.replace("_site", sub_result_url);
	 			   			sub_result = sub_result.replace("_index", item.song_index);
				   			sub_result = sub_result.replace("_name", item.name);
				   			sub_result = sub_result.replace("_album", item.album_name);
				   			sub_result = sub_result.replace("undefined", "");
				   			sub_result = sub_result.replace("_artist", item.artist_name);
				   			sub_result = sub_result.replace("_rating", item.rating_id);
				   			sub_result = sub_result.replace("_count", item.count);
					   		$("#table_body").append(sub_result);
						}
					});
				}
			});
	 }); // 작곡가->노래 선택	on 이벤트 끝
		
		// 가수 노래 선택했을 때
		$(document).on("click", "#album_song", function() {
			menu_template_head = "<tr><th>#</th><th>노래명</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_album</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";

			sub_param.menu = "song";

			$('#sub_content').hide();  
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
	   		$("#table_body").empty();
			
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : sub_param,
				success : function(data) {
					data = JSON.parse(data);
					data.sort(nameSort);
					data.forEach(function(item, ind) {							
						if( ( item.album_name != undefined && item.album_name == result.album_name )
						)
						{
							console.log("SEARCH 성공!");
				   			sub_result = menu_template;
				   			sub_result_url = "result_page.jsp?menu=song&index=" + item.song_index;
	 			   			sub_result = sub_result.replace("_site", sub_result_url);
	 			   			sub_result = sub_result.replace("_index", item.song_index);
				   			sub_result = sub_result.replace("_name", item.name);
				   			sub_result = sub_result.replace("_album", item.album_name);
				   			sub_result = sub_result.replace("undefined", "");
				   			sub_result = sub_result.replace("_artist", item.artist_name);
				   			sub_result = sub_result.replace("_rating", item.rating_id);
				   			sub_result = sub_result.replace("_count", item.count);
					   		$("#table_body").append(sub_result);
						}
					});
				}
			});
	 }); // 앨범->노래 선택	on 이벤트 끝
	 
	 
	}); // ready 끝 
	
	//////////////////// 청소해줘야함. 여기서해
	$(document).on("click", "#sub_menu", function() {
   		$("#main_content").empty();
	        return false;
	 });
	
	/////////////////////////////
	
	$(document).on("click", "tr", function() {
        document.location = $(this).data('href');
        conssole.log(data-href);
        return false;
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

	<div class="container">
		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>
		<div class="row">
			<div class="col-md-12  text-vertical-center">
				<p class="lead">
				<h1 id="content-title"></h1>
				<h3></h3>
				</p>
			</div>
		</div>
		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>

		<div class="row  text-center" id="sub_menu"></div>

		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>
		<div class="row">
			<br>
		</div>

	</div>



	<div class="container">
		<div class="text-vertical-center  col-md-12  well well-lg"
			id="sub_content" style="display: none">
			<div class="text-vertical-center  col-md-12" id="main_content">
			</div>
		</div>
		<table id='table_menu' class='table table-hover'>
			<thead id='table_head'></thead>
			<tbody id='table_body'></tbody>
		</table>
	</div>

</body>
</html>