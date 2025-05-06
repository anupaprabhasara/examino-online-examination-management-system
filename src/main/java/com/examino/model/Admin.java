package com.examino.model;

public class Admin {
	private int admin_id;
    private String full_name;
    private String email;
    private String password;
    
	public int getAdmin_id() {
		return admin_id;
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
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
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
}