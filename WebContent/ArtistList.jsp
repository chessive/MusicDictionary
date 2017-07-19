<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="person.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<ArtistVO> artists = new ArrayList<ArtistVO>();	
	ArtistDAO dao = new ArtistDAO();
	String aa = null; 

	aa =	request.getParameter("something");	
	artists = dao.searchArtist(aa);
	

	String json = Converter.convertToJson(artists);
%><%=json %>
