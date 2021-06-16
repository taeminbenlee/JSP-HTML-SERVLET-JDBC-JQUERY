<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

request.setCharacterEncoding("UTF-8"); 

String name = request.getParameter("name"); 

String postnum = request.getParameter("postnum"); 
String postnum2 = request.getParameter("postnum2");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String delivery = request.getParameter("delivery");
String receipt = request.getParameter("receipt");
String everyday = request.getParameter("everyday");
String result = "이름: " + name + "<br>" + "우편번호" + postnum +"-"+ postnum2 + "<br>" + "주소" + address + "<br>" + "전화번호" + phone+"-"+phone2+
				"-"+phone3+"<br>" + "배달시간" + delivery + "<br>"+ "영수증요청" + receipt + "<br>" + "매거진 수신" + everyday;
out.print(result);


%>





</body>
</html>