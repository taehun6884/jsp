<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		// css() 함수
		// - 파라미터로 속성명 지정 시 해당 CSS 속성값 리턴
		//   => 이 때, 대상이 복수개일 경우 첫번째 요소의 값만 리턴
		// - 속성명과 속성값을 함께 지정 시 해당 CSS 속성값 변경
		//   => 이 때, 대상이 복수개일 경우 복수개의 요소에 모두 적용
		
		// h3 태그의 "color" 속성값 출력
// 		alert($("h3").css("color")); // rgb(0, 0, 0)
		
		// h3 태그의 "color" 속성값을 "green" 으로 변경
		$("h3").css("color", "green");
		
		// h3 태그 중 첫번째 요소의 "color" 속성값을 "blue" 로 변경
		$("h3:first").css("color", "blue");
		
// 		alert($("h3").css("color")); // rgb(0, 0, 255) 만 출력됨
		// 첫번째 h3 태그에 접근하여 값을 리턴한 후 끝
		
		// css() 함수(다른 함수도 가능)내에서 익명함수 구현 시
		// 대상 태그를 차례대로 접근하는 반복문 형태로 사용 가능함
		// css("속성명", function(index, value) {})
		// => 대상 태그를 차례대로 접근하면서 해당 요소의 인덱스와 값이 파라미터로 자동 전달됨
		//    (이 때, 작업은 반복문 형태로 처리됨)
		// 1) 파라미터가 없는 익명함수 구현 시 => 해당 태그 횟수만큼 반복만 수행함
// 		$("h3").css("color", function() {
// 			alert("h3 태그 접근!"); // 3번 호출됨
// 		});
		
		// 2) 파라미터가 1개인 익명함수 구현 시 => 파라미터로 인덱스가 전달됨(태그 순서 번호)
// 		$("h3").css("color", function(index) {
// 			// => 0번부터 차례대로 인덱스값이 index 변수에 전달됨(자동)
// 			alert(index + "번 h3 태그 접근!"); // 3번 호출됨
// 		});
		
		// 3) 파라미터가 2개인 익명함수 구현 시 => 파라미터로 인덱스와 요소의 값 전달됨
// 		$("h3").css("color", function(index, value) {
// 			// => 0번부터 차례대로 인덱스값이 index 변수에 전달되며
// 			//    해당 인덱스의 요소 값이 전달됨
// 			alert(index + "번 h3 태그 접근! - " + value); // 3번 호출됨
// 		});
		
		// ---------------------------------------------------------------
		// 배열을 활용하여 대상 태그 color 속성값을 차례대로 한꺼번에 변경
		// => 대상 값 변경을 위해서는 return 문을 통해 변경할 값을 리턴
		let colorValue = ["red", "green", "blue"];
		let bgColorValue = ["cyan", "skyblue", "yellow"];
		
// 		$("h3").css("color", function(index) {
// // 			return "red"; // 모든 h3 태그 요소 글자색이 red 로 변경됨

// 			// 함수 파라미터로 전달받는 index 값을 배열 인덱스로 활용
// 			return colorValue[index];
// 		});
		
// 		$("h3").css("background", function(index) {
// 			// 함수 파라미터로 전달받는 index 값을 배열 인덱스로 활용
// 			return bgColorValue[index];
// 		});
		
		// 동일한 대상에 복수개의 속성을 반복문 형태로 변경하는 경우
		// $("선택자").css({속성1:함수(index){}, 속성2:함수(index){}})
		$("h3").css({
			color: function(index) {
				return colorValue[index];
			},
			background: function(index) {
				return bgColorValue[index];
			}
		});
	});
	
</script>
</head>
<body>
	<h1>jQuery - test3.jsp</h1>
	<h3>제목1</h3>
	<h3>제목2</h3>
	<h3>제목3</h3>
</body>
</html>











