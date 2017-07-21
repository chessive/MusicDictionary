<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	String result="";
	//String id = request.getParameter("id");
	String id = (String)session.getAttribute("id");
	
 	if(session.getAttribute("id")==null||id=="nosession")
		result="fail";
 	else result = "ok";
 %>



<%=result%>
    
    
   