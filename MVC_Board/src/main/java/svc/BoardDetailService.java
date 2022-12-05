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
		System.out.println(vo);
		
		if(vo != null ) {
			int updateCount = dao.updateReadcount(board_num);
			
			if(updateCount > 0) {
				JdbcUtil.commit(con);
				
				vo.setBoard_readcount(vo.getBoard_readcount()+1);
			}
		}
		JdbcUtil.close(con);
		return vo;
	}
}
