<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<WriterVO> writers = new ArrayList<WriterVO>();	
	WriterVO writer = new WriterVO();	
	WriterDAO dao = new WriterDAO();
	String name = null; 

	writer.setWriter_name((request.getParameter("name")));	
	writers = dao.searchWriter(writer);
	

	String json = Converter.convertToJson(writers);
%><%=json %>
