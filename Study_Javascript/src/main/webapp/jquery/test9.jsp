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
		// each() 함수 : 대상에 대한 반복을 수행하는 함수
		// => 지정 가능한 대상 : 태그, 배열 등
		// => 기본 문법 : 대상.each(function(index, item) {});
		//                (index : 대상의 인덱스, item : 대상 요소)
		$("h3").each(function(index, item) {
// 			alert(index + " : " + item);
// 			alert(index + " : " + item.html()); // 오류 발생!
			// => 주의! item 값에는 hn 태그 객체가 저장되며
			//    jQuery 객체가 아니므로 html() 함수 등을 직접 호출 불가능!
			// => 대상을 선택자 형식으로 지정한 후 html() 함수 등을 연결
			
			// table 태그 내의 가장 마지막 요소로 인덱스 번호를 차례대로 추가(tr, td 태그 사용)
// 			$("table").append("<tr><td>" + index + "</td></tr>");
			// => 주의! 테이블이 복수개 존재할 경우 복수개의 테이블 모두 적용됨
			
			// table 태그 중 두번째 테이블 내의 가장 마지막 요소로 
			// 인덱스 번호와 h3 태그 내의 텍스트를 차례대로 추가(tr, td 태그 사용)
// 			$("table").eq(1).append("<tr><td>" + index + "</td><td>" + $(item).html() + "</td></tr>");
			
			// 배열을 활용할 경우
			let arr = [
				{no:"1번", name:"홍길동"},
				{no:"2번", name:"이순신"},
				{no:"3번", name:"강감찬"}
			];
			
			// => 지정할 선택자가 없으므로 $.each() 함수 형태로 호출한 후
			//    파라미터를 배열, 함수 형태로 지정
			$.each(arr, function(index, item) {
				alert(item);
				// 배열 내의 요소가 객체이므로 객체명을 통해 값에 접근 가능
				// => 중괄호{} 로 묶인 객체는 자동으로 반복됨(인덱스가 index 에 전달됨)
				$("table").eq(1).append("<tr><td>" + item.no + "</td><td>" + item.name + "</td></tr>");
			});
			
		});
	});
</script>
</head>
<body>
	<h1>jQuery - test9.jsp</h1>
	<h3>item-0</h3>
	<h3>item-1</h3>
	<h3>item-2</h3>
	<div></div>
	<table border="1">
		<tr><td>번호</td></tr>
	</table>
	<table border="1">
		<tr><td>번호</td><td>항목</td></tr>
	</table>
</body>
</html>












