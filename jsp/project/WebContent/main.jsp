<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String content = (String)request.getAttribute("content");
	if (content==null){
		content="testmain";
	
	}
%>
<body>
<h1>메인</h1>
<div>

		<jsp:include page="NewFile.jsp" flush="false"></jsp:include>
</div>
<div>
		<jsp:include page='<%=content + ".jsp" %>' flush="false"></jsp:include>
		<%-- <jsp:include page="abandonedDogList.jsp" flush="false"></jsp:include> --%>
</div>


</body>
</html>