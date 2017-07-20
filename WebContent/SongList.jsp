<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>

<%
	ArrayList<SongVO> songs = new ArrayList<SongVO>();	
	SongVO song = new SongVO();
	SongDAO dao = new SongDAO();
	String name = null; 
	name = request.getParameter("name");
	song.setName(name);	
	songs = dao.searchSong(song);
	

	String json = Converter.convertToJson(songs);
%><%=json %>
