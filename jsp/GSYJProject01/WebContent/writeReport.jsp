<%@page import="Dto.abandonedDogDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">


#UrgencyLevel{width: 100px;}
#choice{width: 100px; height: 60px;}
#search{width: 800px; height: 60px;}
#text1{width:100%; height:100%; float: center; margin-top: 200px; 
		font-family: 'Nanum Pen Script', cursive; font-size: 20px;}
</style>
</head>
<%
request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>

<body>

<!-- <form action="bbs?param=writeAf" method="post"> -->
<form action="filedd?param=writeAf" method="post" enctype="multipart/form-data">
<div class = "container" id="text1">
	<table>
<colgroup>
<col width="200"><col width="400">
</colgroup>

<tr>
	<th>아이디</th>
	<td>
		<%-- <input type="text" name="id" size="50px" value="<%=mem.getId() %>"> --%>
		<input type="text" name="id" size="50px" value="<%=mem.getMyid() %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th>위급등급(매우위급5 ~ 건강함1)</th>
	<td>
		<div class="form-group">
      <select class="form-control" id="UrgencyLevel" name="danger">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    	</div>
	</td>
</tr>
<tr>
	<th>발견장소</th>
	<td>
		<textarea rows="3" cols="50px" name="address"></textarea>
	</td>
</tr>
<tr>
	<th>연락처</th>
	<td>
		<input type="text" name="phonenum" size="50px">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50px" name="content"></textarea>
	</td>
</tr>
<tr>
	<th>첨부파일</th>
	<td>
		 <input type="file" name="fileload">	
	</td>
</tr>	
<tr>
	<td colspan="2">
		&nbsp;&nbsp;<button type="submit" class="btn btn-warning">제보</button>
		
	</td>
</tr>
</table>
</div>
<!-- </form> -->
</form>
</body>
</html>