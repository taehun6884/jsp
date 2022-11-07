package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileBoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null,pstmt2=null;
	ResultSet rs = null;
	
	public int insertFileBoard(FileBoardDTO dto) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		
		try {
			int idx = 1;
			String sql ="SELECT MAX(idx) from file_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = rs.getInt(1)+1;
			}
			
			sql = "INSERT INTO file_board VALUES (?,?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1,idx);
			pstmt2.setString(2, dto.getName());
			pstmt2.setString(3, dto.getSubject());
			pstmt2.setString(4, dto.getContent());
			pstmt2.setString(5, dto.getOriginal_file());
			pstmt2.setString(6, dto.getReal_file());
	
			
			insertCount = pstmt2.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertCount;
	}
}
