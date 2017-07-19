<%@page import="myungjun.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
int rating = Integer.parseInt(request.getParameter("rating"));
String review_comment = request.getParameter("review_comment");

ReviewVO review = new ReviewVO(rating, review_comment);
session.setAttribute("review", review);

ReviewService service = new ReviewService();
service.reviewInsert(review);

RequestDispatcher rd =  request.getRequestDispatcher("board.jsp");
rd.forward(request, response);
%>