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
</script>	
	
<script type="text/javascript">	
$(document).ready(function() {

	var rating_id = getUrlParameter('rating_id');
	var result;		
	var s, str="";
	var param = {};
	param.rating_id = rating_id;
	console.log(rating_id);
	menu_template_head = "<tr><<th>평점</th><th>댓글</th></tr>";
	menu_template = "<tr ><td>_rating</td><td>_review_comment</td></tr>";
		$("#table_head").empty();
		$("#table_head").append(menu_template_head);
	$.ajax({
		url : "/gitProject_md/tempsearchreview.jsp",
		type : "GET",
		data : 	param,
		success : function(data){
			console.log(data);
			data = JSON.parse(data);
			data.forEach(function(item, ind) {
				if(item.rating_id == rating_id){
					result = item;
					console.log(item);
					console.log(result);
	   		
				}
			});
			data.forEach(function(item, index) {
		   		s = menu_template;
		   		result_url = "review_board.jsp?rating_id=" + item.rating_id;
			   	s = s.replace("_site", result_url);
		   		s = s.replace("_rating", item.rating);
		   		s = s.replace("_review_comment", item.review_comment);
		   		str += s;
		   		});			
		   		$("#table_body").empty;					
		   		$("#table_body").append(str);
				console.log(str);
			
		}
	});
});
	
</script>
</head>
<body>
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