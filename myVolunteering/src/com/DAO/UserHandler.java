package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DBUtil.DBUtil;
import com.Entity.User;

public class UserHandler {
	public User getUser(String userName, String password) {
		int i = 0;
		User user = new User();
		String sql = "SELECT * FROM user WHERE userName=? and password=?";
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				user.setLevel(rs.getString("level"));
				user.setLastLogin(rs.getDate("lastlogin"));
				user.setUserName(rs.getString("userName"));
				user.setEmail(rs.getString("email"));
				user.setUserId(rs.getInt("userId"));
				user.setPassword(rs.getString("password"));

			}
			sql = "UPDATE user SET lastLogin=now() WHERE userName=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			// int rs2 = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return user;
		}
	}

	public static User getTUserById(int id) {
		int i = 0;
		User tuser = new User();
		String sql = "SELECT * FROM user WHERE userId=" + id;
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				tuser.setLevel(rs.getString("level"));
				tuser.setLastLogin(new java.util.Date(rs.getDate("lastLogin").getTime()));
				tuser.setUserName(rs.getString("userName"));
				tuser.setPassword(rs.getString("password"));
				tuser.setEmail(rs.getString("email"));
				tuser.setUserId(rs.getInt("userId"));
				System.out.println(rs.getInt("userId"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return tuser;
		}
	}
	
	public static User getUserByUserName(String uname) {
		int i = 0;
		User tuser = new User();
		String sql = "SELECT userId,level,lastLogin,password FROM user WHERE userName=" + uname;
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				tuser.setLevel(rs.getString("level"));
				tuser.setLastLogin(new java.util.Date(rs.getDate("lastLogin").getTime()));
				tuser.setUserName(rs.getString("userName"));
				tuser.setPassword(rs.getString("password"));
				tuser.setEmail(rs.getString("email"));
				tuser.setUserId(rs.getInt("userId"));
				System.out.println(rs.getInt("userId"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return tuser;
		}
	}

	// not used for now
	public static void insertUser(String name, String password, String email) { // 插入用户信息
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		String sql = "INSERT INTO user (password,Lastlogin,level,userName,email) VALUES (?,now(),1,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updateUserPW(User user) {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		String updateSQL = "UPDATE user SET password = ? WHERE userName = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(updateSQL);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUserName());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateUserHeadImg(User user) {
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		String updateSQL = "UPDATE user SET headImg = ? WHERE userId = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(updateSQL);
			ps.setString(1, user.getHeadImg());
			ps.setInt(2, user.getUserId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}