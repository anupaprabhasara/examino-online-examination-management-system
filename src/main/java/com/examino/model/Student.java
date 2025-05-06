package com.examino.model;

public class Student {
	private int student_id;
    private String full_name;
    private String email;
    private String password;
    private String department;
    
	public int getStudent_id() {
		return student_id;
	}
	public String getFull_name() {
		return full_name;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getDepartment() {
		return department;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}