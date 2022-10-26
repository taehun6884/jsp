<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {
		width: 800px;
		height: 80px;
		text-align: right;
	}

	article {
		width: 800px;
		height : 400px;
		text-align: center;
		border: 1px solid blue;
	}
	
	footer {
		width: 800px;
		height : 100px;
		text-align: center;
	}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("sId");

%>
	<header>
		
		<%
		if(id ==null || id.equals("")){
		%>
		<h4><a href="loginForm2.jsp">로그인</a> || <a href="insertForm2.jsp">회원가입</a></h4>
		<%
		}else {
		%>
		
		<h4><a href="select2_detail.jsp?id=<%=id%>"><%=id %>님</a> ||
			 <a href="logout.jsp">로그아웃</a>
			<%if(id.equals("admin")){ %>
				|| <a href="select2.jsp">관리자페이지</a>
			 <%} %>
			 </h4>
		<%
		}
		%>
	</header>
	<article>
	<h1>index.jsp</h1>
	</article>
	<footer>
		<h5>아이티윌 부산교육센터 오시는 길</h5>
	</footer>
	
</body>
</html>