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
	<h1>test3_result.jsp - JSTL</h1>
	<%-- 변수 num 를 선언 및 10 으로 초기화 --%>
	<c:set var="num" value="0"/>
	<%-- EL 사용하여 변수 num 과 파라미터 name, age 값 출력 --%>
	<h3>파라미터 name = ${param.name }, 파라미터 age = ${param.age }</h3>
	<h3>변수 num = ${num }</h3>
	
	<hr>
	
	<%--
	[ 자바에서 가장 많이 사용하는 문장을 표현하는 JSTL 문법(조건문, 반복문) ]
	[ 조건문 - if ]
	- <c:if> 태그 : if문에 해당하는 커스텀태그(단일 if문과 동일 - else 문 없음)
	- 주의! 조건식에 들어갈 문장을 test="" 속성 내에 EL 을 사용하여 표기
	- 기본 문법
	  <c:if test="조건식">
	  		// 조건식 판별 결과가 true 일 때 실행할 문장들...
	  </c:if>
	--%>
	<%-- 변수 num 의 값이 0 보다 클 경우를 판별하는 문장 --%>
	<c:if test="${num gt 0}">  <%-- <%if(조건식) {} 과 동일 --%>
		<h3>
			\${num } 값이 0 보다 크다!<br>
			그러므로, 이 메세지는 현재 페이지에서 출력됨!
		</h3>
	</c:if>
	
	<%-- 파라미터 name 값이 비어있을 경우 "name 값이 없습니다!" 출력 --%>
	<c:if test="${empty param.name }">
		<h3>\${param.name } 값이 없습니다!</h3>
	</c:if>
	<%-- 단일 if 문에 해당하므로 조건식이 아닐 경우에 대한 문장을 다시 c:if 태그로 작성해야함 --%>
	<c:if test="${not empty param.name }">
		<h3>\${param.name } 값이 있습니다!</h3>
	</c:if>
	
	<hr>
	
	<%--
	<c:choose> <c:when> <c:otherwise> 태그
	- if ~ else 문 또는 if ~ else if ~ else 문 등에 해당하는 커스텀태그
	- <c:choose> 태그를 사용하여 조건문이라는 표시를 하고
	  <c:when> 태그에서 조건식을 지정 => 복수개 사용할 경우 다중 else if 문이 됨
	  또한, <c:otherwise> 태그에서 조건식의 판별 결과가 모두 false 일 때 수행할 문장 기술
	  (=  else 문과 동일)
	- 기본 문법
	  <c:choose>
	  	<c:when test="조건식1">
	  		// 조건식1 이 true 일 때 실행할 문장들...
	  	</c:when>
	  	<c:when test="조건식n">
	  		// 조건식n 이 true 일 때 실행할 문장들...
	  	</c:when>
	  	<c:otherwise>
	  		// 조건식이 모두 false 일 때 실행할 문장들...(= else) => 생략 가능
	  	</c:otherwise>
	  </c:choose>
	--%>
	
	<%-- 변수 num 값에 대해 양수, 음수, 0 판별 --%>
	<c:choose>
		<c:when test="${num gt 0 }">
			<h3>\${num }(${num }) : 양수!</h3>
		</c:when>
		<c:when test="${num lt 0 }">
			<h3>\${num }(${num }) : 음수!</h3>
		</c:when>
<%-- 		<c:when test="${num eq 0 }"> --%>
<%-- 			<h3>\${num }(${num }) : 0!</h3> (c:when) --%>
<%-- 		</c:when> --%>
		<c:otherwise>
			<h3>\${num }(${num }) : 0! (c:otherwise)</h3>
		</c:otherwise>
	</c:choose>
	
	<h3>\${param.name } = ${param.name }</h3>
	<%-- 파라미터 name 값이 "홍길동", "이순신", 그 외 나머지 판별 --%>
	<c:choose>
		<%-- 파라미터 name 값이 비어있을 경우 "이름 입력 필수!" 출력 --%>
		<c:when test="${empty param.name }">
<!-- 			<h3>이름 입력 필수!</h3> -->
			<%-- 자바스크립트를 사용하여 "이름 입력 필수!" 출력 후 이전 페이지로 돌아가기 --%>
			<script type="text/javascript">
				alert("이름 입력 필수!");
				history.back();
			</script>
		</c:when> 
		<c:when test="${param.name eq '홍길동' }">
			<h3>\${param.name } : 홍길동입니다!</h3>
		</c:when>
		<c:when test="${param.name eq '이순신' }">
			<h3>\${param.name } : 이순신입니다!</h3>
		</c:when>
		<c:otherwise>
			<h3>\${param.name } : 그 외 나머지입니다!</h3>
		</c:otherwise>
	</c:choose>
	
</body>
</html>



















