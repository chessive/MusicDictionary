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
 		result = "ID �Ǵ� PWD�� �Է��ϼ���";
 	}
 %>

<%
 	if(check.equals("ID�� PWD�� ��ġ�մϴ�.")){
		result = "success";
		
	 } else{
		result ="fail";
	 }	 %>

<%=result%>