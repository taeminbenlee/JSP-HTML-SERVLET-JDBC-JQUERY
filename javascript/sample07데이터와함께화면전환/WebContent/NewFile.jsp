
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewFile.jsp</title>
</head>
<body>

<h3>NewFile.jsp 입니다</h3>

<%
// script + applet = scriptlet
// java code 영역
// 내장객체 inner object 

//이름 받아오기
String name = request.getParameter("name");

//나이 받아오기
int age = Integer.parseInt(request.getParameter("age"));
//웹에 표기
out.println("이름: "+name+"<br>");
out.println("나이: "+age+"<br>");


%>

</body>
</html>