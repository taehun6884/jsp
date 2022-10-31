package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class MemberDAO {
	
	// 회원가입 작업 수행하는 insertMember() 메서드
	// => 파라미터 : MemberDTO 객체(member)    리턴타입 : int(insertCount)
	public int insertMember(MemberDTO member) {
		System.out.println("MemberDAO - insertMember()");
		System.out.println(member.getId());
		
		int insertCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getMobile());
			pstmt.setString(6, member.getPost_code());
			pstmt.setString(7, member.getAddress1());
			pstmt.setString(8, member.getAddress2());
			pstmt.setString(9, member.getPhone());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insertMember()!");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);			
		}
		
		return insertCount;
	}
	
	// loginMember()
//	public boolean loginMember(String id, String pass) {
//		System.out.println("MemberDAO - login()");
//		System.out.println(id + ", " + pass);
//		
//		boolean isLoginSuccess = false;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		// 1, 2단계
//		con = JdbcUtil.getConnection();
//		
//		try {
//			String sql = "SELECT id FROM member WHERE id=? AND pass=?";
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setString(1, id);
//			pstmt.setString(2, pass);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				isLoginSuccess = true;
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL 구문 오류!");
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(rs);
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(con);
//		}
//		
//		// loginPro.jsp
//		return isLoginSuccess;
//	}
	
	// 로그인 판별 작업 수행(loginMember())
	// => 파라미터 : MemberDTO 객체(member)    리턴타입 : boolean(isLoginSuccess)
//	public boolean loginMember(MemberDTO member) {
//		System.out.println("MemberDAO - login()");
//		System.out.println(member.getId() + ", " + member.getPass());
//		
//		boolean isLoginSuccess = false;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		con = JdbcUtil.getConnection();
//		
//		try {
//			// 아이디, 패스워드가 일치하는 레코드 검색
//			String sql = "SELECT id FROM member WHERE id=? AND pass=?";
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setString(1, member.getId());
//			pstmt.setString(2, member.getPass());
//			
//			rs = pstmt.executeQuery();
//			
//			// 조회 결과 레코드가 존재할 경우 isLoginSuccess 를 true 로 변경
//			if(rs.next()) {
//				isLoginSuccess = true;
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("SQL 구문 오류 발생! - loginMember()");
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(rs);
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(con);
//		}
//		
//		return isLoginSuccess; // loginPro.jsp
//		
//	}
	
	// 로그인 판별 작업 수행 또는
	// 게시물 수정 권한 여부를 판별할 
	// isRightUser() 메서드
	// => 파라미터 : MemberDTO 객체(member)    리턴타입 : boolean(isRightUser)
	public boolean isRightUser(MemberDTO member) {
		System.out.println("MemberDAO - isRightUser()");
		System.out.println(member.getId() + ", " + member.getPass());
		
		boolean isRightUser = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 아이디, 패스워드가 일치하는 레코드 검색
			String sql = "SELECT id FROM member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			
			rs = pstmt.executeQuery();
			
			// 조회 결과 레코드가 존재할 경우 isLoginSuccess 를 true 로 변경
			if(rs.next()) {
				isRightUser = true;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - loginMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isRightUser; // loginPro.jsp
		
	}
	
	// 회원 정보 조회 selectMember() 메서드
	// => 파라미터 : 세션아이디     리턴타입 : MemberDTO()
	public MemberDTO selectMember(String sId) {
		System.out.println("MemberDAO - MemberDTO()");
		System.out.println(sId);
		
		MemberDTO member = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 아이디, 패스워드가 일치하는 레코드 검색
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sId);			
			rs = pstmt.executeQuery();
			
			// 조회 결과 레코드가 존재할 경우 MemberDTO 객체에 저장
			if(rs.next()) {
				// MemberDTO 객체 생성
				member = new MemberDTO();
				
				// MemberDTO 객체에 조회 결과 각 컬럼 데이터 저장
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				member.setPost_code(rs.getString("post_code"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setPhone(rs.getString("phone"));
				member.setDate(rs.getDate("date"));
				
//				System.out.println(member.toString());
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - loginMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return member; // loginPro.jsp
	}
	
	// 회원 수정 작업 수행 - updateMember() 메서드
	public int updateMember(MemberDTO member, boolean isChangePass) {
		System.out.println("MemberDAO - insertMember()");
		System.out.println(member.getId());
		
		int updateCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 패스워드 변경 여부에 따른 각각의 SQL 구문 작성
			String sql = "";
			if(isChangePass) { // 패스워드 변경
				sql = "UPDATE member SET pass=?, name=?, email=?, mobile=?, post_code=?, address1=?, address2=?, phone=? WHERE id=?";				

				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member.getPass());
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getMobile());
				pstmt.setString(5, member.getPost_code());
				pstmt.setString(6, member.getAddress1());
				pstmt.setString(7, member.getAddress2());
				pstmt.setString(8, member.getPhone());
				pstmt.setString(9, member.getId());
			} else { // 패스워드 미변경
				sql = "UPDATE member SET name=?, email=?, mobile=?, post_code=?, address1=?, address2=?, phone=? WHERE id=?";				

				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getMobile());
				pstmt.setString(4, member.getPost_code());
				pstmt.setString(5, member.getAddress1());
				pstmt.setString(6, member.getAddress2());
				pstmt.setString(7, member.getPhone());
				pstmt.setString(8, member.getId());
			}
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insertMember()!");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);			
		}
		
		return updateCount;
	}
	
	// selectAllMembers()
	public ArrayList selectAllMembers() {
		System.out.println("MemberDAO - selectAllMembers()");
		
		ArrayList allMemberInfo = null;
//		MemberDTO member = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con = JdbcUtil.getConnection();
		
		try {
//			String sql = "SELECT * FROM member";
			String sql = "SELECT id, name, email, mobile, date FROM member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 주의!!! 저장할 ArrayList 객체 생성!!
			allMemberInfo = new ArrayList();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				
				member.setId(rs.getString("id"));
//				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
//				member.setPost_code(rs.getString("post_code"));
//				member.setAddress1(rs.getString("address1"));
//				member.setAddress2(rs.getString("address2"));
//				member.setPhone(rs.getString("phone"));
				member.setDate(rs.getDate("date"));
				
				allMemberInfo.add(member);
				
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - allMemberInfo()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		} 
		
		return allMemberInfo;
	}
		
	// 회원 삭제 deleteMember() 메서드
	// => 파라미터 : 아이디(id)    리턴타입 : int(deleteCount)
	public int deleteMember(String id) {
		System.out.println("MemberDAO - deleteMember()");
		System.out.println(id);
		
		int deleteCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - deleteMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		} 
		
		return deleteCount;
		
	}
	
	public List<MemberDTO> selectMemberList(){
		List<MemberDTO> memberlist = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;
		con = JdbcUtil.getConnection();
		
		String sql = "select * from member";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			memberlist = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString(1));
				member.setPass(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setPost_code(rs.getString(5));
				member.setAddress1(rs.getString(6));
				member.setAddress2(rs.getString(7));
				member.setPhone(rs.getString(8));
				member.setMobile(rs.getString(9));
				member.setDate(rs.getDate(10));
				
				memberlist.add(member);
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		} 
		
		
		
		
		return memberlist;
	}
	
	
	
}
