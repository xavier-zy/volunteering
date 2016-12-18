package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.Message;
import com.bbs.util.DBUtils;

public class MessageDao {

	// 通过id查询
	public static Message getMessageByMessageId(String id) {
		int i = 0;
		Message message = new Message();
		String sql = "select *from message where messageID=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				message.setUserName(rs.getString("userName"));
				message.setWriteDate(rs.getString("writeDate"));
				message.setContent(rs.getString("content"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return message;
		}
	}

	// 查询所有
	public static ArrayList<Message> getMessageAll() {
		int i = 0;
		Message message = null;
		String sql = "select *from message ";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<Message> messagelist = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			messagelist = new ArrayList<Message>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				message = new Message();
				message.setMessageID(rs.getInt("messageID"));
				message.setUserName(rs.getString("userName"));
				message.setWriteDate(rs.getString("writeDate"));
				message.setContent(rs.getString("content"));

				messagelist.add(message);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return messagelist;
		}
	}

	// 插入数据

	public static int addMessage(Message message) {
		int i = 0;
		String sql = "insert into message(userName,writeDate,content) values(?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, message.getUserName());
			ps.setString(2, message.getWriteDate());
			ps.setString(3, message.getContent());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	public static int deleteMessageById(String id) {
		int i = 0;
		String sql = "delete from activity where messageID =?";
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
	public static int updateMessage(Message message) {
		int i = 0;
		String sql = "update message set userName=?,writeDate=?,content=? where messageID=?";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, message.getUserName());
			ps.setString(2, message.getWriteDate());
			ps.setString(3, message.getContent());
			ps.setInt(4, message.getMessageID());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;

	}
}
