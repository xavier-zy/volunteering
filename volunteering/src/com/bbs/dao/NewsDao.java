package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import com.bbs.bean.News;
import com.bbs.lib.NewsSortByDate;
import com.bbs.util.DBUtils;

public class NewsDao {

	// ͨ��id��ѯ
	public static News getNewsById(String id) {
		int i = 0;
		News news = new News();
		String sql = "select *from news where id=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setPublishtime(rs.getString("publishtime"));
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

	// ��ѯ����
	public static ArrayList<News> getNewsAll() {
		int i = 0;
		News news = null;
		String sql = "select *from news ";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<News> newslist = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			newslist = new ArrayList<News>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setPublishtime(rs.getString("publishtime"));
				newslist.add(news);
			}
			
			Collections.sort(newslist,new NewsSortByDate());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return newslist;
		}

	}

	// ����һ������
	public static int addNews(News news) {
		int i = 0;
		String sql = "insert into news(title,content,publishtime) values(?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			ps.setString(3, news.getPublishtime());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// ɾ��
	public static int deleteNewsById(String id) {
		int i = 0;
		String sql = "delete from news where id =?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// ����
	public static int updateNews(News news) {
		int i = 0;
		String sql = "update news set id=?, title=?, content=?, publishtime=? where id=?";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			ps.setString(3, news.getPublishtime());
			ps.setInt(4, news.getId());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

}
