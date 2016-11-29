/**
 * 
 */
package com.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;

import com.bbs.bean.Activity;
import com.bbs.bean.MyActivity;
import com.bbs.bean.TUserInfo;
import com.bbs.lib.SqlStatement;
import com.bbs.util.DBUtils;

/**
 * @author IvanYe
 *
 */
public class MyActivityDao {
	@SuppressWarnings("finally")
	public static MyActivity getMyActivityById(int id){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectOne(SqlStatement.MYACTIVITY, id);
		MyActivity myactivity = new MyActivity();
		try {
			while (rs.next()) {
			number++;
			myactivity.setId(rs.getInt("id"));
			myactivity.setUserId(rs.getInt("userId"));
			myactivity.setActivityId(rs.getInt("activityId"));
			myactivity.setActivityStatus("activityStatus");
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
				return myactivity;
			}
		}
		
	}
	
	/**
	 * 获取所有的MyActivity信息
	 * @return ArrayList
	 */
	@SuppressWarnings("finally")
	public static ArrayList<MyActivity> getAllMyActivity(int id){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectAllByUserId(SqlStatement.MYACTIVITY,id);
		ArrayList<MyActivity> listMyActivity = new ArrayList<MyActivity>() ;
		MyActivity myactivity=null;
		try {
			while (rs.next()) {
					number++;
					myactivity=new MyActivity();
					myactivity.setId(rs.getInt("id"));
					myactivity.setUserId(rs.getInt("userId"));
					myactivity.setActivityId(rs.getInt("activityId"));
					myactivity.setActivityStatus("activityStatus");
					
					listMyActivity.add(myactivity);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (0==number) {
				return null;
			}else{
				return listMyActivity;
			}
		}
	}
	
	/**
	 * 向MyActivity表中插入一条数据
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int addMyActivity(MyActivity myactivity){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.insert(SqlStatement.MYACTIVITY, myactivity);
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
	public static int updateMyActivity(MyActivity myactivity){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.updateById(SqlStatement.MYACTIVITY, myactivity);
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
	public static int deleteMyActivity(int id){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.deleteById(SqlStatement.MYACTIVITY , id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
	
	public static Map<Integer,Activity> getMyActivityByUserId(int id) throws SQLException{
		String sql="Select "+SqlStatement.ACTIVITY+".activityId,activityDate,deadline,address,number,organizator,state,introduction,title,index2,adminid,"+SqlStatement.MYACTIVITY+".id from "+SqlStatement.MYACTIVITY+","+SqlStatement.ACTIVITY+" where "+SqlStatement.MYACTIVITY+".userId="+id+" and "+SqlStatement.ACTIVITY+".activityId="+SqlStatement.MYACTIVITY+".activityId";
		Connection conn = DBUtils.getInstance().getConnction();
		PreparedStatement ps = conn.prepareStatement(sql);
		Map<Integer,Activity> map=new Hashtable<Integer,Activity>();
		ResultSet rs = (ResultSet)ps.executeQuery();
		while(rs.next()){
			Activity activity=new Activity();
			activity.setActivityDate(rs.getString("activityId"));
			activity.setActivityId(Integer.parseInt(rs.getString("activityId")));
			activity.setAddress(rs.getString("address"));
			activity.setDeadline(rs.getString("deadline"));
			activity.setIndex2(Integer.parseInt(rs.getString("index2")));
			activity.setIntroduction(rs.getString("introduction"));
			activity.setNumber(Integer.parseInt(rs.getString("number")));
			activity.setOrganizator(rs.getString("organizator"));
			activity.setState(rs.getString("state"));
			activity.setTitile(rs.getString("title"));
			System.out.println(Integer.parseInt(rs.getString("id")));
			try{
			map.put(Integer.parseInt(rs.getString("id")), activity);
			}catch(Exception e){
			//todo
			}
		}
		System.out.println(map);
		return map;
	}
	
}
