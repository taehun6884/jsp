<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
// 		$("h3").css("color","green");
	
	
// 		$("h3:first").css("color","blue");
		
// 		alert($("h3").css("color"));
	
		let colorValue = ["red","green","blue"];
		let bgColorValue = ["cyan","skyblue","yellow"];
	
// 		$("h3").css("color", function(index) {
// 			alert(index + "번 h3 태그 접근!");
// 		});
		
		$("h3").css("color", function(index) {
			return colorValue[index];
		});
		
		$("h3").css("background", function(index) {
			return bgColorValue[index];
		});
	
		$("h3").css({
			color: function(index) {
				return colorValue[index];
			},
			
			background : function(index) {
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