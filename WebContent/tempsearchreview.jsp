<%@page import="java.util.ArrayList"%>
<%@page import="myungjun.*"%>
<%@page import="service.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("utf-8");
ReviewService service = new ReviewService();
ReviewVO review = new ReviewVO();
//임시
review.setRating_id(324);
review.setRating(2);
review.setReview_comment("우와");

ArrayList<ReviewVO> reviews = new ArrayList<ReviewVO>();
reviews = service.reviewSearch(review);//검색서비스
session.setAttribute("reviews", reviews); //희건아 여기서 reviews를 받아서 처리해줘
RequestDispatcher rd =  request.getRequestDispatcher("board.jsp");
rd.forward(request, response);
%>