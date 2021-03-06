<%@page import="Dto.CommentDto"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BbsDto bbs = (BbsDto)request.getAttribute("bbs");
MemberDto mem = (MemberDto)session.getAttribute("login");
int manager = 0;
String id = "";
int seq = 0;

if(mem!=null){
	manager = mem.getMymanager();
	id = mem.getMyid();
}

if(bbs!=null){
	seq = bbs.getSeq();
}

//댓글 관련 필요 요소
List<CommentDto> list = (List<CommentDto>)request.getAttribute("list");
int pages = Integer.parseInt((String)request.getAttribute("page"));
int viewPage = Integer.parseInt((String)request.getAttribute("viewPage"));
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstarp-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
<br>
<div align=center>
<div class="container">
<h1>우리 멍냥이는요</h1>
<table class='table'>
	<tr>
		<th>작성자</th><td colspan=2><%=bbs.getMyid() %></td>
	</tr>
	<tr>
		<th>제목</th><td colspan=2><%=bbs.getTitle() %></td>
	</tr>
	<tr>
		<th>조회수</th><td colspan=2><%=bbs.getVcount() %></td>
	</tr>
	<tr>
		<th>작성일</th><td colspan=2><%=bbs.getWdate() %></td>
	</tr>
	<tr>
		<th>
			내용</th><td colspan=2><img src="./upload/<%=bbs.getFilename() %>" style="width: 80%;">
			<br> 
			<%=bbs.getMycontent() %>
		</td>
	</tr>	
</table>


<!-- 댓글 쓰기 -->
<form action="./comment" method='post'>
<input type='hidden' name='param' value='write'>
<input type='hidden' name='urlParam' value='bbsDetail'>
<input type='hidden' name='seq' value=<%=seq %>>
<input type='hidden' name='url' value='bbs'>
<input type='hidden' name='myId' value=<%=id %>>
<%
if(!(id.equals(""))){
%>
<table class='table' width='100%'>
    <tr>
		<td>
			<div class='row'>
				<div class='col-10'>
					<input type='text' class='form-control' name='content' placeholder='댓글을 입력하세요'>
				</div>
				<div class='col=2'>
					<input type='submit' class='btn btn-secondary' value='입력완료'>
				</div>
			</div>
		</td>
	</tr>
</table>
</form>
<%
}
%>




<!-- 댓글 불러오기 -->
<%
if(list != null){
%>
<table class='table' width='100%'>
	<tr>
	<td><br></td><td><br></td><td><br></td>
	</tr>
<%
for(int i=0; i<list.size(); i++){
	CommentDto dto = list.get(i);
%>
	
	<tr>
		<td><%=dto.getId() %></td>
		<td>
		<input type='text' class='form-control' name='content' value=<%=dto.getContent() %>>
		</td>
		<!-- 로그인 아이디와 글쓴이가 같거나 매니저라면 수정/삭제 버튼 보이기 -->
		<%
		if(manager==1 || dto.getId().equals(id)){
		%>
		<td>	
		<input type='button'  data-toggle="modal" data-target="#myModal1" value='수정' onclick="commentSeq('<%=dto.getSeq()%>')">
		<input type='button'  data-toggle="modal" data-target="#myModal2" value='삭제' onclick="commentSeq('<%=dto.getSeq()%>')">
		</td>
	</tr>
	<%
		}
	%>
<%
} // for
%>
</table>	
	

<!-- 댓글 페이징  -->
<div align="center">
<%                //출력되는 페이지 수 
for(int i = 0;i < viewPage; i++){
	if(pages == i){	// 현재 페이지 [1] 2 [3] 
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}
	else{
		%>		
		<a href="#none" onclick="goPage('<%=i %>',)"
			style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
		</a>&nbsp;	
		<%
	}	
}
%>
</div>

<%
} // if
%>	
	


<!-- 댓글 수정 Modal창 -->
  <div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">수정할 내용을 입력하세요</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input type='text' id='newContent'>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick='updateFinish()'>수정 완료</button>        
          <button type="button" class="btn btn-danger" data-dismiss="modal">수정 취소</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  <!-- 댓글 삭제 Modal -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">정말 삭제하시겠습니까</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
     
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="commentDelete()">예</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">아니오</button>
        </div>
        
      </div>
    </div>
  </div>

	
	
	
<!-- 버튼그룹 -->
<div align=center>
<%
if(manager == 1 || bbs.getMyid().equals(id)){
%>
    <input type="button" value="삭제" onclick="location.href='bbs?param=deleteBbs&seq=<%=bbs.getSeq() %>'">
	<input type="submit" value="수정" onclick="location.href='bbs?param=updateBbs&seq=<%=bbs.getSeq() %>'">
<%
}
%>
	<input type="button" value="목록으로" onclick="location.href='bbs?param=getPagingBbsList'">
</div>
<br>
</div>
</div>



<script>
let commSeq = 0;

//댓글의 seq 값
function commentSeq(num){
	commSeq = num;
}

function updateFinish(){
	let content = $('#newContent').val();      
	location.href = "comment?param=update&commSeq="+commSeq+"&content="+content+"&seq="+<%=seq %>+
			        "&url=bbs&urlParam=bbsDetail"
}

function commentDelete(){
	location.href = "comment?param=delete&commSeq="+commSeq+"&seq="+<%=seq %>+
	                "&url=bbs&urlParam=bbsDetail"
}

function goPage(pageNumber){
	location.href = "bbs?param=bbsDetail&pageNumber=" +pageNumber+"&seq="+<%=seq %>
};

</script>





</body>
</html>