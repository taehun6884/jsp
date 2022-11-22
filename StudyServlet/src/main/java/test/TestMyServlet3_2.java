package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8080/StudyServlet/XXX.test 주소 매핑하기 위한 @WebServlet 어노테이션 설정
// => 즉, 끝이 .test 로 끝나는 모든 주소가 공통으로 매핑됨
// => 이 때, 매핑 주소는 와일드카드(= 만능문자) * 와 조합(단, / 기호는 사용하지 않는다!)
@WebServlet("*.test")
public class TestMyServlet3_2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("TestMyServlet3_2 - doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("TestMyServlet3_2 - doPost()");
	}
	
}
