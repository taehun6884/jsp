package board;

import java.sql.Timestamp;

/*
 * file _board 테이블 정의
 * ----------------------
 * 글번호 idx - 정수 pk
 * 작성자 name - 문자 20자 NN
 * 패스워드 pass - 문자 16자 NN
 * 제목 subject - 문자 50자 NN
 *내용 content - 문자 2000자NN
 * 원본파일명 (original_file)  문자 200자 NN
 * 실제파일명 (real_file) 문자 200자 NN
 * 작성일 date -날짜 TIMESTAMP NN
 * 조회수 readcount - 정수 NN
 */

//CREATE TABLE file_board 

public class FileBoardDTO {
 private int idx;
 private String name;
 private String pass;
 private String subject;
 private String content;
 private String original_file;
 private String real_file;
 private Timestamp date;
 private int readcount;
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
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Timestamp getDate() {
	return date;
}
public void setDate(Timestamp date) {
	this.date = date;
}
public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
}
public String getOriginal_file() {
	return original_file;
}
public void setOriginal_file(String original_file) {
	this.original_file = original_file;
}
public String getReal_file() {
	return real_file;
}
public void setReal_file(String real_file) {
	this.real_file = real_file;
}
@Override
public String toString() {
	return "FileBoardDTO [idx=" + idx + ", name=" + name + ", pass=" + pass + ", subject=" + subject + ", content="
			+ content + ", original_file=" + original_file + ", real_file=" + real_file + ", date=" + date
			+ ", readcount=" + readcount + "]";
}

 //tostring 단축키 ctrl shift s s 
//getter.setter  ctrl shift s r
 
}
