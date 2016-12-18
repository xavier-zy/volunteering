package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.BackThoughts;
import com.bbs.util.DBUtils;

public class BackThoughsDao {

	// 通过id查询
	public static BackThoughts getBackThoughsByBackId(String id) {
		int i = 0;
		BackThoughts backThoughts = new BackThoughts();
		String sql = "select *from backthoughts where Backid=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				backThoughts.setBt_id(rs.getInt("bt_id"));
				backThoughts.setThoughtsID(rs.getString("thoughtsID"));
				backThoughts.setBackContent(rs.getString("backContent"));
				backThoughts.setBackDate(rs.getString("backDate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return backThoughts;
		}
	}

	// 查询所有
	public static ArrayList<BackThoughts> getBackThoughtsAll() {
		int i = 0;
		BackThoughts backThoughts = null;
		String sql = "select *from backthoughts ";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<BackThoughts> backThoughtslist = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			backThoughtslist = new ArrayList<BackThoughts>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				backThoughts = new BackThoughts();
				backThoughts.setBackid(rs.getInt("backid"));
				backThoughts.setBt_id(rs.getInt("bt_id"));
				backThoughts.setThoughtsID(rs.getString("thoughtsID"));
				backThoughts.setBackContent(rs.getString("backContent"));
				backThoughts.setBackDate(rs.getString("backDate"));

				backThoughtslist.add(backThoughts);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return backThoughtslist;
		}
	}

	// 插入数据
	public static int addBackThoughts(BackThoughts backThoughts) {
		int i = 0;
		String sql = "insert into backthoughts(bt_id,thoughtsID,backContent,backDate) values(?,?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, backThoughts.getBt_id());
			ps.setString(2, backThoughts.getThoughtsID());
			ps.setString(3, backThoughts.getBackContent());
			ps.setString(4, backThoughts.getBackDate());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	public static int deleteBackThoughtsById(String id) {
		int i = 0;
		String sql = "delete from backthoughts where Backid =?";
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

	// 更新
	public static int updateBackThoughts(BackThoughts backThoughts) {
		int i = 0;
		String sql = "update backthoughts set bt_id=?,thoughtsID=?,backContent=?,backDate=? where Backid=?";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, backThoughts.getBt_id());
			ps.setString(2, backThoughts.getThoughtsID());
			ps.setString(3, backThoughts.getBackContent());
			ps.setString(4, backThoughts.getBackDate());
			ps.setInt(5, backThoughts.getBackid());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
}
