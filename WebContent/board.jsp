<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="myungjun.*"%>
<%@page import="service.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<% //희건아 이거는 평점평균 내봤어 잘 참조해서 써보렴
ArrayList<ReviewVO> reviews = new ArrayList<ReviewVO>();
	reviews = (ArrayList<ReviewVO>)session.getAttribute("reviews");
String json = Converter.convertToJson(reviews);
%>
console.log(reviews);
<%=json%>
</body>
</html>