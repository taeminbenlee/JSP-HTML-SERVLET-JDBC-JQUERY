<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%-- 다음 JSP 페이지를 작성하십시오.
<%! %> 태그와 <% %> 태그에 변수를 선언하고 페이지가 처리 될 때마다 값을
1 씩 증가시킵니다.
그 값을 <% = %> 태그로 출력합니다. --%>


<%!
	int glNumber = 1;
%>

<%
	int number=1;
	glNumber++;
	number=number+1;
	
%>

glNumber:<%=glNumber%>
number:<%=number %>
<br>



<br>



</body>
</html>