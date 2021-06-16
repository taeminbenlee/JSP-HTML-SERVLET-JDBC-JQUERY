<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Output page: Fetching the value from session</title>
</head>
<body>
<% 
String name=(String)session.getAttribute("sessname"); 
out.print("ID: "+name); 
String psw=(String)session.getAttribute("sesspsw"); 
out.print("PASSWORD: "+psw); 
//String hobby[]=session.getAttributeNames("sesshob");
//out.print("HOBBY: "+Arrays.deepToString(hobby)); 
String age=(String)session.getAttribute("sessage"); 
out.print("AGE: "+age); 
String memo=(String)session.getAttribute("sessmem"); 
out.print("MEMO: "+memo); 
%> 
</body>
</html>