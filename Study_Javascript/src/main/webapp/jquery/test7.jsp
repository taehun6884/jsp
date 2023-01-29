<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	/*
	submit()
	- submit 동작에 대한 이벤트 처리 가능
	- 자바스크립트에서의 기본적인 처리 방법과 동일
	*/
	$(function() {
		// form 태그에 submit 동작 발생 시 이벤트 처리할 경우
		$("form").submit(function() {
			// #selectBox 선택자의 자식 option 요소들 중
			// 첫번째 option 태그의 selected 속성값 출력
// 			alert($("#selectBox > option").eq(0).prop("selected"));
			
			// 만약, 첫번째 option 태그의 selected 속성 상태가 true 일 경우
			// => "항목 선택 필수!" 출력 후 폼 전송 취소하고
			//    아니면, 폼 전송 수행
			if($("#selectBox > option").eq(0).prop("selected")) {
				alert("항목 선택 필수!");
				return false; // 폼 전송 취소
			} else {
				return true; // 폼 전송 수행
			}
			
		});
	});
</script>
</head>
<body>
	<h1>jQuery - test7.jsp</h1>
	<div id="wrap">
		<form action="test7_result.jsp">
			<div id="inputBox">
				아이디 : <input type="text" name="id"><br>
				패스워드 : <input type="password" name="passwd">
			</div>
			<select id="selectBox" name="subject">
				<option value="">선택하세요</option>
				<option value="자바">자바</option>
				<option value="JSP">JSP</option>
				<option value="스프링">스프링</option>
			</select>
			<br>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>













