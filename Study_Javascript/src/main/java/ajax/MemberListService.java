package ajax;

import java.sql.Connection;
import java.util.List;

public class MemberListService {

	public List<MemberBean> getMemberList() {
		List<MemberBean> memberlist = null;
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		memberlist = dao.selectMemberList();
		
		JdbcUtil.close(con);
		
		return memberlist;
	}
}
