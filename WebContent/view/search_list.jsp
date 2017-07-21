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


<!-- Session check -->
<script type="text/javascript">
$(document).ready(function(){
	var memu_template="";

	console.log("ajax시작");
		$.ajax({
			
			url : "connectionCheck.jsp",
			type : "GET",
			success : function(data) {
				
//				var s = data.trim();
				var data = data.trim();
				var s= data.split(',');
				
				if(s[0]=="fail"){
					memu_template = "<li id = 'li8' class = 'active'><a href='LoginView.html'>로그인</a></li><li id = 'li9'><a href='memberJoinForm.jsp'>회원가입</a></li>";
					$("#login").empty();
					$("#login").append(memu_template);
					
				}else if(s[0]=="ok"){
					memu_template = "<li id = 'li10' class = 'active'><a href='Logout.jsp'>로그아웃</a></li><li id = 'li11'><a href='memberDelete.jsp'>회원탈퇴</a></li><li id = 'li12'><a href='memberUpdate.jsp'>회원정보수정</a>";
					
					$("#login").empty();
					$("#login").append(memu_template);
					$("#id-status").text(s[1] + "님 환영합니다!");
					console.log("s[1] : " + s[1]);
				}
		}
	});
})
</script>


<!--  외장 함수들 유용한것들로만 -->
<script type="text/javascript">

	// Sorting 방법론
	function artist_idSort(a, b) {
	  if(a.artist_id == b.artist_id){ return 0} return  a.artist_id > b.artist_id ? 1 : -1;
	}
	function nameSort(a, b) {
	  if(a.name == b.name){ return 0} return  a.name > b.name ? 1 : -1;
	}
	function album_nameSort(a, b) {
		  if(a.album_name == b.album_name){ return 0} return  a.album_name > b.album_name ? 1 : -1;
	}
	function composer_nameSort(a, b) {
		  if(a.composer_name == b.composer_name){ return 0} return  a.composer_name > b.composer_name ? 1 : -1;
	}
	function writer_nameSort(a, b) {
		  if(a.writer_name == b.writer_name){ return 0} return  a.writer_name > b.writer_name ? 1 : -1;
	}
	function remaker_nameSort(a, b) {
		  if(a.remaker_name == b.remaker_name){ return 0} return  a.remaker_name > b.remaker_name ? 1 : -1;
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
		
		var s, str="", result_url = "";
		
		var param = {};
		param.name = name;
		param.menu = menu;
		var rating;
		
		console.log(menu);
		console.log(name);

		var menu_template_head = "";
		var menu_template = "";

		if (menu == "artist") {
			menu_template_head = "<tr><th>#</th><th>이름</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.sort(artist_idSort);
					
			   		data.forEach(function(item, index) {
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=artist&name=" + item.artist_name;
 			   			s = s.replace("_site", result_url);
 			   			s = s.replace("_index", item.artist_id);
			   			s = s.replace("_name", item.artist_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
				}
			});
		}
		
		else if (menu == "album") {
			menu_template_head = "<tr><th>#</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					data = JSON.parse(data);
					data.sort(album_nameSort);
					
			   		data.forEach(function(item, index) {
			   			
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=album&name=" + item.album_name;
 			   			s = s.replace("_site", result_url);
 			   			s = s.replace("_index", item.album_id);
			   			s = s.replace("_name", item.album_name);
			   			s = s.replace("_artist", item.artist_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
				}
			});
		}		

		else if (menu == "song") {
			menu_template_head = "<tr><th>#</th><th>노래명</th><th>앨범명</th><th>아티스트명</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_index</td><td>_name</td><td>_album</td><td>_artist</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					console.log(data);
					data = JSON.parse(data);
					data.sort(nameSort);
					
			   		data.forEach(function(item, index) {
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=song&index=" + item.song_index;
 			   			s = s.replace("_site", result_url);
 			   			s = s.replace("_index", item.song_index);
			   			s = s.replace("_name", item.name);
			   			s = s.replace("_album", item.album_name);
			   			s = s.replace("undefined", "");
			   			s = s.replace("_artist", item.artist_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
				}
			});
		}		

		else if (menu == "composer") {
			menu_template_head = "<tr><th>이름</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_name</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					console.log(data);
					data = JSON.parse(data);
					data.sort(composer_nameSort);
					
			   		data.forEach(function(item, index) {
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=composer&index=" + item.composer_id;
 			   			s = s.replace("_site", result_url);
			   			s = s.replace("_name", item.composer_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
					console.log(str);
				}
			});
		}
		else if (menu == "writer") {
			menu_template_head = "<tr><th>이름</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_name</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					console.log(data);
					data = JSON.parse(data);
					data.sort(writer_nameSort);
					
			   		data.forEach(function(item, index) {
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=writer&index=" + item.writer_id;
 			   			s = s.replace("_site", result_url);
			   			s = s.replace("_name", item.writer_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
					console.log(str);
				}
			});
		}
		else if (menu == "remaker") {
			menu_template_head = "<tr><th>이름</th><th>평점</th><th>조회수</th></tr>";
			menu_template = "<tr data-href='_site'><td>_name</td><td>_rating</td><td>_count</td></tr>";
	   		$("#table_head").empty();
	   		$("#table_head").append(menu_template_head);
				
			$.ajax({
				url : "/gitProject_md/searchService.jsp",
				type : "GET",
				data : 	param,
				success : function(data) {
					console.log(data);
					data = JSON.parse(data);
					data.sort(remaker_nameSort);
					
			   		data.forEach(function(item, index) {
			   			s = menu_template;
			   			result_url = "result_page.jsp?menu=remaker&index=" + item.remaker_id;
 			   			s = s.replace("_site", result_url);
			   			s = s.replace("_name", item.remaker_name);
			   			s = s.replace("_rating", item.rating_id);
			   			s = s.replace("_count", item.count);
			   			str += s;
			   		});			
			   		$("#table_body").empty;					
			   		$("#table_body").append(str);
					console.log(str);
				}
			});
		} // table searching END
		
	});
	
/* 
 */
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
			<li id = "li1"><a href="index.html">홈</a></li>
			<li id = "li2"><a href="search_list.jsp?menu=artist">가수</a></li>
			<li id = "li3"><a href="search_list.jsp?menu=song">노래</a></li>
			<li id = "li4"><a href="search_list.jsp?menu=album">앨범</a></li>
			<li id = "li5"><a href="search_list.jsp?menu=composer">작곡가</a></li>
			<li id = "li6"><a href="search_list.jsp?menu=writer">작사가</a></li>
			<li id = "li7"><a href="search_list.jsp?menu=remaker">편곡가</a></li>
		</ul>
		<div class = "nav  navbar-brand navbar-right"  id = "id-status">
		</div>

			<!--  login -->
		    <ul class="nav navbar-nav navbar-right"  id="login">
    		</ul>
			<!--  login -->
			
	</div>
	</nav>

	<div class="container  table-responsive">
		<table id="table_menu" class="table  table-hover">
			<thead id="table_head">
			</thead>
			<tbody id="table_body">
			</tbody>
		</table>
	</div>
</body>
</html>