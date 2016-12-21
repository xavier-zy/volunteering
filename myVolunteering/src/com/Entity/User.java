package com.Entity;

import java.util.Date;

public class User {
	private int userId;
	private String userName;
	private String password;
	private String level;
	private Date lastLogin;	
	private String email;
	private String headImg;
//	private Integer integer;
	
	
//	public User(int userId, String userName, String password, 
//			String level, Date lastlogin, String headImg) {
//		this.userId = userId;
//		this.userName = userName;
//		this.password = password;
//		this.level = level;
//		Lastlogin = lastlogin;
//		this.headImg = headImg;
//	}
	
//	public User() {
//		integer = (Integer) null;
//		this.userId = integer;
//		this.userName = null;
//		this.password = null;
//		this.level = null;
//		Lastlogin = null;
//		this.headImg = null;
//	}
	
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastlogin) {
		lastLogin = lastlogin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
