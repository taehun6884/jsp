package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null, pstmt2 = null;
	ResultSet rs = null;
	
	// 글쓰기 작업 수행(INSERT) insertBoard() 메서드 
	// => 파라미터 : BoardDTO 객체    리턴타입 : int(insertCount)
	public int insertBoard(BoardDTO board) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();

		try {
			// --------------------------------------------------------------------------------
			// 새 글 번호 계산을 위해 기존 board 테이블의 모든 번호(idx) 중 가장 큰 번호 조회
			// => 조회 결과 + 1 값을 새 글 번호로 지정하고, 조회 결과가 없으면 기본값 1 로 설정
			// => MySQL 구문의 MAX() 함수 사용(SELECT MAX(컬럼명) FROM 테이블명)
			int idx = 1; // 새 글 번호
			
			String sql = "SELECT MAX(idx) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 조회 결과가 있을 경우(= 기존 게시물이 하나라도 존재할 경우)
				// (만약, 게시물이 존재하지 않을 경우 DB 에서 NULL 로 표기, rs.next() 가 false)
				idx = rs.getInt(1) + 1; // 기존 게시물 번호 중 가장 큰 번호(= 조회 결과) + 1
			}
			System.out.println("새 글 번호 : " + idx);
			// --------------------------------------------------------------------------------
			// 게시물 등록(INSERT) 작업 수행
			sql = "INSERT INTO board VALUES (?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, idx); // 위에서 생성한 새 글 번호 활용
			pstmt2.setString(2, board.getName());
			pstmt2.setString(3, board.getPass());
			pstmt2.setString(4, board.getSubject());
			pstmt2.setString(5, board.getContent());
			
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertBoard()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 전체 게시물 수 조회 selectListCount()
	// => 파라미터 : 없음, 리턴타입 : int(listCount)
	public int selectListCount() {
		int listCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 특정 컬럼 또는 전체 컬럼(*)에 해당하는 레코드 수 조회하기 위해
			// MySQL 의 COUNT() 함수 활용(SELECT COUNT(컬럼명 또는 *) FROM 테이블명)
			String sql = "SELECT COUNT(idx) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectListCount()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return listCount;
	}
	
	// 게시물 목록 조회 selectBoardList()
	// => 파라미터 : 없음, 리턴타입 : List<BoardDTO>(boardList)
	// (단, 임시로 페이징 처리 없이 전체 목록 조회)
	public List<BoardDTO> selectBoardList() {
		List<BoardDTO> boardList = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// board 테이블의 모든 레코드 조회(idx 컬럼 기준 내림차순 정렬)
			String sql = "SELECT * FROM board ORDER BY idx DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 전체 레코드를 저장할 ArrayList 객체 생성
			boardList = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				// 1개 레코드를 저장할 BoardDTO 객체 생성
				BoardDTO board = new BoardDTO();
				board.setIdx(rs.getInt("idx"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getTimestamp("date"));
				board.setReadcount(rs.getInt("readcount"));
//				System.out.println(board);
				
				// 전체 레코드 저장하는 List 객체에 1개 레코드 저장된 BoardDTO 객체 추가
				boardList.add(board);
			}
//			System.out.println(boardList);
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectBoardList()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return boardList;
	}
	
	// 게시물 목록 조회 selectBoardList() - 게시물 목록 갯수 제한 추가
	// => 파라미터 : 시작행번호, 페이지 당 게시물 목록 수
	//    리턴타입 : List<BoardDTO>(boardList)
	public List<BoardDTO> selectBoardList(int startRow, int listLimit) {
		List<BoardDTO> boardList = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// board 테이블의 모든 레코드 조회
			// => idx 컬럼 기준 내림차순 정렬(ORDER BY 컬럼명 정렬방식)
			// => 시작행번호부터 게시물 목록 수 만큼으로 갯수 제한(LIMIT 시작행번호,목록수)
			//    (단, 시작행번호 첫번째는 0부터 시작)
			//    (또한, LIMIT 에 파라미터 하나만 사용 시 목록 갯수로 사용됨)
			String sql = "SELECT * FROM board ORDER BY idx DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);
			rs = pstmt.executeQuery();
			
			// 전체 레코드를 저장할 ArrayList 객체 생성
			boardList = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				// 1개 레코드를 저장할 BoardDTO 객체 생성
				BoardDTO board = new BoardDTO();
				board.setIdx(rs.getInt("idx"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getTimestamp("date"));
				board.setReadcount(rs.getInt("readcount"));
//				System.out.println(board);
				
				// 전체 레코드 저장하는 List 객체에 1개 레코드 저장된 BoardDTO 객체 추가
				boardList.add(board);
			}
//			System.out.println(boardList);
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectBoardList()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return boardList;
	}
	
	public BoardDTO selectBoard(int idx) {
		BoardDTO dto = null;
		con = JdbcUtil.getConnection();
		String sql = "SELECT * FROM board WHERE idx = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return dto;
	}
	
	public void updateReadcount(int idx) {
		con = JdbcUtil.getConnection();
		String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
		
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
	}
	
	public int updateBoard(BoardDTO dto) {
		int updateCount = 0;
		
		con = JdbcUtil.getConnection();
		
		String sql = "UPDATE board SET name=?,subject=?,content=? WHERE idx=? AND pass=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3,dto.getContent());
			pstmt.setInt(4, dto.getIdx());
			pstmt.setString(5,dto.getPass());
			updateCount = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return updateCount;
	}
}
















