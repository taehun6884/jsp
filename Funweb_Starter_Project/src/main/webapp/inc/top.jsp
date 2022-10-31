<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
  <!-- login join -->
  <%
  	String sid = (String)session.getAttribute("sId");
  	
  	if(sid == null){
  %>
  <div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
  <%}else{ %>
  <div id="login"><a href="../member/member_info.jsp?id=<%=sid %>"><%=sid %></a> | <a href="../member/logout.jsp">로그아웃</a>
  <%if(sid.equals("admin")){ %>
  |<a href="../admin/admin_main.jsp">관리자 페이지</a></div>
  <%
  	}
  }
  %>
 
  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><img src="../images/logo.gif"></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
  	<ul>
  		<li><a href="../main/main.jsp">HOME</a></li>
  		<li><a href="../company/welcome.jsp">COMPANY</a></li>
  		<li><a href="../company/welcome.jsp">SOLUTIONS</a></li>
  		<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
  		<li><a href="../mail/mailForm.jsp">CONTACT US</a></li>
  	</ul>
  </nav>
</header>