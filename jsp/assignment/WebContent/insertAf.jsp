<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//내장 객체 : 동적 할당하지 않고 사용할 수 있는 객체
	// request(요청) - JSP
	// HttpServletRequest - Servlet
request.setCharacterEncoding("utf-8");
String name = request.getParameter("username");
session.setAttribute("sessname",name); 

String psw = request.getParameter("psw");
session.setAttribute("sesspsw",psw); 

String hobby[] = request.getParameterValues("hobby");
//session.setAttributeNames("sesshob",hobby); 
String age = request.getParameter("age");
session.setAttribute("sessage",age); 
String memo = request.getParameter("memo");
session.setAttribute("sessmem", memo);



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>UserName:<%=name %></h3>
<h3>Password:<%=psw %></h3>
<h3>yourAge:<%=age %></h3>
<%
for(int i = 0; i< hobby.length; i++){
	 %>
	 <h3>yourHobby:<%=hobby[i] %></h3>
	 <%
}

%>
<h3>Memo:<%=memo %></h3>
<br>
<a href="output.jsp">Check Output Page Here </a>		

</body>
</html>