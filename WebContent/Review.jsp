<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review page</title>

</head>
<body>
<form action = "tempController.jsp" method = "post">
평점 : <select name="rating">
		<option value ="1">1점
		<option value ="2">2점
		<option value ="3">3점
		<option value ="4">4점
		<option value ="5">5점
		<option value ="6">6점
		<option value ="7">7점
		<option value ="8">8점
		<option value ="9">9점
		<option value ="10">10점
</select><br/>
댓글 : <br/>
<textarea rows="20" cols="40" name = "review_comment"></textarea>
<input type="submit" value="입력">
</form>
</body>
</html>