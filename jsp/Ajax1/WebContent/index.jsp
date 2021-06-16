<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<%--
		AJAX : Asynchronous Javascript And Xml(json)
				비동기
							front		back
							Web			Java					DB
							json		list, map, string
 --%>
 
<p id="demo"></p>
<br>
<button type="button">클릭</button>

<script type="text/javascript">
$(function () {
	
	$("button").click(function () {
		
		// $("#demo").load("data.html");
		
		// $("#demo").load("data.html #data1");
		
		// $("#demo").load("data.jsp", "t1=abc&t2=123");
		
		// $("#demo").load("data.jsp", { t1:"ABC", t2:"가나다" });
		
		$("#demo").load(
			"data.jsp",
			{ t1:"BCD", t2:"나다라" },
			function (data, status, xhr) {
			//	alert("success");
			//	alert(data);
			}
		);
		
	});	
	
});
</script> 




</body>
</html>







