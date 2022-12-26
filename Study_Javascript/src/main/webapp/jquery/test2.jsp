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
	선택자(Selector)
	- 문서 객체 내의 요소 선택을 위한 용도로 사용하는 구성 요소
	- 자바스크립트에서 사용하는 document.getElementByXXX("선택자명") 메서드 호출과 달리
	  jQuery 에서는 $("선택자") 형태로 대상을 지정하므로 문장이 간결해짐
	
	< 선택자 사용 기분 문법 >
	$("선택자" 또는 *).함수명("속성명", "속성값");
	
	ex) 지정한 요소에 대한 CSS 속성 변경하는 기본 문법
	$("선택자").css("속성명", "속성값");
	-----------------------------------------------------------------------------------
	1. 직접 선택자 - 특정 대상(요소)을 직접 지정하기 위한 선택자
	   1) 아이디(#) - 페이지 내에서 유일한 요소 => $("#선택자명")
	   2) 클래스(.) - 복수개의 동일한 요소 => $(".선택자명")
	   3) 태그 - 동일한 태그를 갖는 복수개의 요소 => $("태그명")
	   4) 태그 속성 - 동일한 태그들 중 특정 속성만 지정 => $("태그명[속성명]")
	   5) 태그 속성 값 - 동일한 태그의 동일한 속성들 중 특정 속성값 지정 => $("태그명[속성명=값]")
	*/
	// ready 이벤트를 정의하여 문서 내의 선택자 요소에 접근
// 	$(document).ready(function() {
// 		alert("ready 이벤트");
// 	});
    
	$(function() {
// 		alert("ready 이벤트2");
		$("*").css("color","red");	
		
		$("#idSelector").css("color","blue");
		
// 		alert($("#idSelector").css("color"));
		
		$(".classSelector").css("color","orange"); 
		
		let color = $(".classSelector").css("color");
		
// 		alert(color);
		
// 		$("table").css("border","1px solid blue").css("background", "pink");
		
		$("table").css({
			border: "1px solid blue",
			background: "lightgray"
		});
		
		$("input[type=text]").css("background","yellow");
	});
	
	
	$(document).ready(function() {
		$("table tr:first").css("background","green");
		
		$("tr:odd").css("background","pink");
		$("tr:even").css("background","yellow");
		
		let id = $("#inputBox > input[type=text]").val();
		let passwd = $("#inputBox > input[type=password]").val();
			
		alert("아이디 :"+id + ", 패스워드 : "+passwd);
	
		$("#inputBox textarea[readonly]").css("background","lightgray");
		
// 		$("#divBox div").css("color","blue");
 		$("#divBox > div").css("color","blue");
 		
 		let selectedItem = $("#selectBox > option:selected").val();
 		$("#selectResult").val(selectedItem);
 		
	
		
	});
	
</script>
</head>
<body>
	<h1>jQuery - test2.jsp</h1>
	<hr>
	<h3 id="idSelector">id 선택자</h3>
	<h3 class="classSelector">class 선택자</h3>
	<h3 class="classSelector">class 선택자2</h3>
	<hr>
	<table border="1">
		<tr><td>번호</td><td>제목</td></tr>
		<tr><td>1</td><td>1번제목</td></tr>
		<tr><td>2</td><td>2번제목</td></tr>
		<tr><td>3</td><td>3번제목</td></tr>
		<tr><td>4</td><td>4번제목</td></tr>
	</table>
	<hr>
	<div id="inputBox">
		<input type="text" value="admin">
		<input type="password" value="1234"><br>
		<textarea rows="5" cols="20" readonly="readonly"></textarea>
		<textarea rows="5" cols="20" id="inputData"></textarea>
	</div>
	<hr>
	<div id="divBox">
		<div>
			1번 div 태그
			<div>1-1번 div 태그</div>
			<div>1-2번 div 태그</div>
		</div>
		<span>span 태그</span>
		<div>2번 div 태그</div>
		<div>
			3번 div 태그
			<div>3-1번 div 태그</div>
			<div>3-2번 div 태그</div>
		</div>
	</div>
	<hr>
	<select id="selectBox">
		<option value="JAVA">JAVA</option>
		<option value="JSP">JSP</option>
		<option value="Spring Framework">Spring Framework</option>
	</select>
	<input type="text" id="selectResult">
</body>
</html>











