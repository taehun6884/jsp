package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	public int insert(MemberDTO dto ){
		int insertCount = 0;
		PreparedStatement pstmt;
		Connection con;
		
		con = JdbcUtil.getConnection();
		
		String sql = "INSERT INTO member values(?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPost_code());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getPhone());
			pstmt.setString(9, dto.getMobile());
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("sql문장오류");
			e.printStackTrace();
		}
		return insertCount;
	}
	
	public boolean login(String id,String pass) {
		boolean result = false;
		PreparedStatement pstmt;
		Connection con;
		ResultSet rs;
		
		con = JdbcUtil.getConnection();
		
		String sql = "SELECT * from member where id=? AND pass=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
