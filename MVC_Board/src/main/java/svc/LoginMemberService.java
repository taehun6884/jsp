package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;

public class LoginMemberService {

	public int isRightUser(String id, String pass) {
		int isRightUser = 0;
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		isRightUser = dao.isRightUser(id,pass);
		
		JdbcUtil.close(con);
		
		return isRightUser;
	}
	
}
