package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Entity.Comment;

import com.DBUtil.DBUtil;

public class CommentHandler {
	
//	public static void main(String[] args) {
//		ArrayList<Comment> comment_test = selectComment(22);
//		for(int i = 0;i < comment_test.size();i++){ 
//			System.out.println(comment_test.get(i).getUserName());
//		}
//	}
//	
	public static ArrayList<Comment> getCommentsByStoryId(String storyId) {
		int i = 0;
		Comment comment = null;
		String sql = "SELECT * FROM comment WHERE storyId =" + storyId;
		
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		ArrayList<Comment> commentsList = null;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			commentsList = new ArrayList<Comment>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				comment = new Comment();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setReplyId(rs.getInt("replyId"));
				comment.setStoryId(rs.getInt("storyId"));
				comment.setUserName(rs.getString("userName"));
				comment.setCommentTime(rs.getString("commentTime"));
				comment.setCommentContent(rs.getString("commentContent"));

				commentsList.add(comment);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return commentsList;
		}
	}

	public static void addComment(int storyId, String userName, int replyId, String commentContent){
		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();
		
		String insertSQL = "INSERT INTO comment(storyId, userName, replyId, commentContent, commentTime) values(?,?,?,?,now());";
		
		try {
			PreparedStatement ps = conn.prepareStatement(insertSQL);
			ps.setInt(1, storyId);
			ps.setString(2, userName);
			ps.setInt(3, replyId);
			ps.setString(4, commentContent);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	public static ArrayList<Comment> selectComment(int goods_id){
//		DBUtil util = new DBUtil();
//		Connection conn = util.getConnection();
//		ArrayList<Comment> comment_list = new ArrayList<Comment>();
//		int comment_id;
//		String user_name;
//		int reply_id;
//		String comment_detail;
//		String comment_picture;
//		String comment_date;
//		
//		String selectSQL = "select comment_id, user_name, reply_id, comment_detail, comment_picture, comment_date from comment_table where goods_id = ?";
//		
//		try {
//			PreparedStatement ps = conn.prepareStatement(selectSQL);
//			ps.setInt(1, goods_id);
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()){
//				comment_id = rs.getInt("comment_id");
//				user_name = rs.getString("user_name");
//				reply_id = rs.getInt("reply_id");
//				comment_detail = rs.getString("comment_detail");
//				comment_picture = rs.getString("comment_picture");
//				comment_date = rs.getString("comment_date");
//				Comment comment_temp = new Comment(comment_id, goods_id, user_name, reply_id, comment_detail, comment_picture, comment_date);
//				comment_list.add(comment_temp);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return comment_list;
//	}
}
