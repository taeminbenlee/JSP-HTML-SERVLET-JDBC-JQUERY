<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
        th, td, p, input {
            font:14px Verdana;
        }
        table, th, td 
        {
            border: solid 4px BurlyWood;
            border-collapse: collapse;
            padding: 6px 9px;
            text-align: left;
        }
        th {
            font-weight:bold;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<form action="insertAf.jsp" id="frm">
<table>
	<tr>
		<td>아이디&nbsp;&nbsp;<input type="text" id="username" name="username"></td>
		 
	</tr>
	<tr>
		<td>패스워드&nbsp;&nbsp;<input type="password" id="psw" name="psw"></td>
		
	</tr>
	<tr>
		<td>취미</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="hobby" value="sleep">
				<label for="hobby">잠자기</label>
			
			<input type="checkbox" name="hobby" value="sing">
				<label for="hobby">노래</label>
		
			<input type="checkbox" name="hobby" value="game">
				<label for="hobby">게임</label>
		</td>
	</tr>
	
	
	<tr>
		<td>연령대</td>
	</tr>
	<tr>
		<td><input type="radio" name="age"  value="10" checked="checked">10대
			<input type="radio" name="age" value="20">20대
			<input type="radio" name="age" value="30">30대 
			<input type="radio" name="age" value="40">40대
			<input type="radio" name="age" value="50">50대
			<input type="radio" name="age" value="60">60대이상	
		</td>
	</tr>
	<tr>
		
		
		<td>기타하고싶은말 <br>
		<textarea name="memo" cols="40" rows="5"></textarea>
		</td>
	</tr>
</table>
	
<input type="button" value="전송" id="btn"><input type="reset" value="취소" id="cc">
<input type="button" value="전송2" id="btn2">
</form>

<script type="text/javascript">
$(document).ready(function () {

	$(function() {
	    $("*").focus(function () {
	        $(this).css("background-color", "yellow");
	    });
	    $("*").blur(function () { 
	        $(this).css("background-color", "white");
	    });
	    
	    
	    $("#btn").click(function() {
	    	if( $("#username").val() == ''){
	    	$("#username").attr('required',true);
	    	return;
	    	}
	    	$("#frm").submit();
	    
	});
	});
	
});
</script>  





</body>
</html>