<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%
	//자바의 영역

	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 전자정부 프레임워크 -> Spring Framework (jsp)

jsp -> Spring boot(back end) <-> Vue, react, JQuery(front end) -->

<!-- HTML 주석문 -->

<%-- JSP 주석문 --%>

<%--

						JSP java server page
		
							server(web)를 통해서 client form 을 생성하는 코드 
	
			Servlet = java(html)
			JSP 	= html(java)
			
			내장객체 = new를 하지않고 바로 사용 가능한 객체
 --%>

<h1>hello jsp</h1>

<%


	System.out.println("console  출력");
%>
<%
	String str = "Hello JSP";

%>
<!-- 값출력 방법 -->
<!-- 1번 -->
<p>str:<%=str %><p>

<!-- 2번 -->
<input type="text" size="20" value="<%=str %>">
<br>
<!-- 자바의 모든값을 웹에 출력 가능하다 -->
<!-- 내장객체 1. : out -->
<%
//out: web에 출력하는 object
out.println("<h3>첫번째 내장객체 out</h3>");

%>
<!-- 3번 자바와 html섞어서  -->
<%
for(int i = 0; i<5; i++){
%>
	<p>hello p tag<%=i %></p>
<%
}
%>

<p id="demo">p id demo</p>

<script type="text/javascript">
document.getElementById("demo").innerHTML = "p 태그 내용";


</script>




</body>
</html>