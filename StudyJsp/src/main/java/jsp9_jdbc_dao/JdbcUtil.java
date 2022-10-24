package jsp9_jdbc_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtil {
	
	public static Connection getConncetion() {
		Connection con = null;
		
		// JDBC 작업 4단계.
		// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp5";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName(driver);
			
			// 2단계. DB 연결
			// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		return con;
	}
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
