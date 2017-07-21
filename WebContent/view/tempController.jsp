<%@page import="javax.websocket.SendResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myungjun.*"%>
<%@page import="service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script type="text/javascript">
$(document).ready(function() {

	var rating_id = getUrlParameter('rating_id');
	console.log(rating_id);
	
}); // ready 끝


</script>

<%

request.setCharacterEncoding("utf-8");
//rating과 comment불러오기
int rating =0;
rating= Integer.parseInt(request.getParameter("star-input"));
String review_comment = request.getParameter("review_comment");
String rating_id = request.getParameter("rating_id");
String url = request.getParameter("url");

System.out.println("rating ID : " + rating_id);
System.out.println("url : " + url);

ReviewVO review = new ReviewVO();
review.setRating(rating);
review.setReview_comment(review_comment);
//rating_id불러오기
review.setRating_id(Integer.parseInt(rating_id));
//서비스객체생성
ReviewService service = new ReviewService();
service.reviewInsert(review);//삽입서비스


response.sendRedirect(request.getParameter("url"));

%>