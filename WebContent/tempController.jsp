<%@page import="java.util.ArrayList"%>
<%@page import="myungjun.*"%>
<%@page import="service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");
//rating과 comment불러오기
int rating =0;
rating= Integer.parseInt(request.getParameter("star-input"));
String review_comment = request.getParameter("review_comment");
//int rating_id = (int)(session.getValue("rating_id")); //희건아 rating_id 불러오는거에 따라 session으로 할지 request.getParameter로 할지 정해줘
int rating_id =1;
ReviewVO review = new ReviewVO();
review.setRating(rating);
review.setReview_comment(review_comment);
//rating_id불러오기
review.setRating_id(rating_id);
//서비스객체생성
ReviewService service = new ReviewService();
service.reviewInsert(review);//삽입서비스

RequestDispatcher rd =  request.getRequestDispatcher("Review.jsp");
rd.forward(request, response);

%>