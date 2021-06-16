<%@page import="dto.abandonedDogDto"%>
<%@page import="dao.abandonedDogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%> --%>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

abandonedDogDao dao = abandonedDogDao.getInstance();
abandonedDogDto dto = dao.getReport(seq);
%>

<body>
<div id="leftScr">
<form action="abandog?param=updateAf" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
	<table class="table table-dark table-hover">
	<caption><h1>상세 글 보기</h1></caption>
<colgroup>
	<col style="width: 150">
	<col style="width: 600">
</colgroup>

<tr>
	<th>작성자</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="60" 
			value="<%=mem.getId() %>"> 		
	</td>	
</tr>
<tr>
	<th>연락처</th>
	<td>
		<input type="text" name="phonenum" size="60" value="<%=dto.getPhonenum() %>">		
	</td>
</tr>
<tr>
	<th>장소</th>
	<td>
		<input type="text" name="address" size="60" value="<%=dto.getAddress() %>">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="60" name="mycontent"><%=dto.getMycontent() %></textarea>		
	</td>
</tr>
<tr>
	<th>업로드파일</th>
	<td>
		<input type="text" name="oldfile" size="50" value="<%=dto.getFilename() %>">
		<input type="hidden" name="oldnewfile" size="50" value="<%=dto.getNewfilename() %>">
	</td>
</tr>
<tr>
	<th>변경할 파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="widows: 400px">
	</td>	
</tr>

</table>
<div class="utill4">
<input type="submit" class="btn btn-warning" value="완료">
</div>
<div class="utill4">
<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">취소</button>
</div>
</form>
</div>
</body>
</html>