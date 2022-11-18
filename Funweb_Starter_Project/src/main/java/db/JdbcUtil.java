package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 데이터베이스 작업 준비 및 해제(자원반환) 작업을 공통으로 수행할 JdbcUtil 클래스 정의
public class JdbcUtil {
	
	// 1. 데이터베이스 접근(공통 작업)을 통해 Connection 객체를 생성하여 외부로 리턴하는
	//    getConnection() 메서드 정의(데이터베이스 작업 1단계 & 2단계 수행)
	// => 파라미터 : 없음      리턴타입 : java.sql.Connection(con)
	// => 단, JdbcUtil 클래스의 인스턴스 생성 없이도 메서드 호출이 가능하도록
	//    static 메서드로 정의
	public static Connection getConnection() {
		Connection con = null;
		
		
		try {
			Context initCtx = new InitialContext();
			
//		Context envCtx = (Context)initCtx.lookup("java:comp/env");
			
//		DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/MySQL");
			
			con = ds.getConnection();
		
//			con.setAutoCommit(false);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	// 데이터베이스 자원 반환을 공통으로 수행할 close() 메서드 정의
	// => 파라미터 : Connection 타입(con) 또는 PreparedStatement 타입(pstmt) 또는
	//               ResultSet 타입(rs)
	// => 각각의 파라미터를 따로 전달받아 각각 close() 작업을 수행하도록 메서드 따로 정의
	//    단, 각각의 메서드 이름은 모두 close() 로 정의하고 파라미터만 다르게 지정
	//    (= 메서드 오버로딩 = Method Overloading)
	// => 인스턴스 생성 없이도 메서드 호출이 가능하도록 static 메서드로 정의
	public static void close(Connection con) {
		try {
			if(con != null) {
			con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) {
			pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
			rs.close();
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}









