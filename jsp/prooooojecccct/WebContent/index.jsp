<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
      String content = request.getParameter("content");
      if(request.getParameter("content")==null) {
            content = (String)request.getAttribute("content");   
            if((String)request.getAttribute("content") == null){
               content = request.getParameter("content");
               if(content == null){
                   content = "main";
                   
                } 
            }
      }      
%>

<!DOCTYPE html>
<html>
<head>
<meta name ="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>견생역전</title>

</head>

<body>
<table style="width: 100%">
<tr>
	<td>
		 <jsp:include page="menu.jsp" flush="false"/>
	</td>
</tr>

<tr>
	<td class="body">
		<jsp:include page='<%=content + ".jsp" %>' flush="false"/> 
	</td>
</tr>

<tr>
	<td class="footer">
		<jsp:include page="bottom.jsp" flush="false"/>
	</td>
</tr>
</table>

</body>
</html>