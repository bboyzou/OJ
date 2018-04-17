package com.ssm.pojo;

public class Student {
	private String sid;
	private String sname;
	private String password;
	public Student(){
		
	}
	public Student(String sid,String sname,String password) {
		this.sid=sid;
		this.sname=sname;
		this.password=password;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
