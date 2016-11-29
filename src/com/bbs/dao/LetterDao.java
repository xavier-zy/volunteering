package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.Letter;
import com.bbs.util.DBUtils;

public class LetterDao {

	// ͨ��id��ѯ
	public static Letter getLetteryBySendId(String id) {
		int i = 0;
		Letter letter = new Letter();
		String sql = "select *from letter where sendID=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				letter.setReceiveID(rs.getInt("receiveID"));
				letter.setContent(rs.getString("content"));
				letter.setPostDate(rs.getString("postDate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return letter;
		}
	}

	// ��ѯ����
	public static ArrayList<Letter> getLetterAll() {
		int i = 0;
		Letter letter = null;
		String sql = "select * from letter";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<Letter> letterlist = null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			letterlist = new ArrayList<Letter>();
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				letter = new Letter();
				letter.setSendID(rs.getInt("sendID"));
				letter.setReceiveID(rs.getInt("receiveID"));
				letter.setContent(rs.getString("content"));
				letter.setPostDate(rs.getString("postDate"));
				letterlist.add(letter);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;

		} else {
			return letterlist;
		}
	}

	// ��������
	public static int addLetter(Letter letter) {
		int i = 0;
		String sql = "insert into letter(receiveID,content,postDate) values(?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, letter.getReceiveID());
			ps.setString(2, letter.getContent());
			ps.setString(3, letter.getPostDate());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// ɾ��
	public static int deleteLetterById(String id) {
		int i = 0;
		String sql = "delete from letter where sendID =?";
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
	public static int updateLetter(Letter letter) {
		int i = 0;
		String sql = "update letter set receiveID=?,content=?,postDate=? where sendID=? ";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, letter.getReceiveID());
			ps.setString(2, letter.getContent());
			ps.setString(3, letter.getPostDate());
			ps.setInt(4, letter.getSendID());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
}
