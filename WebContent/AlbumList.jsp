<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<AlbumVO> albums = new ArrayList<AlbumVO>();	
	AlbumDAO dao = new AlbumDAO();
	String name = null; 

	name =	request.getParameter("name");	
	albums = dao.searchAlbum(name);
	

	String json = Converter.convertToJson(albums);
%><%=json %>
