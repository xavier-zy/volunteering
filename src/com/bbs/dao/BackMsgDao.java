package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.BackMsg;
import com.bbs.util.DBUtils;

public class BackMsgDao {

	// 通过id查询
	public static BackMsg getBackMsgByBackMsgId(String id) {
		int i = 0;
		BackMsg backMsg = new BackMsg();
		String sql = "select *from backmsg where backMsgID=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				backMsg.setBm_id(rs.getInt("bm_id"));
				backMsg.setMsgID(rs.getString("msgID"));
				backMsg.setBackContent(rs.getString("backContent"));
				backMsg.setBackdate(rs.getString("backdate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return backMsg;
		}
	}

	// 查询所有
	public static ArrayList<BackMsg> getActibvityAll() {
		int i = 0;
		BackMsg backMsg = null;
		String sql = "select *from backmsg ";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<BackMsg> backMsglist = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			backMsglist = new ArrayList<BackMsg>();

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
				backMsg = new BackMsg();
				backMsg.setBackMsgID(rs.getInt("backMsgID"));
				backMsg.setBm_id(rs.getInt("bm_id"));
				backMsg.setMsgID(rs.getString("msgID"));
				backMsg.setBackContent(rs.getString("backContent"));
				backMsg.setBackdate(rs.getString("backdate"));
				backMsglist.add(backMsg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return backMsglist;
		}
	}

	// 插入数据
	public static int addBackMsg(BackMsg backMsg) {
		int i = 0;
		String sql = "insert into backmsg(bm_id,msgID,backContent,backdate) values(?,?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, backMsg.getBm_id());
			ps.setString(2, backMsg.getMsgID());
			ps.setString(3, backMsg.getBackContent());
			ps.setString(4, backMsg.getBackdate());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	public static int deleteBackMsgById(String id) {
		int i = 0;
		String sql = "delete from backmsg where backMsgID =?";
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
	public static int updateBackMsg(BackMsg backMsg) {
		int i = 0;
		String sql = "update backmsg set bm_id=?,msgID=?,backContent=?,backdate=? where backMsgID=? ";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, backMsg.getBm_id());
			ps.setString(2, backMsg.getMsgID());
			ps.setString(3, backMsg.getBackContent());
			ps.setString(4, backMsg.getBackdate());
			ps.setInt(5, backMsg.getBackMsgID());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
}
