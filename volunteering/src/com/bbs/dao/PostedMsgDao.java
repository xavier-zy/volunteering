/**
 * 
 */
package com.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.MyActivity;
import com.bbs.bean.PostedMsg;
import com.bbs.lib.SqlStatement;

/**
 * @author IvanYe
 *
 */
public class PostedMsgDao {
	@SuppressWarnings("finally")
	public static PostedMsg getPostMsgById(int id){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectOneById(SqlStatement.POSTEDMSG, id);
		PostedMsg postedmsg = new PostedMsg();
		try {
			while (rs.next()) {
			number++;
			postedmsg.setId(rs.getInt("id"));
			postedmsg.setPostContent(rs.getString("postContent"));
			postedmsg.setPostTitle(rs.getString("postTitle"));
			postedmsg.setPublishTime(rs.getString("publishTime"));
			postedmsg.setUserId(rs.getInt("userId"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if (0==number) {
				return null;
			}else{
//				System.out.println("username:"+tuserinfo.getUsername());
				return postedmsg;
			}
		}
		
	}
	
	/**
	 * 获取所有的MyActivity信息
	 * @return ArrayList
	 */
	@SuppressWarnings("finally")
	public static ArrayList<PostedMsg> getAllPostedMsg(){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectAll(SqlStatement.POSTEDMSG);
		ArrayList<PostedMsg> listPostedMsg = new ArrayList<PostedMsg>() ;
		PostedMsg postedmsg=null;
		try {
			while (rs.next()) {
					number++;
					postedmsg=new PostedMsg();
					postedmsg.setId(rs.getInt("id"));
					postedmsg.setPostContent(rs.getString("postContent"));
					postedmsg.setPostTitle(rs.getString("postTitle"));
					postedmsg.setPublishTime(rs.getString("publishTime"));
					postedmsg.setUserId(rs.getInt("userId"));
					listPostedMsg.add(postedmsg);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (0==number) {
				return null;
			}else{
				return listPostedMsg;
			}
		}
	}
	
	/**
	 * 向MyActivity表中插入一条数据
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int addPostedMsg(PostedMsg PostedMsg){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.insert(SqlStatement.POSTEDMSG, PostedMsg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
	
	/**
	 * 更新tuerinfo表中的数据
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int updatePostedMsgy(PostedMsg PostedMsg){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.updateById(SqlStatement.POSTEDMSG, PostedMsg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
		
	}
	
	/**
	 * 根据id删除tuserinfo表中的一条记录
	 * @param id
	 * @return int 删除记录的条数
	 */
	@SuppressWarnings("finally")
	public static int deletePostedMsg(int id){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.deleteById(SqlStatement.POSTEDMSG , id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
}
