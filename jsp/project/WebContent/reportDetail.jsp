<%@page import="dto.abandonedDogDto"%>
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
abandonedDogDto dto  = (abandonedDogDto)request.getAttribute("detail");
int seq = dto.getSeq();

%>
<body>
<div id="leftScr">
	<table class="table table-dark table-hover">
	<caption><h1>상세 글 보기</h1></caption>
<colgroup>
	<col style="width: 150">
	<col style="width: 600">
</colgroup>

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
	<td><%=dto.getDan() %></td>
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
	<th>내용</th>
	<td align="center">
	<textarea rows="10" cols="90" readonly="readonly"><%=dto.getmycontent() %></textarea>
	</td>
</tr>
</table>
<% 
if(dto.getMyid().equals(mem.getId())){
%>
<div class="utill4">

<button type="button" class="btn btn-warning" onclick="updateBtn(<%=dto.getSeq() %>)">수정</button>

</div>
<%
}
%>

<br>
<% 
if(dto.getMyid().equals("#")){
%>
<div class="utill4">
<button type="button" class="btn btn-warning" onclick="authorityBtn(<%=dto.getSeq() %>)">관리자보호이동</button>

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
	location.href = "abandog?param=####&seq=" + seq;
}
</script>


</body>



</html>