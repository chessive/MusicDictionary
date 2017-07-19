<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<WriterVO> writers = new ArrayList<WriterVO>();	
	WriterDAO dao = new WriterDAO();
	String name = null; 

	name =	request.getParameter("name");	
	writers = dao.searchWriter(name);
	

	String json = Converter.convertToJson(writers);
%><%=json %>
