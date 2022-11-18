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
	<h1>test2.jsp - JSTL</h1>
	<c:set var="str" value="Hello, World!"/>
	<h3>\${str } = ${str}</h3>
<%-- 	<h3>\${str } = <%=str %></h3> --%>
	<%String str2 = "Hello, World2!!!"; %>
	<%pageContext.setAttribute("str2", str2); %>
	
<%-- 	<c:set var="str2" value="<%=str2 %>"/> --%>
	<h3>\${str2 } = ${str2 }</h3>
	<h3><c:out value="${str }"></c:out></h3>
	
	<c:set var ="targetTag" value="&lt;c:out&gt;"/>
	<h3><c:out value="${targetTag }"/></h3>
	<h3><c:out value="${targetTag }" escapeXml="false"/></h3>
	
	<hr>
	<c:remove var="str"/>
	<h3>\${str } 값 삭제 후 = ${str }</h3>
	<h3>\${str } 값이 비어있는가? ${empty str }</h3>
	
</body>
</html>