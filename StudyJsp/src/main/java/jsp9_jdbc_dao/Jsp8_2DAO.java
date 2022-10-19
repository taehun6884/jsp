package jsp9_jdbc_dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Jsp8_2DAO {

	public int insert(Jsp8_2DTO dto) {
		
		// JDBC 작업 4단계.
		// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp5";
		String user = "root";
		String password = "1234";
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			// 1단계. JDBC 드라이버 로드
			Class.forName(driver);

			// 2단계. DB 연결
			// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
			con = DriverManager.getConnection(url, user, password);
			
			// jsp8_2 테이블에 1개 레코드에 해당하는 모든 데이터 저장
			// 단, 입사일(hire_date)는 SQL 구문의 now() 함수 사용하여 DB 서버의 현재 날짜, 시각정보를 사용
			String sql = "INSERT INTO jsp8_2 VALUES (?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getJumin());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getGender());
			pstmt.setString(8, dto.getHobby());
			pstmt.setString(9, dto.getContent());

			count = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("디비드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("디비 연결& sql문장 오류!");
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return count;
	}//insert
	
	public ArrayList select() {
				// JDBC 작업 4단계.
				// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
				String driver = "com.mysql.cj.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/study_jsp5";
				String user = "root";
				String password = "1234";
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				ArrayList selectList = null;
				
				
				// 1단계. JDBC 드라이버 로드
				try {
					Class.forName(driver);
					
					// 2단계. DB 연결
					// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
					con = DriverManager.getConnection(url, user, password);
					
					String sql = "SELECT * FROM jsp8_2";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					selectList = new ArrayList();
							
					while(rs.next()) {
						String name = rs.getString("name");
						String id = rs.getString("id");
						String passwd = rs.getString("passwd");
						String jumin = rs.getString("jumin");
						String email = rs.getString("email");
						String job = rs.getString("job");
						String gender = rs.getString("gender");
						String hobby = rs.getString("hobby");
						String content = rs.getString("content");
						Date hire_date = rs.getDate("hire_date");
					
						Jsp8_2DTO dto = new Jsp8_2DTO();
						dto.setContent(content);
						dto.setEmail(email);
						dto.setGender(gender);
						dto.setHire_date(hire_date);
						dto.setHobby(hobby);
						dto.setId(id);
						dto.setJob(job);
						dto.setJumin(jumin);
						dto.setName(name);
						dto.setPasswd(passwd);
						
						selectList.add(dto);
					}
				} catch (ClassNotFoundException e) {
					System.out.println("디비드라이버 로드 실패!");
					e.printStackTrace();
				} catch (SQLException e) {
					System.out.println("디비 연결& sql문장 오류!");
					e.printStackTrace();
				}finally {
					try {
						rs.close();
						pstmt.close();
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				return selectList;
	}//select
	
	public int delete(String id) {
		// JDBC 작업 4단계.
		// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp5";
		String user = "root";
		String password = "1234";
		int result = 0;
		
		try {
			// 1단계. JDBC 드라이버 로드
			Class.forName(driver);

			// 2단계. DB 연결
			// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
			Connection con = DriverManager.getConnection(url, user, password);

			String sql = "DELETE FROM jsp8_2 WHERE id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("디비드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("디비 연결& sql문장 오류!");
			e.printStackTrace();
		}
		
		
		return result;
	}
}
