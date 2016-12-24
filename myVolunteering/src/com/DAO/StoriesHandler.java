package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Collections;

import com.DBUtil.DBUtil;
import com.Entity.Stories;
//import com.Entity.User;

public class StoriesHandler {

	// 通过ID查询
	public static Stories getStoryByStoryId(String id) {
		int i = 0;
		Stories story = new Stories();
		String sql = "SELECT * FROM stories WHERE storyId=?";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;

				story.setContent(rs.getString("content"));
				story.setTitle(rs.getString("title"));
				story.setLike(rs.getInt("liked"));
				story.setWrittenTime(rs.getString("writtenTime"));
				story.setUserId(rs.getInt("userId"));
				story.setStoryId(rs.getInt("storyId"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return story;
		}
	}

	// 查询所有活动
	public static ArrayList<Stories> getAllStories() {
		int i = 0;
		Stories story = null;
		String sql = "SELECT * FROM stories";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		ArrayList<Stories> storylist = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			storylist = new ArrayList<Stories>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				story = new Stories();
				story.setStoryId(rs.getInt("storyId"));
				story.setTitle(rs.getString("title"));
				story.setLike(rs.getInt("liked"));
				storylist.add(story);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return storylist;
		}
	}
	
	public static ArrayList<Stories> getMostLikedStories() {
		int i = 0;
		Stories story = null;
		String sql = "SELECT * FROM stories WHERE liked = (SELECT MAX(liked) from stories)";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		ArrayList<Stories> storylist = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			storylist = new ArrayList<Stories>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				story = new Stories();
				story.setStoryId(rs.getInt("storyId"));
				story.setTitle(rs.getString("title"));
				story.setLike(rs.getInt("liked"));
				storylist.add(story);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return storylist;
		}
	}

	// 增加一个活动
	public static int addStory(Stories story, int id) {
		int i = 0;
		String sql = "INSERT INTO stories(title,content,writtenTime,liked,userId) VALUES(?,?,?,0,?)";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, story.getTitle());
			ps.setString(2, story.getContent());
			ps.setString(3, story.getWrittenTime());
			ps.setInt(4, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	public static int deleteStoryById(String id) {
		int i = 0;
		String sql = "DELETE FROM stories WHERE storyId =" + id;
		System.out.println(sql);

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 更新
	public static int updateStories(Stories story) {
		int i = 0;
		String sql = "UPDATE stories SET liked = ? WHERE storyId = ?";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, story.getLike());
			ps.setInt(2, story.getStoryId());
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

}
