package jsp11_dbcp;

// DTO(Data Transfer Object, 데이터 전송 객체) 역할을 수행할 StudentDTO 클래스 정의
// => insertForm.jsp 페이지에서 입력받은 폼 데이터를 저장하고
//    StudentDAO 객체에서 조회된 데이터를 저장하는 역할
// => 이 객체에 데이터를 담아 JSP 페이지와 DAO 객체 사이에서 주고 받는 용도로 사용
public class StudentDTO {
	// 1. 데이터를 저장하는데 사용할 인스턴스 멤버변수 선언
	// => student 테이블의 각 컬럼과 1:1 로 대응하는 멤버변수 선언
	// => 멤버변수는 외부로부터의 직접 접근을 차단(제한)하기 위해 접근제한자 private 사용
	private int idx;
	private String name;
	
	// 2. 멤버변수에 접근할 Getter/Setter 메서드 정의
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
