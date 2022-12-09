package svc;

import java.sql.Connection;
import java.util.List;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberListService {

	public List<MemberBean> getMemberList() {
		List<MemberBean> memberlist = null;
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		memberlist = dao.selectMemberList();
		
		
		
		return memberlist;
	}

}
