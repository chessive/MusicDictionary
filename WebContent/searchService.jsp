<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="myungjun.*" %>
<%@ page import="service.*" %>    
<%

String json = null;
String name = null; 	
String menu = null;
String sub_menu1 = null;
String sub_menu_value1 = null;
String sub_menu2 = null;
String sub_menu_value2 = null;
String sub_menu3 = null;
String sub_menu_value3 = null; 
	name = request.getParameter("name");
	menu = request.getParameter("menu");
	sub_menu1 =request.getParameter("sub_menu1");
	sub_menu_value1 =request.getParameter("sub_menu_value1");
	sub_menu2 =request.getParameter("sub_menu2");
	sub_menu_value2 =request.getParameter("sub_menu_value2");
	sub_menu3 =request.getParameter("sub_menu3");
	sub_menu_value3 =request.getParameter("sub_menu_value3");
		 if(name==null){
			name="";
		} 
	if(menu.equals("song")){
		ArrayList<SongVO> songs = new ArrayList<SongVO>();
		SongVO song = new SongVO();
		SongDAO dao = new SongDAO();
		song.setName(name);	
		songs = dao.searchSong(song);
		json = Converter.convertToJson(songs);
		}
	else if(menu.equals("artist")){
		ArrayList<ArtistVO> artists = new ArrayList<ArtistVO>();	
		ArtistVO artist = new ArtistVO();
		ArtistDAO dao = new ArtistDAO();
		artist.setArtist_name(name);	
		artists = dao.searchArtist(artist);
		json = Converter.convertToJson(artists);
		}
	else if(menu.equals("album")){
		ArrayList<AlbumVO> albums = new ArrayList<AlbumVO>();	
		AlbumVO album = new AlbumVO();
		AlbumDAO dao = new AlbumDAO();
		album.setAlbum_name(name);	
		albums = dao.searchAlbum(album);
		json = Converter.convertToJson(albums);
		}		
	else if(menu.equals("composer")){
		ArrayList<ComposerVO> composers = new ArrayList<ComposerVO>();	
		ComposerVO composer = new ComposerVO();
		ComposerDAO dao = new ComposerDAO();
		composer.setComposer_name(name);	
		composers = dao.searchComposer(composer);
		json = Converter.convertToJson(composers);
		}
	else if(menu.equals("writer")){
		ArrayList<WriterVO> writers = new ArrayList<WriterVO>();	
		WriterVO writer = new WriterVO();
		WriterDAO dao = new WriterDAO();
		writer.setWriter_name(name);	
		writers = dao.searchWriter(writer);
		json = Converter.convertToJson(writers);
		}
	else if(menu.equals("remaker")){
		ArrayList<RemakerVO> remakers = new ArrayList<RemakerVO>();	
		RemakerVO remaker = new RemakerVO();
		RemakerDAO dao = new RemakerDAO();
		remaker.setRemaker_name(name);	
		remakers = dao.searchRemaker(remaker);
		json = Converter.convertToJson(remakers);
		}
	
	%>
<%=json  %>
	

