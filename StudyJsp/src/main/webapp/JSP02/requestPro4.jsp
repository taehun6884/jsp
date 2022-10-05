<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro4.jsp - 로그인 처리</h1>
	<%
	// 폼 파라미터(아이디, 패스워드) 가져와서 변수에 저장 및 출력
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
	<%
		if(id.equals("admin") && passwd.equals("1234")){			
	%>		
	 		<script type="text/javascript">
	//  			alert("로그인 성공");
	//  			location.href = "requestPro4_responseResult1.jsp";
	 		</script>
 	
 	<%	
 		}else{
	%>
			<script type="text/javascript">
	//  			alert("로그인 실패");
	//  			location.href = "requestPro4_responseResult2.jsp";
	 		</script>
	<%} %>

	<%
		if(id.equals("admin") && passwd.equals("1234")){
			response.sendRedirect("requestPro4_responseResult1.jsp");		
		}else{
			response.sendRedirect("requestPro4_responseResult2.jsp");
		}
	%>
	
</body>
</html>











