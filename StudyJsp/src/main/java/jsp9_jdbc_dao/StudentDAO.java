package jsp9_jdbc_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// DAO(Data Access Object, 데이터 접근 객체) 역할을 수행할 StudentDAO 클래스 정의
// => 데이터베이스 접근, 자원 반환, 각 SQL 구문을 실행할 메서드 정의
public class StudentDAO {
	// < 메서드 정의 기본 문법 >
	// [제한자] 리턴타입 메서드명([매개변수...]) {}
	
	// insertForm.jsp 페이지에서 전달받은 데이터를 저장한 StudentDTO 객체를 전달받아
	// 데이터를 student 테이블에 추가(INSERT)하는 insert() 메서드 정의
	// => 파라미터 : StudentDTO 객체(student), 리턴타입 : int(insertCount)
	public int insert(StudentDTO student) {
		System.out.println("StudentDAO - insert()");
		
		int insertCount = 0;
		
		// 데이터베이스 작업에 필요한 클래스 타입 변수 선언
		// => try, catch, finally 블록 등 여러 블록에 걸쳐 변수를 사용하기 위함
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// JDBC 작업 4단계.
			// 0단계. DB 연결에 필요한 정보 문자열 4가지를 변수에 별도로 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp5";
			String user = "root";
			String password = "1234";
			
			// 1단계. JDBC 드라이버 로드
			Class.forName(driver);
			
			// 2단계. DB 연결
			// => 연결 성공 시 java.sql.Connection 타입 객체 리턴됨
			con = DriverManager.getConnection(url, user, password);
			
			// study_jsp5 데이터베이스의 student 테이블에 데이터 추가(INSERT)
			// => 리턴되는 추가 작업 결과 변수(count)에 저장
			String sql = "INSERT INTO student VALUES (?,?)";
			pstmt = con.prepareStatement(sql);
			// 만능문자를 치환할 데이터는 StudentDTO 객체에 저장되어 있음 => Getter 사용
			pstmt.setInt(1, student.getIdx()); // idx 데이터 가져와서 전달
			pstmt.setString(2, student.getName()); // name 데이터 가져와서 전달
			
			// SQL 구문 실행 후 리턴되는 결과값(int 타입)을 변수에 저장 후 리턴
			insertCount = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패 또는 SQL 구문 오류 발생!");
			e.printStackTrace();
		} finally {
			// 데이터베이스 자원을 반환하기 위한 코드 작성하는 블럭
			// => Connection, PreparedStatement, ResultSet 등의 객체의 close() 메서드 호출
			//    단, 객체를 생성한 순서의 역순으로 반환해야함
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return insertCount;
	}
}















