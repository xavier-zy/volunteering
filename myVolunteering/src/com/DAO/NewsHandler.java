package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Collections;

import com.DBUtil.DBUtil;
import com.Entity.News;

public class NewsHandler {

	public static News getNewsByNewsId(String id) {
		int i = 0;
		News news = new News();
		String sql = "SELECT *FROM news WHERE newsId=?";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setPublishTime(rs.getString("publishTime"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return news;
		}
	}

	
	public static ArrayList<News> getAllNews() {
		int i = 0;
		News news = null;
		String sql = "SELECT *FROM news ";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		ArrayList<News> newslist = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			newslist = new ArrayList<News>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				news = new News();
				news.setNewsId(rs.getInt("newsId"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setPublishTime(rs.getString("publishTime"));
				newslist.add(news);
			}

//			Collections.sort(newslist, new NewsSortByDate());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return newslist;
		}

	}

		public static int addNews(News news) {
		int i = 0;
		String sql = "INSERT INTO news(title,content,publishTime) VALUES(?,?,?)";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			ps.setString(3, news.getPublishTime());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int deleteNewsByNewsId(String id) {
		int i = 0;
		String sql = "DELETE FROM news WHERE newsId =?";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public static int updateNews(News news) {
		int i = 0;
		String sql = "UPDATE news SET newsId=?, title=?, content=?, publishTime=? where newsId=?";
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();		
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			ps.setString(3, news.getPublishTime());
			ps.setInt(4, news.getNewsId());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

}