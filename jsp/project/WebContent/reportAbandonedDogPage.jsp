<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
#text1{}
</style>
</head>
<body>
<div id="text1" align="center">
<h1>유기견을 제보 합니다</h1>
<p>소중한 아이들의 보호에 참여해 주세요</p>
<img alt="" src="./image/reportdog.png">
</div>
<br>
<div align="center">
<button type="button" onclick="reportBtn()">유기견 제보</button>
<br>
<button type="button" onclick="checkMyReportBtn()">내 제보 확인</button>
</div>
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