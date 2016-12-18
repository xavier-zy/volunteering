package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Entity.UserInfo;
import com.Func.SqlStatement;

public class UserInfoHandler {

	public static UserInfo getUserInfoByUserId(int userId) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectByUserId(SqlStatement.USERINFO, userId);
		UserInfo userInfo = null;
		try {
			while (rs.next()) {
				number++;
				userInfo = new UserInfo();
				userInfo.setAge(rs.getInt("age"));
				userInfo.setPhone(rs.getString("phone"));
				userInfo.setAddress(rs.getString("address"));
				userInfo.setEmail(rs.getString("email"));
				userInfo.setGender(rs.getString("gender"));
				userInfo.setSignature(rs.getString("signature"));
//				userInfo.setUserName(rs.getString("username"));
				userInfo.setUserId(rs.getInt("userId"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (0 == number) {
			return null;
		} else {
			// System.out.println("username:"+tuserinfo.getUsername());
			return userInfo;
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<UserInfo> getAllUserInfo(){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectAll(SqlStatement.USERINFO);
		ArrayList<UserInfo> listUserInfo = new ArrayList<UserInfo>() ;
		UserInfo userInfo=null;
		try {
			while (rs.next()) {
					number++;
					userInfo=new UserInfo();
					userInfo.setAge(rs.getInt("age"));
					userInfo.setPhone(rs.getString("phone"));
					userInfo.setAddress(rs.getString("address"));
					userInfo.setEmail(rs.getString("email"));
					userInfo.setGender(rs.getString("gender"));
					userInfo.setSignature(rs.getString("signature"));
//					userInfo.setUserName(rs.getString("username"));
					userInfo.setUserId(rs.getInt("userId"));
					listUserInfo.add(userInfo);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (0==number) {
				return null;
			}else{
				return listUserInfo;
			}
		}
	}
	
	@SuppressWarnings("finally")
	public static int addUserInfo(UserInfo userInfo){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.insertIntoTable(SqlStatement.USERINFO, userInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
	
	@SuppressWarnings("finally")
	public static int updateUserInfo(UserInfo userInfo){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.updateTable(SqlStatement.USERINFO, userInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
		
	}
	
	@SuppressWarnings("finally")
	public static int deleteUserInfo(int id){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.deleteByUserId(SqlStatement.USERINFO, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}

}
