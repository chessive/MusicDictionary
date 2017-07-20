<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="login.Service"%>
<% String check = "";
	String result="";
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
 	if(id!=null && pwd!=null){
		check = new Service().duplicheck2(id,pwd);}
 	
 	else{ 
 		result = "ID 또는 PWD를 입력하세요";
 	}
 %>

<%
 	if(check.equals("ID와 PWD가 일치합니다.")){
		result = "success";
		
	 } else{
		result ="fail";
	 }	 %>

<%=result%>