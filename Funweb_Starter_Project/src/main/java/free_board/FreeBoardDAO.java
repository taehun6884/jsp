package free_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.BoardDTO;
import board.FileBoardDTO;
import db.JdbcUtil;

public class FreeBoardDAO {
	Connection con;
	PreparedStatement pstmt,pstmt2;
	ResultSet rs;
	
	public int insertFreeBoard(FreeBoardDTO dto) {
		int insertCount = 0;
		
		int idx =1;
		String sql = "SELECT MAX(idx) FROM free_board";
		
		con = JdbcUtil.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idx = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO free_board VALUES(?,?,?,?,?,now(),0)";
			
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, idx);
			pstmt2.setString(2, dto.getName());
			pstmt2.setString(3, dto.getPass());
			pstmt2.setString(4, dto.getSubject());
			pstmt2.setString(5, dto.getContent());
			insertCount = pstmt2.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insertCount;
	}
	
	public List<FreeBoardDTO> selectFreeBoard(int startRow,int listLimit,String keyword){
		List<FreeBoardDTO> list = null;
		FreeBoardDTO dto = null;
		
		con = JdbcUtil.getConnection();
		
		String sql = "SELECT * FROM free_board WHERE subject LIKE ? LIMIT ?,?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+ keyword +"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			
			list = new ArrayList<FreeBoardDTO>();
			while(rs.next()) {
				dto = new FreeBoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
				list.add(dto);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public int selectListCount() {
		int listCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			// ?????? ?????? ?????? ?????? ??????(*)??? ???????????? ????????? ??? ???????????? ??????
			// MySQL ??? COUNT() ?????? ??????(SELECT COUNT(????????? ?????? *) FROM ????????????)
			String sql = "SELECT COUNT(idx) FROM free_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL ?????? ??????! - selectListCount()");
			e.printStackTrace();
		} finally {
			// ?????? ??????
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return listCount;
	}
	
	public FreeBoardDTO ListFreeBoardInfo(int idx) {
		FreeBoardDTO dto = null;
		
		String sql ="SELECT * FROM free_board WHERE idx=?";
		
		con = JdbcUtil.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new FreeBoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int updateBoard(FreeBoardDTO board) {
		int updateCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			// board ??????????????? ?????????(idx)??? ???????????? ???????????? ??????????????? ????????????
			// ??????????????? ????????? ?????? ??????, ??????, ?????? ??????(???????????? ?????????????????? ?????? ??????)
			// => ???????????? ??????????????? ???????????? ???????????? ?????? ???????????? ??????
			String sql = "UPDATE free_board "
							+ "SET name=?, subject=?, content=? "
							+ "WHERE idx=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getIdx());
			pstmt.setString(5, board.getPass());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL ?????? ??????! - updateBoard()");
			e.printStackTrace();
		} finally {
			// ?????? ??????
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return updateCount;
	}
	
	public int deleteFreeBoard(FreeBoardDTO dto) {
		int deleteCount = 0;
		
		String sql = "DELETE from free_board WHERE pass=?";
		
		con = JdbcUtil.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deleteCount;
	}
}
