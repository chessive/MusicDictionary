<%@page import="myungjun.*"%>
<%@page import="service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
//rating과 comment불러오기
int rating = Integer.parseInt(request.getParameter("rating"));
String review_comment = request.getParameter("review_comment");
ReviewVO review = new ReviewVO(rating, review_comment);

//rating_id불러오기
//review.setRating((int)(session.getValue("rating_id")));

//불러온 rating과 comment를 session에 입력
session.setAttribute("review", review);

//서비스객체생성
ReviewService service = new ReviewService();


service.reviewInsert(review);//삽입서비스

//service.reviewSearch(rating_id);//검색서비스

RequestDispatcher rd =  request.getRequestDispatcher("board.jsp");
rd.forward(request, response);
%>