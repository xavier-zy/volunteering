/**
 * 
 */
package com.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import com.bbs.bean.TUserInfo;
import com.bbs.lib.*;
/**
 * @author IvanYe
 *
 */
public class TUserInfoDao {
	/**
	 * �����û�id��ȡһ��tuserinfo
	 * @param id
	 * @return TUserInfo
	 */
	@SuppressWarnings("finally")
	public static TUserInfo getUserInfoByUserId(int id){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectOne(SqlStatement.TUSERINFO, id);
		TUserInfo tuserinfo=null;
		try {
			while (rs.next()) {
				number++;
				tuserinfo = new TUserInfo();
				tuserinfo.setId(rs.getInt("id"));
				tuserinfo.setAge(rs.getInt("age"));
				tuserinfo.setPhone(rs.getString("phone"));
				tuserinfo.setTime(rs.getString("time"));
				tuserinfo.setAddress(rs.getString("address"));
				tuserinfo.setEmail(rs.getString("email"));
				tuserinfo.setGender(rs.getString("gender"));
				tuserinfo.setSignature(rs.getString("signature"));
				tuserinfo.setUsername(rs.getString("username"));
				tuserinfo.setUserId(rs.getInt("userId"));
				tuserinfo.setDepartment(rs.getString("department"));
				tuserinfo.setRealname(rs.getString("realname"));
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
				return tuserinfo;
			}
		}
		
	}
	
	/**
	 * ��ȡ���е�TUserInfo��Ϣ
	 * @return ArrayList
	 */
	@SuppressWarnings("finally")
	public static ArrayList<TUserInfo> getAllUserInfo(){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectAll(SqlStatement.TUSERINFO);
		ArrayList<TUserInfo> listTUserInfo = new ArrayList<TUserInfo>() ;
		TUserInfo tuserinfo=null;
		try {
			while (rs.next()) {
					number++;
					tuserinfo=new TUserInfo();
					tuserinfo.setId(rs.getInt("id"));
					tuserinfo.setAge(rs.getInt("age"));
					tuserinfo.setPhone(rs.getString("phone"));
					tuserinfo.setTime(rs.getString("time"));
					tuserinfo.setAddress(rs.getString("address"));
					tuserinfo.setEmail(rs.getString("email"));
					tuserinfo.setGender(rs.getString("gender"));
					tuserinfo.setSignature(rs.getString("signature"));
					tuserinfo.setUsername(rs.getString("username"));
					tuserinfo.setUserId(rs.getInt("userId"));
					tuserinfo.setDepartment(rs.getString("department"));
					tuserinfo.setRealname(rs.getString("realname"));
					listTUserInfo.add(tuserinfo);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (0==number) {
				return null;
			}else{
				return listTUserInfo;
			}
		}
	}
	
	/**
	 * ��tuserinfo���в���һ������
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int addTUserInfo(TUserInfo tuserinfo){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.insert(SqlStatement.TUSERINFO, tuserinfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
	
	/**
	 * ����tuerinfo���е�����
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int updateTUserInfo(TUserInfo tuserinfo){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.update(SqlStatement.TUSERINFO, tuserinfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
		
	}
	
	/**
	 * ����idɾ��tuserinfo���е�һ����¼
	 * @param id
	 * @return int ɾ����¼������
	 */
	@SuppressWarnings("finally")
	public static int deleteTUserInfo(int id){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.delete(SqlStatement.TUSERINFO, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
}
