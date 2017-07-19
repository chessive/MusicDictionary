<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<PublisherVO> publishers = new ArrayList<PublisherVO>();	
	PublisherDAO dao = new PublisherDAO();
	String name = null; 

	name =	request.getParameter("name");	
	publishers = dao.searchPublisher(name);
	

	String json = Converter.convertToJson(publishers);
%><%=json %>
