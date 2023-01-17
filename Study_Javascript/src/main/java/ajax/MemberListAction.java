package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("sId") == null || !session.getAttribute("sId").equals("admin") ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('잘못된 접근!')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			MemberListService service = new MemberListService();
			List<MemberBean> memberlist = service.getMemberList();
			request.setAttribute("memberlist", memberlist);
			forward = new ActionForward();
			forward.setPath("member/member_admin_main.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
