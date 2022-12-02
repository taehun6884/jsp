package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BoardListAction");
		
		ActionForward forward = null;
		
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int pageNum = 1; // 현재 페이지 번호 설정(pageNum 파라미터 사용)
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		int startRow = (pageNum - 1) * listLimit;

		// ---------------------------------------------------------
		// 검색 후 목록 표시 기능과 일반 목록 표시 기능 통합
		// 파라미터로 전달받은 검색어(keyword) 가져와서 변수에 저장
		String keyword = request.getParameter("keyword");

		// 만약, 전달받은 검색어가 null 이면 널스트링으로 변경(일반 목록일 경우 전체 검색 수행)
		if(keyword == null) {
			keyword = "";
		}
		
		BoardListService service = new BoardListService();
		List<BoardBean> boardlist = service.getBoardList(keyword,startRow,listLimit);
		System.out.println(boardlist);
		
		int listCount = service.getBoardListCount(keyword);
		
		int pageListLimit = 10; // 한 페이지에서 표시할 페이지 목록을 3개로 제한
		
		int maxPage = listCount / listLimit 
						+ (listCount % listLimit == 0 ? 0 : 1); 
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageinfo = new PageInfo(listCount,pageListLimit,maxPage,startPage,endPage);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("pageInfo", pageinfo);
		
		if(boardlist == null) { 
			
		} else { 
			forward = new ActionForward();
			forward.setPath("board/qna_board_list.jsp");
			forward.setRedirect(false);
		}
		
		
		
		return forward;
	}

}















