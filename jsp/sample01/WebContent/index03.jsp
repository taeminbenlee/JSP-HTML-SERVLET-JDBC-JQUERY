<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    YouClass cls = new YouClass("서태웅");
    //pack it up
	//request.setAttribute("you", cls);
    /////////////////////////////////////////
    
    
    /* Http session */
    session.setAttribute("you", cls);
   // request.getSession().setAttribute("you", cls);
    
    
    //go with it 
    //pageContext.forward("index4.jsp");
    ///////////////////////////////////////
    
    
	//request.getRequestDispatcher("index4.jsp").forward(request, response);
	response.sendRedirect("index4.jsp");
	
	
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>









</body>
</html>