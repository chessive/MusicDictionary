<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<ComposerVO> composers = new ArrayList<ComposerVO>();	
	ComposerDAO dao = new ComposerDAO();
	String name = null; 

	name =	request.getParameter("name");	
	composers = dao.searchComposer(name);
	

	String json = Converter.convertToJson(composers);
%><%=json %>
