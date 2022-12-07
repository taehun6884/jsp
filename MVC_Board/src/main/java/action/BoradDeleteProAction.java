package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoradDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String board_pass = request.getParameter("board_pass");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		
		System.out.println(board_pass+","+board_num);
		
		BoardDetailService service2 = new BoardDetailService();
		BoardBean board = service2.getBoard(board_num, false);
		
		BoardDeleteProService service = new BoardDeleteProService();
		boolean result = service.isBoardWriter(board_pass,board_num);
		System.out.println(result);
		
		
		if(result == false) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out =	response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			String uploadPath = "upload"; 
			String realPath = request.getServletContext().getRealPath(uploadPath);
			
			File f = new File(realPath,board.getBoard_real_file());
			if(f.exists()) {
				f.delete();
			}
			
			forward = new ActionForward();
			forward.setPath("BoardList.bo?pageNum="+request.getParameter("pageNum"));
			forward.setRedirect(true);
		}
		return forward;
	}

}
