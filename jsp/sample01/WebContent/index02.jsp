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

	//내장 객체 : 동적 할당하지 않고 사용할 수 있는 객체
	// request(요청) - JSP
	// HttpServletRequest - Servlet
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");

String age = request.getParameter("age");

String hobby[] = request.getParameterValues("hobby"); //checkbox나 select 복수선택
%>
<h3>yourName:<%=name %></h3>
<h3>yourAge:<%=age %></h3>
<%
for(int i = 0; i< hobby.length; i++){
	 %>
	 <h3>yourHobby:<%=hobby[i] %></h3>
	 <%
}

%>
</body>
</html>