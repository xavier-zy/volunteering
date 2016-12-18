package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Collections;

import com.DBUtil.DBUtil;
import com.Entity.Events;
//import com.Entity.User;

public class EventsHandler {

		// 通过ID查询
		public static Events getEventByEventId(String id) {
			int i = 0;
			Events event = new Events();
			String sql = "SELECT * FROM events WHERE eventId=?";
			
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, id);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					i++;
					event.setEventDate(rs.getString("eventDate"));
					event.setState(rs.getInt("state"));
					event.setIntroduction(rs.getString("introduction"));
					event.setTitle(rs.getString("title"));
					event.setIndex2(rs.getInt("index2"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (i == 0) {
				return null;
			} else {
				return event;
			}
		}

		// 查询所有活动
		public static ArrayList<Events> getAllEvents() {
			int i = 0;
			Events event = null;
			String sql = "SELECT * FROM events";
			
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			
			ArrayList<Events> eventlist = null;

			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				eventlist = new ArrayList<Events>();

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					i++;
					event = new Events();
					event.setEventId(rs.getInt("eventId"));
//					activity.setActivityDate(rs.getString("activityDate"));
//					activity.setDeadline(rs.getString("deadline"));
//					activity.setAddress(rs.getString("address"));
//					activity.setNumber(rs.getInt("number"));
//					activity.setOrganizator(rs.getString("organizator"));
					event.setState(rs.getInt("state"));
//					activity.setIntroduction(rs.getString("introduction"));
					event.setTitle(rs.getString("title"));
//					activity.setIndex2(rs.getInt("index2"));
//					activity.setAdminid(rs.getInt("adminid"));

					eventlist.add(event);

				}
//				Collections.sort(eventlist, new EventSortByDate());

			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (i == 0) {
				return null;
			} else {
				return eventlist;
			}
		}

		// 增加一个活动
		public static int addEvent(Events event) {
			int i = 0;
			String sql = "INSERT INTO events(title,introduction,eventDate,state,index2) VALUES(?,?,?,?,?,?)";
			
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, event.getTitle());
				ps.setString(2, event.getIntroduction());
				ps.setString(3, event.getEventDate());
				ps.setInt(4, event.getState());
				ps.setInt(5, event.getIndex2());
				i = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return i;
		}

		// 删除
		public static int deleteEventById(String id) {
			int i = 0;
			String sql = "DELETE FROM event WHERE eventId =?";
			
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				i = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return i;
		}

		// 更新
		public static int updateEvents(Events event) {
			int i = 0;
			String sql = "UPDATE events SET title=?, introduction=?, eventDate=?, state=?, index2=? WHERE eventId=?";
			
			DBUtil util = new DBUtil();
			Connection conn = util.getConnection();
			
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, event.getTitle());
				ps.setString(2, event.getIntroduction());
				ps.setString(3, event.getEventDate());
				ps.setInt(4, event.getState());
				ps.setInt(5, event.getIndex2());
				ps.setInt(6, event.getEventId());
				i = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return i;
		}

}
