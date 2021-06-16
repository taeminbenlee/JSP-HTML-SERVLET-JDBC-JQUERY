<%@page import="Dto.abandonedDogDto"%>
<%@page import="Dto.MemberDto"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Abandoned Dog Report List</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
.utill2{float: left;}
.utill3{float: left;}
.utill4{float: left;}
.location{color: aqua;}
#choice{width: 100px; height: 60px;}
#search{width: 800px; height: 60px;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null){
	choice = "";
}
if(search == null){
	search = "";
}
%>
<%
request.setCharacterEncoding("utf-8");
Object ologin = request.getSession().getAttribute("login");
MemberDto mem = null;

if(ologin == null){
	
	response.sendRedirect("login.jsp");
}
mem = (MemberDto)ologin;	
%>

<%
List<abandonedDogDto> list = (List<abandonedDogDto>)request.getAttribute("list");



int adPage = Integer.parseInt((String)request.getAttribute("adPage"));
System.out.println("adPage:" +adPage);

int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
System.out.println("pageNumber:" + pageNumber);

%>
<script type="text/javascript">
$(document).ready(function() {
	// 검색어 있는 경우
	let search = "<%=search %>";
	if(search == "") return;
	
	// select
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
});
</script>
<div id="text1" align="center">
	<table>
	<col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
    <thead>
      <tr>
        <th>번호</th>
        <th>작성자</th>
        <th>장소</th>
        <th>등급</th>
        <th>날짜</th>
      </tr>
    </thead>
	<tbody>
      <%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3">유기견 제보가 없습니다</td>
	</tr>
<%

} else{
for(int i = 0;i < list.size(); i++){
	abandonedDogDto dto = list.get(i);
	%>
			<tr align="center" height="5">
			<th><%=i+1 %></th>
			<td>
				<%if(dto.getDel() == 0){
					%>	
			
				<a class="location" href="abandog?param=openReportDetail&seq=<%=dto.getSeq() %>">
					<%=dto.getAddress() %>
				</a>
				<%
				}else{
				%>
				<font color="#ff0000">이글은 삭제되었습니다.</font>
				<%
				}
				%>
			</td>
			<td><%=dto.getMyid() %></td>
			<td><%=dto.getdanger() %></td>
			<td><%=dto.getWdate() %></td>
		</tr>
		<%
	}
}
%>

	</tbody>
</table>	

	<br><br>
<div align="center">
<!-- 페이징 	[1] 2 [3] -->
<%

for(int i = 0;i < adPage; i++){
	if(pageNumber == i){	// 현재 페이지		[1] 2 [3] 
		%>
		<span style="font-size: 15pt; color: aqua; font-weight: bold;">
			<%=i + 1 %><i class="fas fa-cloud"></i>
		</span>&nbsp;
		<%
	}
	else{
		%>		
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: blue; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]<i class="fas fa-bars"></i>
		</a>&nbsp;	
		<%
	}	
	
} 
%>
</div><br>
	<div class="util1" align="center">
		<button type="button" class="btn btn-warning" onclick="writeReport()"><p class="text-info">write</p></button><i class="fas fa-thumbs-up"></i></p></a><br>
	</div>
	<div class="utill2">
				<select id="choice" class="form-control" name="sellist1"> 
					<option value="id">아이디</option>
					<option value="addr">장소</option>
				</select>
	</div>
	<div class="utill3">
				<input type="text" id="search" class="form-control" value="">
	</div>	
	<div class="utill4">		
				<button type="button" class="btn btn-warning" onclick="searchBbs()"><p class="text-info">Search</p></button><br>
	</div>
	<br>
</div>
<script type="text/javascript">
function searchBbs() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;

	
	location.href = "abandog?param=getAbandonedDogPagingList&choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "abandog?param=getAbandonedDogPagingList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}

function writeReport() {
	
	location.href = "abandog?param=writeReport";
	
	
}

</script>
			
</body>
</html>