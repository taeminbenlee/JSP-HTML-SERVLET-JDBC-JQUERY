<%@page import="Dto.afterStoryDto"%>
<%@page import="Dao.afterStoryDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());
%>

<%
afterStoryDao dao = afterStoryDao.getInstance();
afterStoryDto dto = dao.storyDetail(seq);
%>



<html>
<head>
<meta charset="UTF-8">
<title>afterStoryUpdate</title>
</head>
<body>

  
<div align="center">
<br><br><br><br><br>
<form  action="afterfile?param=afterUpdate" method = "post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<h2 style="color: #000">AFTER STORY UPDATE</h2>
<br><br><br>
<table border="1"  >
<col width="200"><col width="600">
<tr>
	<th style="text-align: center">아이디 </th>
	<td>
		<input type="text" name="id" size="90px" value="<%=mem.getMyid() %>" readonly="readonly">
	</td>
</tr>
	<th style="text-align: center"> 제목 </th>
	<td>
		<textarea name="title" rows="3" cols="90" ><%=dto.getTitle() %></textarea>
	</td>
</tr>
<tr >
	<th style="text-align: center"> 내용 </th>
	<td>
		<textarea  name="content" rows="20" cols="90" ><%=dto.getMycontent() %></textarea>
	</td>
</tr>
<tr>
		<th>PHOTO </th>
		<td>
			
			<img class="im" alt="" src="./upload/<%=dto.getFilename()%>">
		<td>		
	</tr>
<tr>
	<th style="text-align: center"> 파일 </th>
	<td>
		<input type="file" name="fileload" style="width: 400px" >
	</td>
</tr>
</table>
<br><br><br>
<div>
<button type="submit">글쓰기</button>	
</div>










</body>
</html>