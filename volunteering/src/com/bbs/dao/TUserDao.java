package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bbs.bean.TUser;
import com.bbs.util.DBUtils;

public class TUserDao {
	public TUser getTUser(String userName,String password){
		int i=0;
		TUser tuser = new TUser();
		String sql = "SELECT T.Level,T.Lastlogin,T.nickname,T.userName,T.headImg,T.userId from TUSER T WHERE T.USERNAME=? and T.password=?";
		Connection conn = DBUtils.getInstance().getConnction();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				i++;
				tuser.setLevel(rs.getString("level"));				
				tuser.setLastlogin(rs.getDate("Lastlogin"));
				tuser.setNickname(rs.getString("nickname"));
				tuser.setUserName(rs.getString("userName"));
				tuser.setHeadImg(rs.getString("headImg"));
				tuser.setUserIde(rs.getInt("userId"));

			}
			sql="UPDATE TUSER SET Lastlogin=now() WHERE username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			int rs2 = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i==0){
			return null;
		}
		else{
		return tuser;
		}
	}
	public static TUser getTUserById(String id){
		int i=0;
		TUser tuser = new TUser();
		String sql = "SELECT T.Level,T.Lastlogin,T.nickname,T.userName,T.password from TUSER T WHERE T.userId=?";
		Connection conn = DBUtils.getInstance().getConnction();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				i++;
				tuser.setLevel(rs.getString("level"));				
				tuser.setLastlogin(new java.util.Date(rs.getDate("Lastlogin").getTime()));
				tuser.setNickname(rs.getString("nickname"));
				tuser.setUserName(rs.getString("userName"));
				tuser.setPassword(rs.getString("password"));
				tuser.setHeadImg(rs.getString("headImg"));
				tuser.setUserIde(rs.getInt("userId"));
				System.out.println(rs.getInt("userId"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i==0){
			return null;
		}
		else{
		return tuser;
		}
	}
}