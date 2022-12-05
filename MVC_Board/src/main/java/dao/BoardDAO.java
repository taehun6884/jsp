package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.BoardBean;

// 실제 비즈니스 로직을 수행하는 BoardDAO 클래스 정의
// => 각 Service 클래스 인스턴스에서 BoardDAO 인스턴스에 접근 시 고유 데이터가 불필요하므로
//    BoardDAO 인스턴스는 애플리케이션에서 단 하나만 생성하여 공유해도 된다!
//    따라서, 싱글톤 디자인 패턴을 적용하여 클래스를 정의하면 메모리 낭비를 막을 수 있다!
public class BoardDAO {
	// ------------ 싱글톤 디자인 패턴을 활용한 BoardDAO 인스턴스 생성 작업 -------------
	// 1. 외부에서 인스턴스 생성이 불가능하도록 생성자를 private 접근제한자로 선언
	// 2. 자신의 클래스 내에서 직접 인스턴스를 생성하여 멤버변수에 저장
	//    => 인스턴스 생성없이 클래스가 메모리에 로딩될 때 함께 로딩되도록 static 변수로 선언
	//    => 외부에서 접근하여 함부로 값을 변경할 수 없도록 private 접근제한자로 선언
	// 3. 생성된 인스턴스를 외부로 리턴하는 Getter 메서드 정의
	//    => 인스턴스 생성없이 클래스가 메모리에 로딩될 때 함께 로딩되도록 static 메서드로 선언
	//    => 누구나 접근 가능하도록 public 접근제한자로 선언
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 데이터베이스 접근에 사용할 Connection 객체를 Service 객체로부터 전달받기 위한
	// Connection 타입 멤버변수 선언 및 Setter 메서드 정의
	private Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}
	// ----------------------------------------------------------------------------------
	
	
	public int insertBoard(BoardBean board) {
		System.out.println("BoardDAO - insertBoard()");
		
		int insertCount = 0;
		
		PreparedStatement pstmt = null,pstmt2=null;
		ResultSet rs = null;
		
		// --------------------------------------------------------------------------------
		// 새 글 번호 계산을 위해 기존 board 테이블의 모든 번호(idx) 중 가장 큰 번호 조회
		// => 조회 결과 + 1 값을 새 글 번호로 지정하고, 조회 결과가 없으면 기본값 1 로 설정
		// => MySQL 구문의 MAX() 함수 사용(SELECT MAX(컬럼명) FROM 테이블명)
		try {
			int board_num = 1; // 새 글 번호
			
			String sql = "SELECT MAX(board_num) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 조회 결과가 있을 경우(= 기존 게시물이 하나라도 존재할 경우)
				// (만약, 게시물이 존재하지 않을 경우 DB 에서 NULL 로 표기, rs.next() 가 false)
				board_num = rs.getInt(1) + 1; // 기존 게시물 번호 중 가장 큰 번호(= 조회 결과) + 1
			}
			System.out.println("새글 번호 "+board_num);
			
			sql = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, board_num);
			pstmt2.setString(2, board.getBoard_name());
			pstmt2.setString(3, board.getBoard_pass());
			pstmt2.setString(4, board.getBoard_subject());
			pstmt2.setString(5, board.getBoard_content());
			pstmt2.setString(6, board.getBoard_file());
			pstmt2.setString(7, board.getBoard_real_file());
			pstmt2.setInt(8, board_num);
			pstmt2.setInt(9,0);
			pstmt2.setInt(10,0);
			pstmt2.setInt(11,0);
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertBoard() 메서드 오류!");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
		}
		return insertCount;
	}


	public List<BoardBean> selectBoardList(String keyword, int startRow, int listLimit) {
		System.out.println("select BoardList()");
		List<BoardBean> boardlist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM board "
					+ "WHERE board_subject LIKE ? "
					+ "ORDER BY board_re_ref DESC, board_re_seq ASC "
					+ "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			boardlist = new ArrayList<BoardBean>();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_num(rs.getInt(1));
				bean.setBoard_name(rs.getString(2));
				bean.setBoard_pass(rs.getString(3));
				bean.setBoard_subject(rs.getString(4));
				bean.setBoard_content(rs.getString(5));
				bean.setBoard_file(rs.getString(6));
				bean.setBoard_real_file(rs.getString(7));
				bean.setBoard_re_ref(rs.getInt(8));
				bean.setBoard_re_lev(rs.getInt(9));
				bean.setBoard_re_seq(rs.getInt(10));
				bean.setBoard_readcount(rs.getInt(11));
				bean.setBoard_date(rs.getTimestamp(12));
				boardlist.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("BoardDAO - selectBoardList()");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return boardlist;
	}


	public int selectListCount(String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM board "
							+ "WHERE board_subject LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
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
		}
		
		
		return listCount;
	}


	public BoardBean getBoard(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean board = null;
		try {
			// board 테이블에서 글번호(idx) 가 일치(조건) 하는 레코드(전체 컬럼 데이터) 조회
			// => 조회 결과가 존재할 경우 BoardDTO 객체 생성 후 데이터 저장
			String sql = "SELECT * FROM board WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery(); // SQL 구문 실행
			
			// 조회결과 존재 여부 판별
			if(rs.next()) { // 조회 결과 존재할 경우
				board = new BoardBean(); // BoardDTO 객체 생성
				// 데이터 저장
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
//				board.setBoard_pass(rs.getString("board_pass"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_date(rs.getTimestamp("board_date"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_file(rs.getNString("board_file"));
				board.setBoard_real_file(rs.getString("board_real_file"));
			
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - getBoard()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return board;
	}


	public int updateReadcount(int board_num) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE board "
							+ "SET board_readcount=board_readcount+1 "
							+ "WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - updateReadcount()");
			e.printStackTrace();
		} finally {
			// 자원 반환
			JdbcUtil.close(pstmt);
		}
		return updateCount;
	}


	public boolean removeBoard(String board_pass, int board_num) {
		boolean result = false;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM board WHERE board_num=? AND board_pass=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			int deleteCount = pstmt.executeUpdate();
			
			if(deleteCount > 0 ) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result; 
	}

	public boolean isBoardWriter(int board_num, String board_pass) {
	      boolean isBoardWriter = false;
	      
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         // board 테이블에서 글번호(board)가 일치하는 1개 레코드 조회
	         String sql = "SELECT * FROM board "
	                        + "WHERE board_num=? "
	                        +       "AND board_pass=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, board_num);
	         pstmt.setString(2, board_pass);
	         rs = pstmt.executeQuery();
	         // 조회 결과가 있을 경우
	         if(rs.next()) {
	            // isBoardWriter 값을 true 로 변경
	            isBoardWriter = true;
	         }
	         
	      } catch (SQLException e) {
	         System.out.println("BoardDAO - isBoardWriter()");
	         e.printStackTrace();
	      } finally {
	         // DB 자원 반환
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	      }
	      
	      return isBoardWriter;
	   }

}












