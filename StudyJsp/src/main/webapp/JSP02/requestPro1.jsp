<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro1.jsp</h1>
	<h1>request 객체 처리 페이지</h1>
	<%
	/*
	requestForm1.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 request 객체에 모두 저장되고
	action 속성에 지정된 페이지로 이동(= 페이지를 요청)하면서 데이터 전달함
	=> 요청 관련 모든 정보는 request 객체가 관리(= JSP 가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명() 형태로 request 객체의 메서드 호출하여 객체 다루기 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명"); // 단일 파라미터 데이터 가져오기 = String 리턴
	   2) request.getParameterValues("파라미터명"); // 복수 항목 파라미터 가져오기 
	      = String[] 리턴(주로, checkbox 처럼 하나의 이름으로 복수개의 파라미터 전달할 경우 사용)
	=> 주의! 지정된 파라미터가 존재하지 않을 경우(지정한 이름이 없을 경우) null 값이 리턴되고,
	   파라미터는 있으나 데이터가 없는 경우에는 널스트링("") 값이 리턴됨
	*/
	
	// ---------------------------------------------------------------------------------------
	// POST 방식으로 파라미터가 전달될 경우 한글 처리 방법
	// => GET 방식일 때 한글 처리는 JSP page 디렉티브 등에 UTF-8 타입을 지정하면 되지만
	//    POST 방식일 경우 request 객체에 대한 한글 처리를 별도로 수행해야한다!
	// => 반드시 응답 페이지(request 객체로부터 데이터를 실제로 가져와서 사용하는 곳)에서 설정
	// => request 객체의 setCharacterEncoding() 메서드를 호출하여 "UTF-8" 지정
	request.setCharacterEncoding("UTF-8");
	// => 단, 반드시 파라미터값을 가져오는 코드(getParameter()) 보다 먼저 수행되어야 함!
	// ---------------------------------------------------------------------------------------
	
	// 1. 파라미터 중 파라미터명(name 속성값)이 "name" 인 값 가져와서 String 타입 strName 에 저장
	String strName = request.getParameter("name");
	// 스크립틀릿 내에서 웹브라우저에 데이터 출력할 경우 out.print() 또는 out.println() 사용
// 	out.println("이름 : " + strName + "<br>");
	
	// 2. 파라미터 중 파라미터명이 "age" 인 값 가져와서 String 타입 strAge 에 저장
	String strAge = request.getParameter("age");
// 	out.println("나이 : " + strAge + "<br>");
	
	// 3. 파라미터 중 파라미터명이 "gender" 인 값 가져와서 String 타입 strGender 에 저장
	String strGender = request.getParameter("gender");
// 	out.println("성별 : " + strGender + "<br>");
	
	// 4. 파라미터 중 파라미터명이 "hobby" 인 값 가져와서 String 타입 strHobby 에 저장
// 	String strHobby = request.getParameter("hobby");
// 	out.println("취미 : " + strHobby + "<br>");
	// 주의! 복수개의 데이터가 하나의 파라미터명으로 전달되는 경우(ex. 체크박스)
	// getParameter() 메서드를 사용하면 하나의 데이터(첫번째 데이터)만 가져올 수 있음
	// 따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	// 복수개의 동일한 이름의 파라미터를 String[] 타입으로 리턴받아 처리해야함
	String[] strHobbies = request.getParameterValues("hobby"); 
// 	out.println("취미 : " + strHobbies + "<br>");
	// => 주의! 체크박스 항목을 하나도 체크하지 않을 경우 "hobby" 라는 파라미터가 없으므로
	//    strHobbies 배열(변수)에는 null 값이 저장된다! = 배열이 존재하지 않음
	%>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=strName %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=strAge %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<!-- strHobbies 배열 접근 시 최대 3개의 항목 접근 가능 -->
<%-- 				<%=strHobbies[0] %> <%=strHobbies[1] %> <%=strHobbies[2] %> --%>
				<!-- 주의! 배열 크기가 3 미만일 경우 인덱스 직접 지정 시 오류 발생 가능성 있음 -->
				<!-- java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2 -->
				<!-- 반드시, 배열 접근 시 for 문을 사용하여 배열 크기만큼 반복하면서 접근해야함 -->
				<!-- hobby 파라미터 없을 경우 strHobbies.length 접근 시 NullPointerException 이라는 오류 발생함 -->
				<%
// 				for(int i = 0; i < strHobbies.length; i++) {
// 					out.println(strHobbies[i] + " ");
// 				}
				%>
				
				<%-- 
				만약, strHobbies 가 null 이면 자바스크립트를 사용하여
				"취미 선택 필수!" 메세지 출력 후 이전페이지로 돌아가기
				--%>
<%-- 				<%if(strHobbies == null) { %> --%>
					<script type="text/javascript">
// 						alert("취미 선택 필수!");
// 						history.back();
					</script>
<%-- 				<%} %> --%>

				<%
				// 만약, strHobbies 가 null 이면 "없음" 문자열 출력하고,
				// 체크 항목이 하나라도 존재할 경우에만 반복문을 통해 항목 출력
				if(strHobbies == null) {
					out.println("없음");	
				} else {
					for(int i = 0; i < strHobbies.length; i++) {
						out.println(strHobbies[i] + " ");
					}
				}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="뒤로가기" onclick="history.back()">
			</td>
		</tr>
	</table>
</body>
</html>
















