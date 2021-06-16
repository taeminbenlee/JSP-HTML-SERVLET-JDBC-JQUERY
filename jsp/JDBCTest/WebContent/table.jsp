<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HR Table</h1>
<pre>
SELECT * FROM TABLE
넘어온 테이블의 데이터를 출력한다.
</pre>

<%
Class.forName("oracle.jdbc.driver.OracleDriver"); 

String url = "jdbc:oracle:thin:@localhost:1521:xe"; //connection 을 위한 url
String user = "hr"; 
String password = "hr";

Connection conn = DriverManager.getConnection(url, user, password);

String tname = request.getParameter("tname");

String sql = "SELECT * FROM " + tname; //tname으로 넘어오니 tname을 from 뒤에 한칸 떨어뜨려놔야함

PreparedStatement psmt = conn.prepareStatement(sql);
ResultSet rs = psmt.executeQuery();

ResultSetMetaData rsmd = rs.getMetaData(); //컬럼데이터
int count = rsmd.getColumnCount(); 			//컬럼갯수

%>

<table border="1">
<tr>
<%
	for(int i =1; i<count+1; i++){
		%>
		<td><%=rsmd.getColumnName(i) %></td>
		
		<%
	}

%>
</tr>

<%
while(rs.next()){
	%>
	<tr>
		<%
		for(int i=1; i<count+1; i++){
			%>
			<td><%=rs.getString(i) %></td>
			<%
		}
		
		%>
	
	</tr>
	<%
}

%>


</table>
<%
if(rs != null) rs.close(); //잊지말고 꼭 마지막에 넣어주자 (DB안정화)
if(psmt != null) psmt.close();
if(conn != null) conn.close();

%>


</body>


</html>