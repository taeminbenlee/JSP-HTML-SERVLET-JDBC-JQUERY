<%@page import="Dto.MemberDto"%>
<%@page import="Dto.abandonedDogDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ServletConfig mConfig = null;
	final int BUFFER_SIZE = 8192;
	
	
		mConfig = config;	
	
	String fupload = mConfig.getServletContext().getRealPath("/upload");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}


</style>
</head>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>
<%
abandonedDogDto dto  = (abandonedDogDto)request.getAttribute("detail");
int seq = dto.getSeq();

%>
<body>

<div class="container" id="text1">
	<table>
	
	
	


<tr>
	<th>작성자</th>
	<td><%=dto.getMyid() %></td>
</tr>

<tr>
	<th>발견장소</th>
	<td><%=dto.getAddress() %></td>
</tr>

<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>

<tr>
	<th>위험등급</th>
	<td><%=dto.getdanger() %></td>
</tr>
<tr>
	<th>연락처</th>
	<td><%=dto.getPhonenum() %></td>
</tr>
<tr>
	<th>첨부파일</th>
	<td><%=dto.getFilename() %></td>
</tr>
<tr>
	<th>이미지</th>
	<td>
		<img class="uploadImage" alt="" src="./upload/<%=dto.getNewfilename()%>" style="max-width: 600px; max-height: 600px;">
		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td align="center">
	<textarea rows="10" cols="90" readonly="readonly"><%=dto.getMycontent()%></textarea>
	</td>
</tr>
</table>
<% 
if(dto.getMyid().equals(mem.getMyid())){
%>
<div class="utill4">

<button type="button" class="btn btn-warning" onclick="updateBtn(<%=dto.getSeq() %>)">수정</button>
<button type="button" class="btn btn-warning" onclick="deleteBtn(<%=dto.getSeq() %>)">삭제</button>
</div>
<%
}
%>

<br>
<% 
if(mem.getMyid().equals("admin")){
%>
<div class="utill4">
<button type="button" class="btn btn-warning" onclick="authorityBtn(<%=dto.getSeq() %>)">관리자용버튼</button>

</div>
<%
}
%>

<br>
<div class="utill4">
<button type="button" class="btn btn-warning" OnClick="javascript:history.back(-1)">목록</button>
</div>
</div>

<script type="text/javascript">
function updateBtn( seq ) {
	location.href = "abandog?param=updateReport&seq=" + seq;
}

function authorityBtn( seq ) {
	location.href = "선양컨트롤러?param=####&seq=" + seq;
}
function deleteBtn(seq){
	location.href = "abandog?param=deleteReport&seq=" + seq;
}
</script>


</body>



</html>