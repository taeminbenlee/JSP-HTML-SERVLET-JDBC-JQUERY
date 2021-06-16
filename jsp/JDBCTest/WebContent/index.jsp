<%@page import="java.sql.Connection"%>
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

<h1>HR Tables</h1>


<pre>
SELECT * FROM TAB
모든 테이블 목록을 출력한다
</pre>
<%!
	public boolean has$(String msg){
		//테이블명에 $문자 포함여부 조사, $포함되어있으면 실제 테이블이 아니기 때문에 걸러내어줘야함
	
		return msg.contains("$");
}

%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:xe"; //connection 을 위한 url
String user = "hr"; 
String password = "hr";

Connection conn = DriverManager.getConnection(url, user, password);

String sql = "SELECT * FROM TAB";
PreparedStatement psmt = conn.prepareStatement(sql);

ResultSet rs = psmt.executeQuery();

ResultSetMetaData rsmd = rs.getMetaData();	//컬럼 정보
int count = rsmd.getColumnCount();		// 컬럼 수


%>

<table border="1">
<tr>
	<%
	for(int i =1; i < count +1; i++){
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
		for(int i=1; i<count+1;i++){
			String cols = rs.getString(i);
			if(i==1 && has$(cols) == false){
			%>
			<td>
			<a href="table.jsp?tname=<%=cols %>"><%=cols %></a>
			</td>
			<%	
			}else{
				%>
				<td>
					<%=rs.getString(i) %>
				</td>
				<%
			}
			
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