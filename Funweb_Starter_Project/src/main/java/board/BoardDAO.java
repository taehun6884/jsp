package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BoardDAO {

	public int insertBoard(BoardDTO dto) {
		int insertCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		String sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(7, dto.getReadcount());
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return insertCount;
	}
	
}
