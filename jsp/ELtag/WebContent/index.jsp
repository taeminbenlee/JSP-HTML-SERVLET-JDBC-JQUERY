<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 요즘은 jsp를 많이 없애려는 모습이지만 jsp는 너무 많아서힘듬

   JSP : Html, JavaScript, CSS, Java
   
   <%! 선언부 %>
   <%    코드부 %>
   <%=   값%>   

EL--> 위의 저(3가지)것들을 사용하지않겠다.
'반드시써라'는 아니지만 알고는 있어야한다.
   목적: front-end 에서 java코드를 사용하지 않기 위함이다.
   
   Expression Language
   표현         언어
   
   EL Tag 를 통해서 Value를 표현한다.
   Core Tag 를 통해서 제어문을 표현한다.(jar 추가 해야함)
                     JSTL(Java server page Standard Tag Language)
   Jsp Tag      
   
   형식
   ${ 값, 연산식 }

--%>

<%
   String str = "hello";
   request.setAttribute("_str", str);   
%>

<%
   String s = (String)request.getAttribute("_str");
%>

<%
   out.println("s = " + s);
%>
<br><br>

s = <%=s %>

<br><br>

s = ${ str }

<br><br>
s = ${_str }
<br><br>

<%='값' %>
<br><br> 
${'값' } 
 <br><br>
 ${2+4 }
 <br><br>
 ${ 3>2?100:200 }
 <br><br>
 
 <%
 	request.setAttribute("data", "안녕하세여");
 %>
 
 ${data }
 <br><br>
 
 Object가 할당되어 있는지?
 <%
 Object obj = new String("world");
 if(obj != null){
	 
 }
 //obj = null; 이러면 empty _obj 는 트루가 나옴 비었기 때문에
 	request.setAttribute("_obj", obj);
 	
 	
 	
 %>
 <br><br>
 
 obj = ${empty _obj } 
 <br><br>
 obj = ${not empty _obj}
 <br><br>
 
 <!-- 판별식(true/false), 연산식(value) -->
 1 < 9 : ${ 1 < 9 }
 <br><br>
 1 + 3 : ${1+3 }
 <br><br>
 <%
 	Integer a, b;
 	a=10;
 	b=3;
 	
 	Boolean c; 
 	c = false;
 	
 	request.setAttribute("a", a);
 	request.setAttribute("b", b);
 	request.setAttribute("c", c);
 
 %>
 a:${a }
<br>
b:${b } 
<br>
c:${c }
<br>

a+b:${a+b } 
<br>
a < b:${a<b }
<br> 
c:${!c } 
 <br>
 
 <%//dto 접근
 MemberDto dto = new MemberDto();
 dto.setMessage("Hello EL");
 %>
 <%//셋어트리뷰트해야함
 request.setAttribute("_dto", dto);
 %>
 <br>
 message:${_dto.message }
 
 
 <%//배열접근
 String arr[] = {"hello", "world"};
 request.setAttribute("_arr", arr);
 %>
 
 <br>
 <%=arr[0] %>
 <br>
 ${_arr[1] }
 <br><br>
 <%//리스트접근
 List<String> list = new ArrayList<>();
 list.add("world");
 list.add("hello");
 
 request.setAttribute("_list", list);
 %>
 
 <%=list %>
 <br>
 <%=list.get(0) %>
 <br>
 ${_list[0] }
 <br>
 ${list.[0] }
 <%
 List<MemberDto> mylist = new ArrayList<>();
 //데이터 두개
 	dto.setMessage("Hello 1");
 	mylist.add(dto);
 	dto.setMessage("hello 2");
 	mylist.add(dto);
 	
 	request.setAttribute("_mylist", mylist);
 
 
 %>
 <br>
 
 ${_mylist[1].message }
 
 
 
 
 
 
</body>
</html>