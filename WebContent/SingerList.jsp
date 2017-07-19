<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<SingerVO> singers = new ArrayList<SingerVO>();	
	SingerDAO dao = new SingerDAO();
	String name = null; 

	name =	request.getParameter("name");	
	singers = dao.searchSinger(name);
	

	String json = Converter.convertToJson(singers);
%><%=json %>
