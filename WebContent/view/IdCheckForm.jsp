<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="login.Service"%>
<% boolean check = false;
	String result="";
	String id = request.getParameter("id");
	//out.println(id); 	
 	if(id!=null)
		check = new Service().duplicheck(id);
 	else result = "id�� �Է��ϼ���";
 %>

<%
 	if(check){
		result = "fail";
		
	 } else{
		result ="ok";
	 }	 %>

<%=result%>