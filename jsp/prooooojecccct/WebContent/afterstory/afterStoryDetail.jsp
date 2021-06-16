<%@page import="Dao.afterStoryDao"%>
<%@page import="Dto.abandonedDogDto"%>
<%@page import="Dto.afterStoryDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
String userId = "";
int managerNum = 0;
if(mem != null){
	userId = mem.getMyid();
	managerNum = mem.getMymanager();
}

%>

<%
afterStoryDto dto  = (afterStoryDto)request.getAttribute("detailAf");
int seq = dto.getSeq();
%>


<html>
<head>
<style type="text/css">

.vnum{
	float: right;
}

.im{
	width: 700ppx;
	height: 900px;
}
.con{
	font-size: 30px

}

</style>
<meta charset="UTF-8">
<title>afterStoryDetail</title>
</head>
<body>



<div align="center" style="padding-top: 100px">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<h2>AFTER STORY DETAIL</h2>
<br><br>
<table border="1" >
<col width="200"><col width="200">

	<tr>
		<th height="50px">NAME </th>
		<td>
			<%=dto.getMyid() %>
		<td>		
	</tr>
	<tr>
		<th height="50px">TITLE </th>
		<td>
			<%=dto.getTitle() %>
		<td>		
	</tr>
	<tr>
		<th height="100px">CONTENT </th>
		<td>
			<%=dto.getMycontent() %>
		<td>		
	</tr>
	<tr>
		<th>PHOTO </th>
		<td>
			
			<img class="im" alt="" src="./upload/<%=dto.getFilename()%>" style="max-width: 600px; max-height: 600px;">
		<td>		
	</tr>
	<tr>
		<th height="50px">DATE </th>
		<td>
			<%=dto.getWdate() %>
		<td>		
	</tr>

</table>
</div>

<br><br><br><br>
<div align="center" style="padding-bottom: 100px">
<%
if(dto.getMyid().equals(userId) || managerNum == 1){
	%>	
	<button type="button" onclick="deleteAf(<%=dto.getSeq() %>)">삭제하기 </button>
	&nbsp; | &nbsp;
	<button type="button" onclick="updateAf(<%=dto.getSeq() %>)">수정하기  </button>
	&nbsp; | &nbsp;
	<%
	}
%>
	<button type="button" onclick="goList(<%=dto.getSeq() %>)">목록으로 </button>
</div>



<script type="text/javascript">
function updateAf(seq) {
	location.href = "after?param=updateStory&seq=" + seq;
}
function deleteAf(seq) {
	location.href = "after?param=afterDelete&seq=" + seq;
}
function goList(seq) {
	location.href = "after?param=afterstoryList&seq=" + seq;
}



</script>







</body>







</html>