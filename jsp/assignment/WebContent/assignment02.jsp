<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 4px #DDD;
            border-collapse: collapse;
            padding: 6px 9px;
            text-align: center;
        }
        th {
            font-weight:bold;
        }
    </style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<h1>JSP 실습</h1>

<%!
// 선언부(전역변수, class, function)
int fnum = 0; 
int snum = 0;
%>

<table>
<% // 코드부
fnum++;
snum++;
for(int i = 0 ; i < fnum; i++){
%>
<tr>
<%
   for(int j = 0; j < snum ; j++){
%>
      <td><%=i%>*<%=j%>=<%=i * j%></td>
<%
   }
%>
</tr>
<%
}
%>
</table>

</body>
</html>