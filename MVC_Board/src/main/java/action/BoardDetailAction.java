package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		System.out.println("board_num : "+Integer.parseInt(request.getParameter("board_num"))+","+"pageNum : "+Integer.parseInt(request.getParameter("pageNum")));
		
		return forward;
	}

}
