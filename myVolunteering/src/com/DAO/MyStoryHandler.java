package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Entity.Stories;
import com.Entity.User;
import com.Func.SqlStatement;

public class MyStoryHandler {

	@SuppressWarnings("finally")
	public static ArrayList<Stories> getAllStoriesByUserId(int id) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectByUserId(SqlStatement.STORIES, id);
		ArrayList<Stories> listMyStories = new ArrayList<Stories>();
		Stories mystory = null;
		try {
			while (rs.next()) {
				number++;
				mystory = new Stories();
				mystory.setStoryId(rs.getInt("storyId"));
				mystory.setTitle(rs.getString("title"));
				mystory.setContent(rs.getString("content"));
				mystory.setWrittenTime(rs.getString("writtenTime"));
				mystory.setLike(rs.getInt("liked"));
				
				listMyStories.add(mystory);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (0 == number) {
				return null;
			} else {
				// System.out.println("username:"+tuserinfo.getUsername());
				return listMyStories;
			}
		}

	}
	
	@SuppressWarnings("finally")
	public static Stories getStoryByStoryId(String id) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectByStoryId(SqlStatement.STORIES, id);
		Stories mystory = new Stories();
		try {
			while (rs.next()) {
				number++;
				mystory.setTitle(rs.getString("title"));
				mystory.setContent(rs.getString("content"));
				mystory.setWrittenTime(rs.getString("writtenTime"));
				mystory.setLike(rs.getInt("liked"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (0 == number) {
				return null;
			} else {
				// System.out.println("username:"+tuserinfo.getUsername());
				return mystory;
			}
		}

	}
	
	@SuppressWarnings("finally")
	public static User getUserByUserId(int id) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectByUserId(SqlStatement.USER, SqlStatement.MYSTORY, id);
		User user = new User();
		try {
			while (rs.next()) {
				number++;
				user.setLevel(rs.getString("level"));
				user.setLastLogin(rs.getDate("lastlogin"));
				user.setUserName(rs.getString("userName"));
				user.setEmail(rs.getString("email"));
				user.setUserId(rs.getInt("userId"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (0 == number) {
				return null;
			} else {
				// System.out.println("username:"+tuserinfo.getUsername());
				return user;
			}
		}

	}



}
