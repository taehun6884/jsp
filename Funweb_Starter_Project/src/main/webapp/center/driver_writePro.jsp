<%@page import="board.FileBoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.FileBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//request.setCharacterEncoding("UTF-8");

//out.println(request.getParameter("name"));


String uploadPath = "/upload";

int fileSize = 10 * 1024 * 1024;

ServletContext context = request.getServletContext();

String realPath = context.getRealPath(uploadPath);
out.println(realPath+"<br>");

MultipartRequest multi = new MultipartRequest(
			request,
			realPath,
			fileSize,
			"UTF-8",
			new DefaultFileRenamePolicy()
		); 

FileBoardDTO dto = new FileBoardDTO();

dto.setName(multi.getParameter("name"));
dto.setPass(multi.getParameter("pass"));
dto.setSubject(multi.getParameter("subject"));
dto.setContent(multi.getParameter("content"));

String fileElement = multi.getFileNames().nextElement().toString();
out.println(fileElement);

dto.setOriginal_file(multi.getOriginalFileName(fileElement));
dto.setReal_file(multi.getFilesystemName(fileElement));

out.println("원본 파일명 :"+ dto.getOriginal_file() +", : 실제 파일명 : "+ dto.getReal_file());

 out.print(dto);

 FileBoardDAO dao = new FileBoardDAO();
	
 
%> 

 
 <% 
 if(insertCount > 0) {
		response.sendRedirect("driver.jsp");
	} else {
		%>
		<script>
			alert("글쓰기 실패!");
			history.back();
		</script>
		<%
	}

	%>

 
 





