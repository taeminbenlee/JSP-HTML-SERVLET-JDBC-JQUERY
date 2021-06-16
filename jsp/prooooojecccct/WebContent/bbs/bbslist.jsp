<%@page import="Dto.MemberDto"%>
<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
int pageNumber =Integer.parseInt((String)request.getAttribute("pageNumber"));
int len = Integer.parseInt((String)request.getAttribute("len"));
int bbspage = Integer.parseInt((String)request.getAttribute("bbspage"));
List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");

System.out.println("choice : "+choice);
System.out.println("search : "+search);
System.out.println("pageNumber : "+ pageNumber);
System.out.println("len : "+ len);
System.out.println("bbspage : "+ bbspage);
System.out.println("list : "+ list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<!--bootstarp-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<br>
<div class="container">
<h1 style="text-align: center;">우리 멍냥이는요</h1>
<div align="center">
<table border="1" class='table' style="text-align: center; align-items: center;">
<thead>
<tr>	
	<th>번호</th><td>이미지</td><th>제목</th><td>작성자</td><td>작성시간</td><td>조회수</td>
</tr>
</thead>
<tbody>
<%
if(list.size() == 0){
	%>
	<tr>
		<td colspan="7">작성 내용이 없습니다</td>
	</tr>
	<%
}
	
		for(int i = 0; i< list.size(); i++){
			BbsDto bbs = list.get(i);
		
		%>
		<tr>
			<td><%=bbs.getRnum() %></td>	
			
			<th>
				 <a href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">
				 <img src="./upload/<%=bbs.getFilename() %>" style="width: 250px; height: 200px">
				 </a>	
			</th>
			
			<td>
				<a href="bbs?param=bbsDetail&seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>
				</a>
			</td>
			
			<td><%=bbs.getMyid() %></td>
			<td><%=bbs.getWdate() %></td>
			<td><%=bbs.getVcount() %></td>
		</tr>
		<%
	}

 %>
 </tbody>

</table>






<div align="center">

<% 
	for(int i =0; i< bbspage; i++ ){
		if(pageNumber == i){
			%>
			<span stylse="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
			</span>&nbsp;
			<%
		}
		else{
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
			</a>&nbsp;
			<%
	}
}
%>


</div>

<br><br>



<div align="center">

<select id="choice"> 
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>">

<button type="button" onclick="searchBbs()">검색</button>

</div>
<br>	
<input id="_bbsSbnBtn" type="button" value="글쓰기" >
<br><br>

</div>
</div>

<script type="text/javascript">
$("#_bbsSbnBtn").click(function() {
	location.href="bbs?param=bbsWrite";
});

function searchBbs(pageNum) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "bbs?param=getPagingBbsList&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;	
}

</script>
</body>
</html>