<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div id="member_area">
	
	<c:choose>
		<c:when test="${not empty sessionScope.sId }">
			<a href="MemberList.me">회원목록</a> |${sId } | <a href="MemberLogout.me">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="./">Home</a> |<a href="LoginMember.me">Login</a> | <a href="MemberInsertForm.me">Join</a>
		</c:otherwise>
	</c:choose>
</div>