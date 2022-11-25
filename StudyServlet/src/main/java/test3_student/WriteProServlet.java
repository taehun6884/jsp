package test3_student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3_student/WritePro")
public class WriteProServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("WriteProServlet - doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// writeForm.jsp 페이지 form 태그 method="post" 이므로 POST 방식 요청 발생! 
		System.out.println("WriteProServlet - doPost()");
		
		// writeForm.jsp 페이지에서 전달받은 파라미터(번호, 이름) 가져와서 출력
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		System.out.println("번호 : " + idx);
		System.out.println("이름 : " + name);
		
		// 글쓰기 완료했다고 가정 후 글목록 표시를 위해 List 서블릿 주소 요청
		// => 기존의 WritePro 서블릿 주소 대신 새 요청 주소인 List 로 변경
		// => 이 때, 이전 request 객체 유지가 불필요하며, 주소도 변경됨
		//    (= 기존 유지 유지 X, 기존 데이터 유지 X)
		// => 따라서, Redirect 방식 포워딩 사용
		response.sendRedirect("List");
		// Redirect 방식 포워딩 결과
		// 기존 요청 주소 - http://localhost:8080/StudyServlet/test3_student/WritePro
		// 새 요청 주소   - http://localhost:8080/StudyServlet/test3_student/List(표시됨)
	}

}












