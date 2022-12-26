<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
// 	window.onload = function() {
// 		alert('1번 - window.onload');
// 	}
	
// 	$(window).on("load",function(){
// 		alert("2번 - $(window).on('load')");
// 	});
// --------------------------------------------------
// 1) 첫번쨰 ready 이벤트 처리 문법

// 2) 첫번쨰 ready 이벤트 처리 문법
	jQuery(document).ready(function() {
		alert("Ready 이벤트 처리 문법 - 1");	
	});
	
	
	$(document).ready(function(){
// 		alert("3번 - $(window).ready()");
		alert("Ready 이벤트 처리 문법 - 2");
	});
	
	$(document).ready(function(){
// 		alert("3번 - $(window).ready()");
		alert("Ready 이벤트 처리 문법 - 3");
	});
	
	$(function() {
		alert("3번 - $(window).ready()");
		alert("Ready 이벤트 처리 문법 - 4");
	});
</script>
</head>
<body>
	<h1>jQuery - test1.jsp</h1>
	<img src="1.jpg" width="300" height="300">
</body>
</html>