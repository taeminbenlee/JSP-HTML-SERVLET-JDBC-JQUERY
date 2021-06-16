<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

forward(전진), include
<br><br>
<%-- <%
	MemberDto dto = new MemberDto();
dto.setMessage("hello");
String msg = dto.getMessage();

request.setAttribute("mem", dto);
%> --%>

<%-- ${ mem.message } --%>

<!-- 위와 동일한 방법 -->
<!-- 객체생성하는 jsp태그 -->
<jsp:useBean id="dto" class="dto.MemberDto"></jsp:useBean>
<!-- setter -->
<jsp:setProperty property="message" name="dto" value="안녕하셧싸와요"/>
<!-- getter -->
<jsp:getProperty property="message" name="dto"/>

















</body>
</html>