package svc;

import java.sql.Connection;
import java.util.List;

import dao.BoardDAO;
import db.JdbcUtil;
import vo.BoardBean;

public class BoardListService {

	public List<BoardBean> getBoardList(String keyword, int startRow, int listLimit) {
		List<BoardBean> boardlist = null;
		
		Connection con = JdbcUtil.getConnection();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.setConnection(con);
		
		boardlist = dao.selectBoardList(keyword,startRow,listLimit);
		
		JdbcUtil.close(con);
		return boardlist;
	}

	public int getBoardListCount(String keyword) {
		int listCount = 0;
		
		Connection con = JdbcUtil.getConnection();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.setConnection(con);
		
		listCount = dao.selectListCount(keyword);
		
		System.out.println("ListCount : "+listCount);
		
		JdbcUtil.close(con);
		
		return listCount;
	}
	
}
