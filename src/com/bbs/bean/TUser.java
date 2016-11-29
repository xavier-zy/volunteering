package com.bbs.bean;

import java.util.Date;

public class TUser {
	private int userId;
	private String userName;
	private String password;
	private String level;
	private Date Lastlogin;
	private String nickname;
	private String headImg;

	
	public int getUserId() {
		return userId;
	}

	public void setUserIde(int userId) {
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

	public Date getLastlogin() {
		return Lastlogin;
	}

	public void setLastlogin(Date lastlogin) {
		Lastlogin = lastlogin;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}


	@Override
	public String toString() {
		return "用户名" + userName + "密码" + password + "等级" + level
				+ "上次登录时间" + Lastlogin.toString() + "昵称" + nickname;
	}
}
