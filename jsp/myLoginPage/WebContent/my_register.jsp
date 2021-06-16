<%@page import="dto.MyDto"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>    
    

<!-- DB에 데이터를 추가 -->
<%
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
 

System.out.println(name + " " + pwd + " " + email);


%>


<!-- 이동 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regiAf.jsp</title>
</head>
<body>

<%
MyDao dao = MyDao.getInstance();

MyDto dto = new MyDto(name, pwd, email);
boolean isS = dao.addMember(dto);
if(isS){
	%>
	<script type="text/javascript">
	alert("성공적으로 가입되었습니다");
	location.href = "mylogin.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("다시 기입해 주십시오");
	location.href = "myRegi.jsp";
	</script>
	<%
}
%>




</body>
</html>



