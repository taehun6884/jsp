package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberInsertProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("MemberInsertProAction()");
		ActionForward forward = null;
		
		MemberBean vo = new MemberBean();
		vo.setId(request.getParameter("id"));
		vo.setPasswd(request.getParameter("passwd"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email1")+"@"+request.getParameter("email2"));
		vo.setGender(request.getParameter("gender"));
		
		System.out.println(vo);
		MemberInsertProService service = new MemberInsertProService();
		
		boolean isInsertSucess = service.InsertMember(vo);
		
		
		if(!isInsertSucess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			forward = new ActionForward();
			forward.setPath("member/member_join_result_sample.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
