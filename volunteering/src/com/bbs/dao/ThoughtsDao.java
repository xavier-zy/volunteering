/**
 * 
 */
package com.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import com.bbs.bean.MyActivity;
import com.bbs.bean.Thoughts;
import com.bbs.lib.SqlStatement;
import com.bbs.lib.ThoughtsSortByDate;

/**
 * @author IvanYe
 *
 */
public class ThoughtsDao {
	@SuppressWarnings("finally")
	public static Thoughts getThoughtsById(int id){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectOneById(SqlStatement.THOUGHTS, id);
		Thoughts thoughts = new Thoughts();
		try {
			while (rs.next()) {
			number++;
			thoughts.setId(rs.getInt("id"));
			thoughts.setUserId(rs.getInt("userId"));
			thoughts.setThoughtsTitle(rs.getString("thoughtsTitle"));
			thoughts.setThoughtsContent(rs.getString("thoughtsContent"));
			thoughts.setPublishTime(rs.getString("publishTime"));
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
				return thoughts;
			}
		}
		
	}
	
	/**
	 * ��ȡ���е�MyActivity��Ϣ
	 * @return ArrayList
	 */
	@SuppressWarnings("finally")
	public static ArrayList<Thoughts> getAllThoughts(){
		int number=0;
		ResultSet rs = (ResultSet) SqlStatement.selectAll(SqlStatement.THOUGHTS);
		ArrayList<Thoughts> listThoughts = new ArrayList<Thoughts>() ;
		try {
			while (rs.next()) {
					number++;
					Thoughts thoughts=new Thoughts();
					thoughts.setId(rs.getInt("id"));
					thoughts.setUserId(rs.getInt("userId"));
					thoughts.setThoughtsTitle(rs.getString("thoughtsTitle"));
					thoughts.setThoughtsContent(rs.getString("thoughtsContent"));
					thoughts.setPublishTime(rs.getString("publishTime"));
					listThoughts.add(thoughts);
				}
			Collections.sort(listThoughts,new ThoughtsSortByDate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (0==number) {
				return null;
			}else{
				return listThoughts;
			}
		}
	}
	
	/**
	 * ��MyActivity���в���һ������
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int addThoughts(Thoughts Thoughts){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.insert(SqlStatement.THOUGHTS, Thoughts);
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
	public static int updateThoughts(Thoughts Thoughts){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.updateById(SqlStatement.THOUGHTS, Thoughts);
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
	public static int deleteThoughts(int id){
		int rowNumber=0;
		try {
			rowNumber=SqlStatement.deleteById(SqlStatement.THOUGHTS , id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return rowNumber;
		}
	}
}
