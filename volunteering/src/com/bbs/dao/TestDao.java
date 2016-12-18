/**
 * 
 */
package com.bbs.dao;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.junit.Test;

import com.bbs.bean.Activity;
import com.bbs.bean.TUser;
import com.bbs.bean.TUserInfo;
import com.bbs.lib.SqlStatement;

/**
 * @author IvanYe
 *
 */
public class TestDao {

	@Test
	public void test() {
//		TUserInfo tuserinfo=new TUserInfo();
//		tuserinfo.setAddress("Shanghai Jiading");
//		tuserinfo.setAge(20);
////		System.out.println("Age:"+tuserinfo.getAge());
//		tuserinfo.setEmail("1542403623@qq.com");
//		tuserinfo.setGender("male");
//		tuserinfo.setPhone("15221629681");
//		tuserinfo.setSignature("Welcome!");
//		tuserinfo.setTime("20150704173752");
////		System.out.println("Time:"+tuserinfo.getTime());
//		tuserinfo.setUsername("IvanYe");
////		tuserinfo.setId(1);
//		tuserinfo.setUserId(1);
////		TUserInfoDao.getUserInfoByUserId(12345);
//		//插入
//		int addNumber=TUserInfoDao.addTUserInfo(tuserinfo);
//		if (0==addNumber) {
//			System.out.println("Add Error");
//		}else{
//			System.out.println("AddNumber:"+addNumber);
//		}
//		//选择一个
//		TUserInfo tuser = TUserInfoDao.getUserInfoByUserId(1); 
//		if (tuser==null) {
//			System.out.println("Select One Error");
//		}else{
//			System.out.println("Username:"+tuser.getUsername());
//		}
//		//选择全部
//		ArrayList<TUserInfo> tuserinfolist = TUserInfoDao.getAllUserInfo();
//		if (null==tuserinfolist) {
//			System.out.println("Select All Error");
//		}else{
//			System.out.println("Rows:"+tuserinfolist.size());
//		}
//		//修改
//		TUserInfo tuserinfo2=new TUserInfo();
//		tuserinfo2.setAddress("Shanghai Jiading");
//		tuserinfo2.setAge(20);
//		
//		tuserinfo2.setEmail("1542403623@qq.com");
//		tuserinfo2.setGender("male");
//		tuserinfo2.setPhone("15221629681");
//		tuserinfo2.setSignature("Welcome!");
//		tuserinfo2.setTime("20150704173752");
//		tuserinfo2.setUsername("IvanYe2");
////		tuserinfo2.setId(1);
//		tuserinfo2.setUserId(1);
//		try {
//			int updateNumber=SqlStatement.update(SqlStatement.TUSERINFO,tuserinfo2);
//			if (0==updateNumber) {
//				System.out.println("Update Error");
//			}else{
//				System.out.println("UpdateRows:"+updateNumber);
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		//删除
//		try {
//			int deleteNumber=SqlStatement.delete(SqlStatement.TUSERINFO, 1);
//			if (0==deleteNumber) {
//				System.out.println("Delete Error");
//			}else{
//				System.out.println("DeleteNumber:"+deleteNumber);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//测试getUserByActivityIdDao
//		try {
//			ArrayList<TUser> tuserlist= ActivityDao.getUserByActivityId(100011);
//			for(TUser tuser:tuserlist){
//	        
//				System.out.println("Tuser:"+tuser.getNickname());
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//测试getActivityByAdminIdDao
		ArrayList<Activity> activitylist;
		try {
			activitylist = ActivityDao.getActivityByAdminId(1000000);
			for(Activity activity:activitylist){
				System.out.println("ActivityTitle:"+activity.getTitile());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
