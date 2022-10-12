<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	
		String jumin = request.getParameter("jumin");
		
		int age = 25;
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>비밀번호 : <%=passwd %></h3>
	<h3>주민번호 : <%=jumin %></h3>
<%-- 	<jsp:forward page="forwardPro2.jsp"/> --%>
	
	<jsp:forward page="forwardPro2.jsp">
		<jsp:param name="paramValue1" value="forward 액션태그의 param 태그 데이터"/>	
		<jsp:param name="paramValue2" value="<%=age %>"/>
	</jsp:forward>

</body>
</html>