package svc;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDAO;
import db.JdbcUtil;
import vo.BoardBean;

public class BoardDetailService {

	public BoardBean getBoard(int board_num) {
		Connection con = null;
		BoardBean vo = null;
		
		con = JdbcUtil.getConnection();
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.setConnection(con);
		
		vo = dao.getBoard(board_num);
		
		
		if(vo != null ) {
			dao.updateReadcount(board_num);
			JdbcUtil.commit(con);
		}else {
			JdbcUtil.rollback(con);
		}
		JdbcUtil.close(con);
		return vo;
	}

//	public void updateReadcount(int board_num) {
//		Connection con = null;
//		
//		con = JdbcUtil.getConnection();
//		
//		BoardDAO dao = BoardDAO.getInstance();
//		
//		dao.setConnection(con);
//		
//		dao.updateReadcount(board_num);
//		
//		JdbcUtil.close(con);
//		
//	}

}
