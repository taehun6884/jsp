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
	DOM 객체를 탐색 및 접근하여 대상을 조작하는 방법
	- 태그의 자바스크립트 이벤트와 동일함(on'click' 등)
	
	1. on("click") 함수
	- 특정 대상을 "클릭" 시 동작하는 이벤트 처리(click() 함수와 동일)
	- 클릭 대상에 대한 제한 없음(버튼 외에 다른 요소 가능)
	
	2. on("focus") 함수 또는 on("blur")
	- 특정 대상에 포커스가 주어지거나 해제 시 동작하는 이벤트 처리
	- focus(), blur() 함수와 동일
	- 클릭이 아닌 키보드 등을 통한 포커스 이동도 동일
	*/
	$(function() {
		// 버튼 클릭 시 클릭된 버튼의 value 값 가져와서 출력하기
		// => 버튼 지정 시 "input[type=button]" 선택자 대신 가상선택자 ":button" 사용 가능
// 		$(":button").on("click", function() { // 버튼들 중 아무거나 클릭 시 익명 함수 실행됨
// // 			alert($(":button:focus").val() + " 버튼 클릭!");
// 			if($(":button:focus").val() == "확인") {
// 				alert("확인!");
// 			} else {
// 				alert("취소!");
// 			}
// 		});
		
		// 첫번째 버튼이 클릭되면 익명 함수 실행
		$(":button").eq(0).on("click", function() {
			// 입력받은 아이디, 패스워드와 선택된 과목명을 textarea 에 출력
			$("#resultArea").html(
				"아이디 : " + $("input[name=id]").val() + "\n"
				+ "패스워드 : " + $("input[name=passwd]").val() + "\n"
				+ "선택과목 : " + $("#selectBox").val() + "\n" // 셀렉트박스의 값을 가져오거나
				+ "선택과목 : " + $("#selectBox > option:selected").val() // 옵션 중 선택된 요소의 값을 가져오기
			);
		});
		
// 		$("textarea").on("click", function() {
// 			alert("textarea 클릭!");
// 		});
		
		$("#clickDiv").on("click", function() {
			alert("div 영역 클릭!");
		});
		
		$("#resultArea").on("focus", function() {
			$("#resultArea").html("textarea focus in");
		});
		
		$("#resultArea").on("blur", function() {
			$("#resultArea").html("textarea focus out");
		});
		
	});
</script>
</head>
<body>
	<h1>jQuery - test8.jsp</h1>
	<div id="wrap">
		<div id="inputBox">
			아이디 : <input type="text" name="id"><br>
			패스워드 : <input type="password" name="passwd"><br>
			<select id="selectBox" name="subject">
				<option value="">선택하세요</option>
				<option value="자바">자바</option>
				<option value="JSP">JSP</option>
				<option value="스프링">스프링</option>
			</select>
		</div>
		<textarea id="resultArea" rows="5" cols="20"></textarea>
		<br>
		<input type="button" value="확인">&nbsp;&nbsp;&nbsp;
		<input type="button" value="취소">
	</div>
	<br>
	---------------
	<div id="clickDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	---------------
</body>
</html>












