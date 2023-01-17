package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberCheckIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		
		MemberCheckIdService service = new MemberCheckIdService();
		boolean isExist = service.isExists(id);
		
		if(!isExist) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}
}
