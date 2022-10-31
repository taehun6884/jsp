package board;

import java.sql.Timestamp;

/*
create table board ( 
		 idx int primary key,
		 name varchar(20) not null,
		 subject varchar(50) not null,
		 content varchar(2000) not null,
		 date timestamp not null,
		 readcount int not null);
*/
public class BoardDTO {
private int idx;
private String pass;
private String name;
private String subject;
private String content;
private Timestamp date;
private int readcount;


public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
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

@Override
public String toString() {
	return "BoardDTO [idx=" + idx + ", pass=" + pass + ", name=" + name + ", subject=" + subject + ", content="
			+ content + ", date=" + date + ", readcount=" + readcount + "]";
}






}
