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
	특정 요소에 대한 조작 이벤트 - 2
	1. append()
	   - 지정한 내용을 선택자 내부의 '마지막'에 추가
	   - appendTo() 함수와 문장 구조의 차이를 제외하면 기능은 동일함
	   - $('선택자').append('추가할내용');
	     $('추가할내용').appendTo('선택자');
	2. prepend()
	   - 지정한 내용을 선택자 내부의 '처음'에 추가
	   - prependTo() 함수와 문장 구조의 차이를 제외하면 기능은 동일함
	   - $('선택자').prepend('추가할내용');
	     $('추가할내용').prependTo('선택자');
	3. after()
	   - 지정한 내용을 선택자 요소 '뒤'에 삽입
	   - insertAfter() 함수와 문장 구조의 차이를 제외하면 기능은 동일함
	   - $('선택자').after('삽입할내용');
	     $('삽입할내용').insertAfter('선택자');
	4. before()
	   - 지정한 내용을 선택자 요소 '앞'에 삽입
	   - insertBefore() 함수와 문장 구조의 차이를 제외하면 기능은 동일함
	   - $('선택자').before('삽입할내용');
	     $('삽입할내용').insertBefore('선택자');
	*/
	$(function() {
// 		$("#wrap_append").append("<div>append() 로 삽입한 div 태그</div>");
		$("<div>appendTo() 로 삽입한 div 태그</div>").appendTo("#wrap_append");
// 		$("#wrap_prepend").prepend("<div>prepend() 로 삽입한 div 태그</div>");
		$("<div>prependTo() 로 삽입한 div 태그</div>").prependTo("#wrap_prepend");
		
// 		$("#wrap_after").after("<div>after() 로 삽입한 div 태그</div>");
		$("<div>insertAfter() 로 삽입한 div 태그</div>").insertAfter("#wrap_after");
// 		$("#wrap_before").before("<div>before() 로 삽입한 div 태그</div>");
		$("<div>insertBefore() 로 삽입한 div 태그</div>").insertBefore("#wrap_before");
		
	});
</script>
</head>
<body>
	<h1>JQuery - test5.jsp</h1>
	<div id="wrap">
		<div id="wrap_append">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>	
			<!-- append() 함수에 의해 요소가 삽입될 위치 -->	
		</div>
		<hr>
		<div id="wrap_prepend">
			<!-- prepend() 함수에 의해 요소가 삽입될 위치 -->	
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
		<hr>
		<div id="wrap_after">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
		<hr>
		<div id="wrap_before">
			<div>
				<div>div 태그1</div>
				<div>div 태그2</div>
			</div>		
		</div>
	</div>	
	<!-- 결과 확인을 위한 태그 출력용 textarea -->
	<textarea id="ta" rows="20" cols="100"></textarea>
</body>
</html>