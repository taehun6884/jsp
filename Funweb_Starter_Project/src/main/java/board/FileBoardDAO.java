package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class FileBoardDAO {
	private Connection con;
	private PreparedStatement pstmt, pstmt2;
	private ResultSet rs;
	
	// 글쓰기 작업 수행 - insertFileBoard()
	// => 파라미터 : FileBoardDTO 객체    리턴타입 : int(insertCount)
	public int insertFileBoard(FileBoardDTO fileBoard) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			// file_board 테이블의 idx 레코드(글번호) 중 가장 큰 값 조회
			int idx = 1; // 새 글 번호로 사용할 변수 선언(초기값 1)
			
			String sql = "SELECT MAX(idx) FROM file_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 조회 결과가 있을 경우
				// 조회된 글번호 + 1 값을 새 글 번호로 저장
				// => 주의! getInt("컬럼명") 사용 시 "idx" 가 아닌 "MAX(idx)" 이름 지정 필요
				idx = rs.getInt(1) + 1; // 컬럼인덱스 활용
			}
			
			// file_board 테이블에 데이터 추가(INSERT)
			sql = "INSERT INTO file_board VALUES (?,?,?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, idx);
			pstmt2.setString(2, fileBoard.getName());
			pstmt2.setString(3, fileBoard.getPass());
			pstmt2.setString(4, fileBoard.getSubject());
			pstmt2.setString(5, fileBoard.getContent());
			pstmt2.setString(6, fileBoard.getOriginal_file());
			pstmt2.setString(7, fileBoard.getReal_file());
			
			insertCount = pstmt2.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertFileBoard()");
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
	
	// 게시물 목록 조회 selectFileBoardList() - 게시물 목록 갯수 제한 추가
	// => 파라미터 : 시작행번호, 페이지 당 게시물 목록 수
	//    리턴타입 : List<FileBoardDTO>(boardList)
	
	
	// 전체 게시물 수 조회 selectFileBoardListCount()
	// => 파라미터 : 없음, 리턴타입 : int(listCount)
	public int selectFileList(String keyword) {
		int selectFileList = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT count(idx) FROM file_board WHERE subject LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,"%"+keyword + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				selectFileList = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return selectFileList;
	}
	  public FileBoardDTO selectFileBoard(int idx) {
	      FileBoardDTO dto = null;
	      con = JdbcUtil.getConnection();
	      String sql = "SELECT * FROM file_board WHERE idx = ?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            dto = new FileBoardDTO();
	            dto.setIdx(rs.getInt("idx"));
	            dto.setName(rs.getString("name"));
	            dto.setPass(rs.getString("pass"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setContent(rs.getString("content"));
	            dto.setOriginal_file(rs.getString("original_file"));
	            dto.setReal_file(rs.getString("real_file"));
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
	   
	   public int updateBoard(FileBoardDTO dto) {
	      int updateCount = 0;
	      
	      con = JdbcUtil.getConnection();
	      
	      String sql = "UPDATE file_board SET name=?,subject=?,content=? WHERE idx=? AND pass=?";
	      
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
	      }finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(con);
	      }
	      
	      return updateCount;
	   }
	   
	   public void updateReadcount(int idx) {
	      con = JdbcUtil.getConnection();
	      String sql = "UPDATE file_board SET readcount=readcount+1 WHERE idx=?";
	      
	      try {
	         pstmt =con.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      
	      }
	   }
	   
	   public String selectRealFile(int idx) {
		   String realFile = "";
		   con = JdbcUtil.getConnection();
		   
		   String sql = "SELECT real_file FROM file_board WHERE idx = ?";
		   try {
			pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, idx);
			   System.out.println(pstmt);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   realFile = rs.getString(1);
				   
			   }
		    
	      } catch (SQLException e) {
	    	  
	    	  System.out.println("Sql 구문오류 selectRealFile");
	      }finally {
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(con);
	      }
		   return realFile;
	   }
	   
	   
	   public int filedeleteBoard(int idx, String pass) {
//	      System.out.println("BoardDAO - deleteBoard()");
	      int deleteCount = 0;
	      
	      con = JdbcUtil.getConnection();
	      
	      try {
	         String sql = "DELETE FROM file_board WHERE idx=? AND pass=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         pstmt.setString(2, pass);
	         System.out.println(pstmt);
	         deleteCount = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("SQL 구문 오류! - deleteBoard()");
	         e.printStackTrace();
	      } finally {
	         // DB 자원 반환
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(con);
	      }
	      return deleteCount;
	   }

	   public List<FileBoardDTO> selectFileBoardListCount(int startRow, int listLimit,String keyword) {
			List<FileBoardDTO> fileBoardList = null;
			
			con = JdbcUtil.getConnection();
			
			try {
				// file_board 테이블의 모든 레코드 조회
				// => idx 컬럼 기준 내림차순 정렬(ORDER BY 컬럼명 정렬방식)
				// => 시작행번호부터 게시물 목록 수 만큼으로 갯수 제한(LIMIT 시작행번호,목록수)
				//    (단, 시작행번호 첫번째는 0부터 시작)
				//    (또한, LIMIT 에 파라미터 하나만 사용 시 목록 갯수로 사용됨)
				String sql = "SELECT * FROM file_board WHERE subject LIKE ? ORDER BY idx DESC LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+ keyword +"%");
//				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, listLimit);
				rs = pstmt.executeQuery();
				
				// 전체 레코드를 저장할 ArrayList 객체 생성
				fileBoardList = new ArrayList<FileBoardDTO>();
				
				while(rs.next()) {
					// 1개 레코드를 저장할 BoardDTO 객체 생성
					FileBoardDTO fileBoard = new FileBoardDTO();
					fileBoard.setIdx(rs.getInt("idx"));
					fileBoard.setName(rs.getString("name"));
					fileBoard.setPass(rs.getString("pass"));
					fileBoard.setSubject(rs.getString("subject"));
					fileBoard.setContent(rs.getString("content"));
					fileBoard.setOriginal_file(rs.getString("original_file"));
					fileBoard.setReal_file(rs.getString("real_file"));
					fileBoard.setDate(rs.getTimestamp("date"));
					fileBoard.setReadcount(rs.getInt("readcount"));
					
					// 전체 레코드 저장하는 List 객체에 1개 레코드 저장된 FileBoardDTO 객체 추가
					fileBoardList.add(fileBoard);
				}
				
				System.out.println(fileBoardList);
			} catch (SQLException e) {
				System.out.println("SQL 구문 오류! - selectFileBoardList()");
				e.printStackTrace();
			} finally {
				// 자원 반환
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(con);
			}
			return fileBoardList;
		}
	   
	  
		 public int updateFileBoard(FileBoardDTO fileboard) {
			 int updateCount = 0;
			 con = JdbcUtil.getConnection();
			 try {
				String sql = "UPDATE file_board SET subject=?,content=?,original_file=?,real_file=?  WHERE idx =? AND pass =?";
				 pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, fileboard.getSubject());
				 pstmt.setString(2, fileboard.getContent());
				 pstmt.setString(3, fileboard.getOriginal_file());
				 pstmt.setString(4, fileboard.getReal_file());
				 pstmt.setInt(5,fileboard.getIdx());
				 pstmt.setString(6, fileboard.getPass());
				 System.out.println(pstmt);
				 updateCount=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(con);
			}
			 
	        
			 return updateCount;
		 }
		 public int selectFileBoardListCount(String keyword) {
				int listCount = 0;
				
				con = JdbcUtil.getConnection();
				
				try {
					// 특정 컬럼 또는 전체 컬럼(*)에 해당하는 레코드 수 조회하기 위해
					// MySQL 의 COUNT() 함수 활용(SELECT COUNT(컬럼명 또는 *) FROM 테이블명)
					// => 제목 검색 기능 추가와 일반 목록 기능을 결합하여
					//    제목이 널스트링("")일 경우 전체 목록 조회 가능
					String sql = "SELECT COUNT(idx) FROM file_board "
									+ "WHERE subject LIKE ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyword + "%");
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						listCount = rs.getInt(1);
					}
				} catch (SQLException e) {
					System.out.println("SQL 구문 오류! - selectFileBoardListCount()");
					e.printStackTrace();
				} finally {
					// 자원 반환
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
					JdbcUtil.close(con);
				}
				
				return listCount;
			}
	   
}













