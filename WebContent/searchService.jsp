<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>    
<%
String json = null;
String name = null; 	
String menu = null;
	menu = request.getParameter("menu");
	name =	request.getParameter("name");
	if(menu.equals("song")){
		ArrayList<SongVO> songs = new ArrayList<SongVO>();	
		SongDAO dao = new SongDAO();
		songs = dao.searchSong(name);
		json = Converter.convertToJson(songs);
		}
	else if(menu.equals("artist")){
		ArrayList<ArtistVO> artists = new ArrayList<ArtistVO>();	
		ArtistDAO dao = new ArtistDAO();
		artists = dao.searchArtist(name);
		json = Converter.convertToJson(artists);
		}
	else if(menu.equals("album")){
		ArrayList<AlbumVO> albums = new ArrayList<AlbumVO>();	
		AlbumDAO dao = new AlbumDAO();
		albums = dao.searchAlbum(name);
		json = Converter.convertToJson(albums);
		}		
	else if(menu.equals("composer")){
		ArrayList<ComposerVO> composers = new ArrayList<ComposerVO>();	
		ComposerDAO dao = new ComposerDAO();
		composers = dao.searchComposer(name);
		json = Converter.convertToJson(composers);
		}
	else if(menu.equals("writer")){
		ArrayList<WriterVO> writers = new ArrayList<WriterVO>();	
		WriterDAO dao = new WriterDAO();
		writers = dao.searchWriter(name);
		json = Converter.convertToJson(writers);
		}
	else if(menu.equals("remaker")){
		ArrayList<RemakerVO> remakers = new ArrayList<RemakerVO>();	
		RemakerDAO dao = new RemakerDAO();
		remakers = dao.searchRemaker(name);
		json = Converter.convertToJson(remakers);
		}
			%>
		<%=json  %>
	

