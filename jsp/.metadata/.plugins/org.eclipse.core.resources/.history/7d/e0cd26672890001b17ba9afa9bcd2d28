<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 30px;}
</style>
</head>
<body>
<div id="text1" align="center">
<h1>유기견을 제보 합니다</h1>
<p>소중한 아이들의 보호에 참여해 주세요</p>
<img alt="" src="./image/reportdog.png">
<div align="center">
<button type="button" class="btn btn-warning" onclick="reportBtn()">유기견 제보</button>
<br>
<button type="button" class="btn btn-warning" onclick="checkMyReportBtn()">제보 확인</button>
</div>
</div>
<br>

<script type="text/javascript">
function reportBtn(){
	location.href = "abandog?param=writeReport";
}
function checkMyReportBtn(){
	location.href = "abandog?param=getAbandonedDogPagingList";
}
</script>
</body>
</html>