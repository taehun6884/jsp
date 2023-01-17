package ajax;

import java.sql.Connection;

public class MemberCheckIdService {

	public boolean isExists(String id) {
		boolean result = false;
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		boolean isExist = dao.selectId(id);
		
		if(isExist) {
			JdbcUtil.commit(con);
			result = true;
		}else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		return result; 
	}

}
