<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


<h2>The XMLHttpRequest Object</h2>

<button type="button">클릭</button>

<br><br>
<table id="myTable">

</table>

<p id="bookss"></p>
</body>
<script type="text/javascript">

$(function(){
	
	$("button").click(function(){
		
		$.ajax({
			url:"books.xml",
			dataType: "xml",
			success: function(xml) {
                $(xml).find('catalog').each(function(){
                    $(this).find("book").each(function(){
                    	
                        //var values = $(this).text();
                        //alert(values);
                        $("#myTable").append($"<table><tr><td>"(this).find("author").text() + "</td></tr>");
                        $("#bookss").append($(this).find("title").text() + "<br>");
                        $("#bookss").append($(this).find("genre").text() + "<br>");
                    });
                });
            }
		});
		
		
		
	});
	
});

</script>



</html>