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
int sum =0;
double average =0;
	for(int i =0; i< reviews.size(); i++){
		sum += reviews.get(i).getRating();
		
	}
	average = sum/reviews.size();
String json = Converter.convertToJson(reviews);
%><%=json %><br>
평점 : <%=average %> <!-- 얘가 평균이야  -->
</body>
</html>