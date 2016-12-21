package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;

import com.DBUtil.DBUtil;
import com.Entity.Events;
import com.Entity.MyEvents;
import com.Func.SqlStatement;

public class MyEventsHandler {

	@SuppressWarnings("finally")
	public static MyEvents getMyEventByUserId(int id) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectByUserId(SqlStatement.MYEVENTS, id);
		MyEvents myEvent = new MyEvents();
		try {
			while (rs.next()) {
				number++;
				myEvent.setUserId(rs.getInt("userId"));
				myEvent.setEventId(rs.getInt("eventId"));
				myEvent.setEventStatus("eventStatus");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (0 == number) {
				return null;
			} else {
				// System.out.println("username:"+tuserinfo.getUsername());
				return myEvent;
			}
		}

	}

	@SuppressWarnings("finally")
	public static ArrayList<MyEvents> getAllMyEvents(int id) {
		int number = 0;
		ResultSet rs = (ResultSet) SqlStatement.selectAllByUserId(SqlStatement.MYEVENTS, id);
		ArrayList<MyEvents> listMyEvents = new ArrayList<MyEvents>();
		MyEvents myEvent = null;
		try {
			while (rs.next()) {
				number++;
				myEvent = new MyEvents();
				myEvent.setUserId(rs.getInt("userId"));
				myEvent.setEventId(rs.getInt("eventId"));
				myEvent.setEventStatus("eventStatus");

				listMyEvents.add(myEvent);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (0 == number) {
				return null;
			} else {
				return listMyEvents;
			}
		}
	}

	/**
	 * ��MyActivity���в���һ������
	 * 
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int addMyEvent(MyEvents myEvent) {
		
		int rowNumber = 0;
		try {
			rowNumber = SqlStatement.insertIntoTable(SqlStatement.MYEVENTS, myEvent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rowNumber;
		}
	}

	/**
	 * ����tuerinfo���е�����
	 * 
	 * @param tuserinfo
	 * @return
	 */
	@SuppressWarnings("finally")
	public static int updateMyEvents(MyEvents myEvent) {
		int rowNumber = 0;
		try {
			rowNumber = SqlStatement.updateById(SqlStatement.MYEVENTS, myEvent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rowNumber;
		}

	}

	/**
	 * ����idɾ��tuserinfo���е�һ����¼
	 * 
	 * @param id
	 * @return int ɾ����¼������
	 */
	@SuppressWarnings("finally")
	public static int deleteMyEvent(int id) {
		int rowNumber = 0;
		try {
			rowNumber = SqlStatement.deleteById(SqlStatement.MYEVENTS, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rowNumber;
		}
	}

	public static Map<Integer, Events> getMyEventsByUserId(int userId) throws SQLException {
		String sql = " SELECT " + SqlStatement.EVENTS + ".eventId," + SqlStatement.EVENTS + ".eventDate," 
							   + SqlStatement.EVENTS + ".state," + SqlStatement.EVENTS + ".introduction," 
							   + SqlStatement.EVENTS + ".title," + SqlStatement.EVENTS + ".index2" 
						
				+ " FROM " + SqlStatement.MYEVENTS + "," + SqlStatement.EVENTS 
				+ " WHERE " + SqlStatement.MYEVENTS + ".userId=" + userId
				+ " AND " + SqlStatement.EVENTS + ".eventId=" + SqlStatement.MYEVENTS + ".eventId";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		PreparedStatement ps = conn.prepareStatement(sql);
		Map<Integer, Events> map = new Hashtable<Integer, Events>();
		ResultSet rs = (ResultSet) ps.executeQuery();
		
		int i = 0;
		
		while (rs.next()) {
			i++;
			Events event = new Events();
			event.setEventDate(rs.getString("eventDate"));
			event.setEventId(Integer.parseInt(rs.getString("eventId")));
			event.setIndex2(Integer.parseInt(rs.getString("index2")));
			event.setIntroduction(rs.getString("introduction"));
			event.setState(rs.getInt("state"));
			event.setTitle(rs.getString("title"));

			try {
				map.put(i, event);
			} catch (Exception e) {
				// todo
			}
		}
		System.out.println(map);
		return map;
	}

}
