package com.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class DBUtil {
	
//	public static DBUtil getInstance(){
//		if (dbUtil == null)
//			dbUtil = new DBUtil();
//		return dbUtil;
//	}
	
	public Connection getConnection(){
		Connection conn = null;
		String url = "jdbc:mysql://10.60.42.203:8888/db_11?user=T11&password=0Cbaq8DO";
		try {
			Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void closeConnection(Connection conn, PreparedStatement ps){
		try {
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(ps != null){
			ps = null;
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(conn != null){
			conn = null;
		}
	}
	
	
	public void closeConnection(Connection conn, Statement st){
		try {
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(st != null){
			st = null;
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(conn != null){
			conn = null;
		}
	}
	
	public void closeResource(Connection conn, Statement st, ResultSet rs){
		closeConnection(conn,st);
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(rs != null){
			rs = null;
		}
	}
	
	public void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs){
		closeConnection(conn, ps);
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(rs != null){
			rs = null;
		}
	}

}
