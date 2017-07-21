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

<%
	String rating_id = request.getParameter("rating_id");
%>
	
<script type="text/javascript">	
$(document).ready(function() {
	var rating_id = '<%=rating_id%>';
	var result;		
	var s, str="";
	var param = {};

	param.rating_id = rating_id;
	menu_template_head = "<tr><th>평점</th><th>댓글</th></tr>";
	menu_template = "<tr><td  class = 'col-md-1'>_rating</td><td  class = 'col-md-6'>_review_comment</td></tr>";
		$("#table_head").empty();
		$("#table_head").append(menu_template_head);

		$.ajax({
		url : "/gitProject_md/tempsearchreview.jsp",
		type : "GET",
		data : 	param,
		success : function(data){
			data = JSON.parse(data);
			data.forEach(function(item, ind) {
				if(item.rating_id == rating_id){
					result = item;
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
<div class="container">
		<table id="table_menu" class="table  table-hover  col-md-6">
			<thead id="table_head" >
			</thead>
			<tbody id="table_body">
			</tbody>
		</table>
	</div>
</body>
</html>