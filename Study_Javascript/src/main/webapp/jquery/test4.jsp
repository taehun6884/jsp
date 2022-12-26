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
// 		alert($("h3").html());
// 		alert($("#h3_2").html());
// 		$("#h3_1").html("<i>italic 적용된 제목1</i>");
	 	$("#h3_1").text("<i>italic 적용된 제목1</i>");
	
		$("h3").html(function(index,oldHtml){
			return oldHtml + "입니다.";
		});
	
// 		$("#h3_2").empty();	
		$("#h3_2").remove();	
	});
	
	

</script>
</head>
<body>
	<h1>jQuery - test4.jsp</h1>
	<div id="wrap">
		<!-- 제목 표시 공간 -->
		<h3 id="h3_1">제목1</h3>
		<h3 id="h3_2">제목2&nbsp;<span>제목2-1</span>&nbsp;<span>제목2-2</span></h3>
		<h3 id="h3_3">제목3</h3>
	</div>
	<textarea rows="5" cols="50"></textarea>
</body>
</html>











