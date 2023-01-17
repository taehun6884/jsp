package ajax;

import java.sql.Date;
import java.sql.Timestamp;
/*
create table member(
	    name varchar(20) not null,
	    id varchar(16) primary key,
	    passwd varchar(16) not null,
	    email varchar(50) unique not null,
	    gender varchar(1) not null,
	    date date not null);
*/

public class MemberBean {
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String gender;
	private Date date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", gender="
				+ gender + ", date=" + date + "]";
	}
	
}
