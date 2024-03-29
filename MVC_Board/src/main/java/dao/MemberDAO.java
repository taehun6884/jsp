package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.MemberBean;

public class MemberDAO {
private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 데이터베이스 접근에 사용할 Connection 객체를 Service 객체로부터 전달받기 위한
	// Connection 타입 멤버변수 선언 및 Setter 메서드 정의
	private Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertMember(MemberBean vo) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,now())"; 
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getGender());
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insertCount;
	}

	public int isRightUser(String id, String pass) {
		int isRightUser = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id,passwd FROM member WHERE id=? AND passwd=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isRightUser = 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return isRightUser;
	}

	public List<MemberBean> selectMemberList() {
		List<MemberBean> memberlist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member ORDER BY id ASC";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			memberlist = new ArrayList<MemberBean>();
			while(rs.next()) {
				MemberBean vo = new MemberBean();
				vo.setName(rs.getString(1));
				vo.setId(rs.getString(2));
				vo.setPasswd(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setDate(rs.getDate(6));
				memberlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberlist;
	}
	// 회원가입시 회원가입 쿠폰 지급
    public int insertWelcomCoupon() {
       int insertCount = 0;
       
       PreparedStatement pstmt=null, pstmt2=null, pstmt3=null;
       ResultSet rs = null, rs2 = null;
       
       try {
          int member_idx = 1; // 회원 idx 처리
          String sql = "SELECT MAX(member_idx) FROM member";
          pstmt= con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
             member_idx = rs.getInt(1) + 1;
          } 
          
          // coupon 조회
          int coupon_idx = 0;
          String coupon_name = "";
          int coupon_price = 0;
          
          sql = "SELECT * FROM coupon where coupon_name = '회원가입 감사 쿠폰'";
          pstmt2 = con.prepareStatement(sql);
          rs2 = pstmt.executeQuery(); 
          
          if(rs2.next()) { 
             coupon_idx = rs2.getInt("coupon_idx");
             coupon_name = rs2.getString("coupon_name");
             coupon_price = rs2.getInt("coupon_price");
          }
          
          // member_coupon insert 작업
          sql = "INSERT INTO member_coupon VALUES(?,?,?,?,?,now(),date_add(now(),interval 30 day))";
          pstmt3 = con.prepareStatement(sql);

          pstmt3.setInt(1, member_idx);
          pstmt3.setInt(2, coupon_idx);
          pstmt3.setString(3, coupon_name);
          pstmt3.setInt(4, coupon_price);
          pstmt3.setInt(5, 0);
          
          System.out.println(pstmt3);
          
          insertCount = pstmt3.executeUpdate();
          } catch (SQLException e) {
             System.out.println("SQL 구문 오류! - insertWelcomCoupon()");
             e.printStackTrace();
          } finally {
             JdbcUtil.close(rs);
             JdbcUtil.close(pstmt);
             JdbcUtil.close(pstmt2);
             JdbcUtil.close(pstmt3);
          }
       return insertCount;
    }
}
