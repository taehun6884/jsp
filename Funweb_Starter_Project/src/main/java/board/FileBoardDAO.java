package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileBoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int insertFileBoard() {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		String sql = "INSERT INTO file_board VALUES (?,?,?,?,?,?,now(),0)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, );
			
			
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertCount;
	}
}
