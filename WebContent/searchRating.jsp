<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="myungjun.*"%>
<%@ page import="service.*"%>
<%
	String json = null;

	String rating_id = null;
	rating_id = request.getParameter("rating_id");
	
	ArrayList<RatingVO> ratings = new ArrayList<RatingVO>();
	RatingDAO dao = new RatingDAO();

	ratings = dao.searchRating(Integer.parseInt(rating_id));

	json = Converter.convertToJson(ratings);
%>
<%=json%>


