<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--  태그이름

설명 

<c:set />

 변수의 선언 및 제거

<c:remove /> 

<c:out /> 

변수의 출력 

 <c:catch />

예외 처리 

<c:if /> 

조건문 (else는 없다) 

<c:choose /> 

Switch문과 비슷 

<c:when />

<c:otherwise /> 

<c:forEach /> 

반복문 

<c:forTokens /> 

구분자로 분할하여 반복문 

<c:url />

URL 생성 

<c:param /> 

파라미터 추가 

<c:import /> 

페이지 첨부 

 <c:redirect />

URL 이동  --%>
<%-- 1. <c:set /> Tag

 - JSP의 setAttribute()와 같은 역할

 - <c:set var="변수명" 

            value="변수에 넣을 값"

            property="자바빈 객체 or Map 객체 값을 설정할 프로퍼티 명"

            scope="변수 공유 범위" /> --%>


<!-- scope 속성은 선택적이며 page로 기본 설정되어 있다.-->
<%-- <c:set  var="변수명"  value="할당된 값"
        scope="변수의 유효 범위 page|request|session|application" /> --%>
 
<!-- 간단 사용 예 -->

<c:set var="country" value="Korea" scope="request" />
<c:set var="intArray" value="<%=new int[] {1,2,3,4,5} %>" />

<%-- 2. <c:remove /> Tag

 - JSP의 removeAttribute()와 같은 역할

 - <c:remove var="변수명" 

               scope="변수 공유 범위" /> --%>


<c:remove var="country" scope="request" />

<%-- 3. <c:out /> Tag

 - '<%=...>'와 같다. JSP의 표현식을 대체

 - <c:out var="변수명" 

            default="기본값"

            escapeXML="true|false" /> --%>

<!-- Syntax -->
<%-- <c:out var="변수명" default="기본값" escapeXML="true|false" /> --%>
 
<!-- 간단 사용 예 -->
<p><c:out value="${country}" default="Korea" escapeXml="true"/></p>
<p>${country}</p><p>${intArray[0]}</p>

<%-- 5. <c:if /> Tag

 - 조건문

 - <c:if test="조건 판별식"

           var="변수명"

           scope="변수 공유 범위" /> --%>


<!-- Syntax -->
<%-- <c:if test="expression"  var="name"  scope="scope">
body content
</c:if> --%>
 
<!-- 간단 사용 예 -->
<%-- 
<c:set var="login" value="true" />
 
<c:if test="${!login}"> <p><a href="/login.ok">로그인</a></p></c:if>
<c:if test="${login}"> <p><a href="/logout.ok">로그아웃</a></p></c:if> 
--%>
 
<!-- 아래 예제와 같이 null 비교를 하지 않고 empty 비교를 하면 null과 ""를 동시에 체크할 수 있다. -->
<c:if test="${!empty country}"><p><b>${country}</b></p></c:if>

<%-- 6. <c:choose />, <c:when />, <c:otherwise />

 - Switch문과 동일, 여러개의 when 태그와 하나의 otherwise 태그를 가진다

 - <c:if /> 태그에 else가 없으므로 대체식으로도 많이 사용

 - <c:choose>

     <c:when test="조건 판별식"> .... </c:when>

     <c:when test="조건 판별식"> .... </c:when>

     <c:when test="조건 판별식"> .... </c:when>

   </c:choose> --%>


<!-- Syntax -->
<%-- 
<c:choose>
<c:when test="expression">
body content
</c:when>
...
<c:otherwise>
body content
</c:otherwise>
</c:choose>
 
<!-- 간단 사용 예 -->
<c:choose>
  <c:when test="${login}">
    <p><a href="/logout.ok">로그아웃</a></p>
  </c:when>
  <c:otherwise>
    <p><a href="/login.ok">로그인</a></p>
  </c:otherwise>
</c:choose> 
--%>
<%-- 
7. <c:forEach /> Tag

 - 객체 전체에 걸쳐 반복 실행에 사용

 - <c:forEach var="현재 아이템의 변수명" 

                items="반복 데이터가 있는 아이템 Collection 명"

                begin="시작 값, 기본값은 0"

                end="종료 값"

                step="증가 값"

                varStatus="반복 상태 값을 지닌 변수" />



※ varStatus는 forEach의 상태를 알 수 있는 값이 들어 있다.

$(변수.current} : 현재의 인덱스
$(변수.index} : 0부터의 인덱스
$(변수.count} : 1부터의 인덱스
$(변수.first} : 현재 루프가 처음인지 확인
$(변수.last} : 현재 루프가 마지막인지 확인
$(변수.begin} : forEach문의 시작 값
$(변수.end} : forEach문의 끝 값
$(변수.step} : forEach문의 증가 값

 --%>



<!-- 정수 범위내의 반복 Syntax -->
<%-- <c:forEach var="name" varStatus="name"
            begin="expression" end="expression" step="expression">
  body content
</c:forEach>
 
<!-- 컬렉션 범위내의 반복 Syntax -->
<c:forEach var="name" items="expression" varStatus="name"
           begin="expression" end="expression " step="expression">
  body content
</c:forEach>
 
<!-- forEach 정수 범위내의 반복 -->
<c:forEach var="i" begin="0" end="10" step="2" varStatus="x">
  <p> i = ${i}, i*i = ${i * i} <c:if test="${x.last}">, last = ${i}</c:if> </p>
</c:forEach> --%>
 
<!-- forEach 컬렉션 범위내의 반복 -->
<%
  java.util.List list = new java.util.ArrayList();
 
  java.util.Map map = new java.util.HashMap();
  map.put("color","red");
  list.add(map);
   
  map = new java.util.HashMap();
  map.put("color","blue");
  list.add(map);
   
  map = new java.util.HashMap();
  map.put("color","green");
  list.add(map);
   
  request.setAttribute("list", list);
%>
 
<c:forEach var="map" items="${list}" varStatus="x">
  <p> map(${x.index}) = ${map.color}  </p>
</c:forEach>

<%-- 8. <c:forTokens /> Tag
 - 문자열을 구분자(delimiter)로 분할

 - <c:forTokens var="현재 아이템의 변수 명"

                  items="반복 데이터가 있는 아이템 Collection 명"

                  delims="구분자, 여러개 지정 가능"

                  begin="시작 값, 기본 값은 0"

                  end="종료 값"

                  step="증가 값"

                  varStatus="반복 상태 값을 지닌 변수" /> --%>
                  
<!-- Syntax -->
<%-- <c:forTokens var="name" items="expression"
             delims="expression" varStatus="name"
             begin="expression" end="expression" step="expression">
  body content
</c:forTokens> --%>
 
<!-- 간단 사용 예 -->
<b>
<c:forTokens var="color" items="빨|주|노|초|파|남|보" delims="|" varStatus="i" >
     <c:if test="${i.first}">color : </c:if>
     ${color} <a href="<c:url value='/TEST.jsp' />">
 
   View Test
 
</a>
     <c:if test="${!i.last}">,</c:if>
</c:forTokens>
</b>


<!-- 
   EL : Value
   Core : 제어문 + EL  
-->
<%--
   String data = "core tag 입니다.";
   request.setAttribute("_data", data);
--%>

<%--
   out.println(data);
--%>

<c:set var="_data" value="Core tag + EL 입니다."/>
<c:out value="${ _data }"></c:out>
<br><br>

<!-- if -->
<%
   request.setAttribute("count", "10");
%>

<%
   String scount = (String)request.getAttribute("count");
   int count = Integer.parseInt(scount);
   if(count >= 10){
      %>
      <p> count : <%=count %></p>
      <%
   }
%>

<c:if test="${ count >= 10 }">
   <p>core count : <c:out value="${ count }"/></p> 
</c:if>
<%
   request.setAttribute("name", "홍기르동");
%>

<%-- <c:if test="${ name == '홍기르동' }"> --%>
<c:if test="${ name eq '홍기르동' }">
   <p>이름은 홍기르동 입니다</p>
</c:if>

<!-- for -->
<%
   for(int i = 0; i < 10; i++){
      %>
         <%=i %>
      <%
   }
%>
<br>
<c:forEach begin="0" end="9" step="1" varStatus="i">
   <c:out value="${ i.index }"/>
</c:forEach>

<br><br>

<%
   List<MemberDto> slist = new ArrayList<>();

   MemberDto m = new MemberDto();
   m.setMessage("mmm");
   slist.add(m);
   
   m = new MemberDto();
   m.setMessage("lll");
   slist.add(m);
   
   request.setAttribute("_list", slist);
%>
<c:forEach begin="0" end="1" var="mem" items="${ _list }" varStatus="i">
   <p>index: <c:out value="${ i.index }"/>
      data: <c:out value="${ mem.message }"/></p>
</c:forEach>









</body>
</html>