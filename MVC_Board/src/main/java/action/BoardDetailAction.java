package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		System.out.println("board_num : "+Integer.parseInt(request.getParameter("board_num"))+","+"pageNum : "+Integer.parseInt(request.getParameter("pageNum")));
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDetailService service = new BoardDetailService();
		
		BoardBean vo = service.getBoard(board_num);
		request.setAttribute("board", vo);
		
		if(vo == null) {
			
		}else {
			forward = new ActionForward();
			forward.setPath("board/qna_board_view.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
