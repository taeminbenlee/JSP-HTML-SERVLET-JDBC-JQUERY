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
String name = request.getParameter("name"); //index1에서 name이란 변수를 주었기에 name으로 받아온다.
System.out.println("name: "+name);
String q1 = request.getParameter("q1"); //index1에서 name이란 변수를 주었기에 name으로 받아온다.
System.out.println("영어로 대화할 수 있습니까?: "+q1);
String lang = request.getParameter("lang"); //index1에서 name이란 변수를 주었기에 name으로 받아온다.
System.out.println("영어외에 관심있는 언어: "+lang);
String age = request.getParameter("age"); //index1에서 name이란 변수를 주었기에 name으로 받아온다.
System.out.println("연령: "+age);
%>
</body>
</html>