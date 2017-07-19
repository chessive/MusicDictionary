<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<RemakerVO> remakers = new ArrayList<RemakerVO>();	
	RemakerDAO dao = new RemakerDAO();
	String name = null; 

	name =	request.getParameter("name");	
	remakers = dao.searchRemaker(name);
	

	String json = Converter.convertToJson(remakers);
%><%=json %>
