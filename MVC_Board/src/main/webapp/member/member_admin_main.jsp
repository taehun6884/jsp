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
<%-- 	<%if(sId == null || !sId.equals("admin")) { %> --%>
<!-- 		<script> -->
<!--  			alert("잘못된 접근입니다!"); -->
<!--  			locaion.href = "../main/main.jsp"; -->
<!-- 		</script> -->
<%-- 	<%} %> --%>
	<h1>admin_main.jsp - 관리자 페이지</h1>
	<table border="1">
		<tr>
			<th>아이디</th><th>이름</th><th>E-Mail</th><th>성별</th><th>가입일</th>
		</tr>
		<c:forEach var="member" items="${memberlist}">
		<tr>
			<td>${member.id }</td>
			<td>${member.name }</td>
			<td>${member.email }</td>
			<td>${member.gender }</td>
			<td>${member.date }</td>
			<td>
				<input type="button" value="상세조회" name="info_detail" onclick="location.href='../member/member_info.jsp?id='">
			</td>
		</tr>
		</c:forEach>
		<tr><td colspan="6" align="right"><input type="button" value="메인 페이지로 이동" name="" onclick="location.href='../main/main.jsp'">
	</table>
</body>
</html>