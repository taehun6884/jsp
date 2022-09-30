<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 스크립틀릿(자바의 메서드 내부와 동일)
// 인스턴스 생성, 변수 선언 등의 대부분의 작업 가능함(메서드 정의 제외)
Calendar c = Calendar.getInstance();
int hour = c.get(Calendar.HOUR_OF_DAY);
int min = c.get(Calendar.MINUTE);
int sec = c.get(Calendar.SECOND);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp - 스크립틀릿과 표현식 연습</h1>
	<%-- 스크립틀릿 내에서 선언된 변수는 표현식으로 출력 가능 --%>
	<h3>현재 시각은 <%=hour %>시 <%=min %>분 <%=sec %>초 입니다.</h3>
	
	<%
	// 스크립틀릿 내에서 표현식과 동일한 방식으로 데이터를 출력하기 위해서는
	// JSP 내장 객체인 out 객체의 print() 또는 println() 메서드로 출력해야한다.
	// => 문자열 형식으로 HTML 태그까지 그대로 적용 가능
	out.print("<h3>현재 시각은 " + hour + "시 " + min + "분 " + sec +"초 입니다.</h3>");
	%>
	
	<%--
	스크립틀릿 내에서는 자바 문법 사용이 가능하므로 if 문 등도 사용 가능함
	=> 따라서, HTML 태그를 특정 조건에서만 실행되록 하기 위해서
	   if 문 블록과 HTML 태그를 조합하여 사용 가능
	=> 또한, 특정 태그를 반복 실행하기 위해서 for문, while 등과 결합도 가능
	=> 단, if 문 등의 문장과 조합하여 HTML 태그를 사용하여 두 가지 방법 중 하나를 사용
	   1) 스크립틀릿 내부에 out.print() 메서드를 사용하여 데이터 출력
	      => HTML 태그보다 자바 코드가 더 많을 경우 주로 사용
	   2) 스크립틀릿 외부에 HTML 태그 작성하여 데이터 출력
	      => 자바 코드보다 HTML 태그가 더 많을 경우 주로 사용
	--%>
	<%
	// 1번 방법. 스크립틀릿 내에서 out.print() 메서드를 사용하여
	// 출력할 태그를 문자열로 지정하는 방법
	// if문을 사용하여 현재 시각(hour)이 12 미만이면 "오전입니다", 아니면 "오후입니다" 출력
	if(hour < 12) { // 12보다 작을 경우 = 오전
		out.print("<h3>오전입니다.</h3>");
	} else { // 아니면 = 오후
		out.print("<h3>오후입니다.</h3>");
	}
	%> 
	
	<%-- 2번 방법. 스크립틀릿으로 if문만 표현하고, HTML 태그는 스크립틀릿 외부에서 표현 --%>
	<%if(hour < 12) { %>
		<h3>오전입니다.</h3>
	<%} else { %>
		<h3>오후입니다.</h3>
	<%} %>
</body>
</html>










