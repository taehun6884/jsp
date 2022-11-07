package board;

import java.sql.Timestamp;

/*
create table file_board ( 
		 idx int primary key,
		 name varchar(20) not null,
		 subject varchar(50) not null,
		 content varchar(2000) not null,
		 original_file varchar(200) not null,
		 real_file varchar(200) not null,
		 date timestamp not null,
		 readcount int not null);
*/
public class FileBoardDTO {
private int idx;
private String pass;
private String name;
private String subject;
private String content;
private Timestamp date;
private int readcount;
private String original_file;
private String real_file;



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
	return "FileBoardDTO2 [idx=" + idx + ", pass=" + pass + ", name=" + name + ", subject=" + subject + ", content="
			+ content + ", date=" + date + ", readcount=" + readcount + ", original_file=" + original_file
			+ ", real_file=" + real_file + "]";
}




}
