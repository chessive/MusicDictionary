<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<ComposerVO> composers = new ArrayList<ComposerVO>();	
	ComposerDAO dao = new ComposerDAO();
	String aa = null; 

	aa =	request.getParameter("something");	
	composers = dao.searchComposer(aa);
	

	String json = Converter.convertToJson(composers);
%><%=json %>
