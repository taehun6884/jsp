package ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.me")
public class MemberController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MemberController()");
		
		String command = request.getServletPath();
		System.out.println("현재 주소 :"+command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/MemberInsertForm.me")) {
			forward = new ActionForward();
			forward.setPath("ajax/test2_join.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberJoinPro.me")) {
			action = new MemberInsertProAction();
			forward = action.execute(request, response);
		}else if(command.equals("/LoginMember.me")) {
			forward = new ActionForward();
			forward.setPath("member/member_login_form_sample.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberCheckId.me")) {
			action = new MemberCheckIdAction();
			forward = action.execute(request, response);
		}else if(command.equals("json/MemberJSONList.me")) {
			action = new MemberJSONListAction();
			forward = action.execute(request, response);
		}
			
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

