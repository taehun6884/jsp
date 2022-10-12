<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro2.jsp</h1>
	<%
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin");
	
	String paramValue1 = request.getParameter("paramValue1");
	String paramValue2 = request.getParameter("paramValue2");
	%>
	
	
	<h3>paramValue : <%=paramValue1 %></h3>
	<h3>paramValue2 : <%=paramValue2 %></h3>
</body>
</html>