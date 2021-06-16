<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--

	Java : 제어문, 컬렉션, DB접근
			EL, core, JSP
			Scriptlet
			선언부, 코드부, value



 --%>
 <!-- 선언부 !표시를 붙인다 -->
<%!
// 전역변수, class, function을 선언할수있는 부분
// 전역변수의 선언
int glNumber = 0;

%>
<!-- 코드부 -->
<%
glNumber++;
out.println("<h3>" + glNumber + "</h3>");
int number = 0;
number++;
out.println("<h3>"+ number + "</h3>");
//전역변수만 증가하게 된다. 왜냐하면 전역변수(선언부에 선언된 변수)는 값을 계속 유지해주기 때문에

%>
<!-- value --> <!-- 값만을 접근할때는 =를 붙인다 -->
glNumber:<%=glNumber%>
<br>
number:<%=number %>


<!-- 클래스 선언 -->
<%!
//클래스
class myClass {
	//변수
	private int number; 
	//생성자
	public myClass(int number){
		this.number = number;
	}
	//메소드
	public String toString(){
		return this.number + "";
	}
}
public String func(){
	return "func() 호출";
}
%>

<%
//클래스호출
//생성자
myClass cls = new myClass(23);

System.out.println(cls.toString());

System.out.println(func());

YouClass ycls = new YouClass("홍길동");

System.out.println(ycls.toString());
%>









</body>
</html>