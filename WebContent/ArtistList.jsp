<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<ArtistVO> artists = new ArrayList<ArtistVO>();	
	ArtistDAO dao = new ArtistDAO();
	String name = null; 

	name =	request.getParameter("name");	
	artists = dao.searchArtist(name);
	

	String json = Converter.convertToJson(artists);
%><%=json %>
