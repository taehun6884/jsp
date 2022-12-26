<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("h3").each(function(index,item){
			alert(index+ ":" + item.html());
			$("table").append("<tr><td>"+index+"</td><tr>");
// 			$("table").eq(1).append("<tr><td>"+index+"</td><td>"+"<td><td>"+$(item).html()+"</td><tr>");
			let arr = [
				{no:"1번",name:"홍길동"},				
				{no:"2번",name:"이순신"},				
				{no:"3번",name:"강감찬"}				
			];
			$.each(arr,function(index,item){
				$("table").eq(1).append("<tr><td>"+index.no+"</td><td>"+"<td><td>"+iten.name+"</td><tr>");
			});
		});
	});
</script>
</head>
<body>
	<h1>jQuery - test9.jso</h1>
	<h3>item-0</h3>
	<h3>item-1</h3>
	<h3>item-2</h3>
	<div></div>
	<table border="1">
		<tr>
			<td>번호</td><td>항목</td>
		</tr>
	</table>
	<!-- kit  -->	
</body>
</html>