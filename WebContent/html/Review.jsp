<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review page</title>

<script src="../js/rating.js"></script>
<link href="../css/rating.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!--  외장 함수들 유용한것들로만 -->
<script type="text/javascript">


	// Parameter 갖고오는 놈임. get 사용 가능.
	var getUrlParameter = function getUrlParameter(sParam) {
		var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL
				.split('&'), sParameterName, i;

		for (i = 0; i < sURLVariables.length; i++) {
			sParameterName = sURLVariables[i].split('=');

			if (sParameterName[0] === sParam) {
				return sParameterName[1] === undefined ? true
						: sParameterName[1];
			}
		}
	};
	
</script>

<script type="text/javascript">

window.onload = function() {
    var list =  document.getElementsByTagName("input");
    list[10].onclick = function() {
            alert("입력되었습니다!");   
        }    
}
</script>

</head>
<body>
<form action = "tempController.jsp" method = "post">

<div class = "row">
<div class ="col-*-*">
<span class="star-input">
  <span class="input">
    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
    <input type="radio" name="star-input"  id="p3" value="3"><label for="p3">3</label>
    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
  </span>
    <input type="hidden" name="rating_id"  id="rating_id" value = '<%=request.getParameter("rating_id")%>'>
    <input type="hidden" name="url"  id="url" value = '<%=request.getParameter("url")%>'>
  <output for="star-input"><b></b></output>
</span><br/>
<br><br>
<textarea class = "input-lg  form-control"  name = "review_comment"></textarea>
</div>
</div>
<div class = "row">
<br><br>
<input type="submit" class = "btn btn-primary btn-md" value="입력">
</div>
</form>
</body>
</html>