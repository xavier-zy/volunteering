package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import com.bbs.bean.Activity;
import com.bbs.bean.TUser;
import com.bbs.lib.ActivitySortByDate;
import com.bbs.util.DBUtils;

public class ActivityDao {
	

	// 通过ID查询
	public static Activity getActivityByActivityId(String id) {
		int i = 0;
		Activity activity = new Activity();
		String sql = "select *from activity where activityId=?";
		Connection conn = DBUtils.getInstance().getConnction();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				activity.setActivityDate(rs.getString("activityDate"));
				activity.setDeadline(rs.getString("deadline"));
				activity.setAddress(rs.getString("address"));
				activity.setNumber(rs.getInt("number"));
				activity.setOrganizator(rs.getString("organizator"));
				activity.setState(rs.getString("state"));
				activity.setIntroduction(rs.getString("introduction"));
				activity.setTitile(rs.getString("title"));
				activity.setIndex2(rs.getInt("index2"));
				activity.setAdminid(rs.getInt("adminid"));
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return activity;
		}
	}

	// 查询所有活动
	public static ArrayList<Activity> getActibvityAll() {
		int i = 0;
		Activity activity = null;
		String sql = "select *from activity ";
		Connection conn = DBUtils.getInstance().getConnction();
		ArrayList<Activity> activitylist = null;
		

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			activitylist = new ArrayList<Activity>();

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
				activity = new Activity();
				activity.setActivityId(rs.getInt("activityId"));
				activity.setActivityDate(rs.getString("activityDate"));
				activity.setDeadline(rs.getString("deadline"));
				activity.setAddress(rs.getString("address"));
				activity.setNumber(rs.getInt("number"));
				activity.setOrganizator(rs.getString("organizator"));
				activity.setState(rs.getString("state"));
				activity.setIntroduction(rs.getString("introduction"));
				activity.setTitile(rs.getString("title"));
				activity.setIndex2(rs.getInt("index2"));
				activity.setAdminid(rs.getInt("adminid"));

				activitylist.add(activity);
				
			}
			Collections.sort(activitylist,new ActivitySortByDate());

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i == 0) {
			return null;
		} else {
			return activitylist;
		}
	}

	// 增加一个活动
	public static int addActivity(Activity activity) {
		int i = 0;
		String sql = "insert into activity(activityDate,deadline,address,number,organizator,state,introduction,title,index2,adminid) values(?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, activity.getActivityDate());
			ps.setString(2, activity.getDeadline());
			ps.setString(3, activity.getAddress());
			ps.setInt(4, activity.getNumber());
			ps.setString(5, activity.getOrganizator());
			ps.setString(6, activity.getState());
			ps.setString(7, activity.getIntroduction());
			ps.setString(8, activity.getTitile());
			ps.setInt(9, activity.getIndex2());
			ps.setInt(10, activity.getAdminid());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 删除
	public static int deleteActivityById(String id) {
		int i = 0;
		String sql = "delete from activity where activityID =?";
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
//更新
	public static int updateActivity(Activity activity) {
		int i = 0;
		String sql = "UPDATE activity set activityDate=?, deadline=?, address=?, number=?, organizator=?, state=?, introduction=?, title=?, index2=? adminid=? where activityID=?";
		Connection conn = DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, activity.getActivityDate());
			ps.setString(2, activity.getDeadline());
			ps.setString(3, activity.getAddress());
			ps.setInt(4, activity.getNumber());
			ps.setString(5, activity.getOrganizator());
			ps.setString(6, activity.getState());
			ps.setString(7, activity.getIntroduction());
			ps.setString(8, activity.getTitile());
			ps.setInt(9, activity.getIndex2());
			ps.setInt(10, activity.getActivityId());
			ps.setInt(11, activity.getAdminid());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public static ArrayList<TUser> getUserByActivityId(int id) throws SQLException{
		String sql="select TUSER.userId,userName,password,level,nickname,headImg from TUSER,myactivity where myactivity.activityId="+id+" and TUSER.userId=myactivity.userId";
		System.out.println("Sql:"+sql);
		Connection conn = DBUtils.getInstance().getConnction();
		PreparedStatement ps = conn.prepareStatement(sql);
		ArrayList<TUser> listtuser=new ArrayList<TUser>();
		ResultSet rs = (ResultSet)ps.executeQuery();
		while(rs.next()){
			TUser tuser=new TUser();
			tuser.setHeadImg(rs.getString("headImg"));
//			tuser.setLastlogin(rs.getString("lastLogin"));
			tuser.setLevel(rs.getString("level"));
			tuser.setNickname(rs.getString("nickname"));
			tuser.setPassword(rs.getString("password"));
			tuser.setUserIde(Integer.parseInt(rs.getString("userId")));;
			tuser.setUserName(rs.getString("userName"));
			
			listtuser.add(tuser);
//			System.out.println("tuser:"+tuser.getNickname());
		}
		return listtuser;
	}
	
	public static ArrayList<Activity> getActivityByAdminId(int adminid) throws SQLException{
		String sql="select *from activity where adminid="+adminid;
		System.out.println("Sql:"+sql);
		Connection conn = DBUtils.getInstance().getConnction();
		PreparedStatement ps = conn.prepareStatement(sql);
//		ArrayList<TUser> listtuser=new ArrayList<TUser>();
		ArrayList<Activity> activityList=new ArrayList<Activity>();
		ResultSet rs = (ResultSet)ps.executeQuery();
		while(rs.next()){
			Activity activity=new Activity();
			activity.setActivityDate(rs.getString("activityDate"));
			activity.setActivityId(Integer.parseInt(rs.getString("activityID")));
			activity.setAddress(rs.getString("address"));
			activity.setDeadline(rs.getString("deadline"));
			activity.setIndex2(Integer.parseInt(rs.getString("index2")));
			activity.setIntroduction(rs.getString("introduction"));
			activity.setNumber(Integer.parseInt(rs.getString("number")));
			activity.setOrganizator(rs.getString("organizator"));
			activity.setState(rs.getString("state"));
			activity.setTitile(rs.getString("title"));
			activityList.add(activity);
		}
		return activityList;
	}
}
