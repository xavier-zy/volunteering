package com.bbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class DBUtils {
	private static DBUtils dbUtils = null;

	public static DBUtils getInstance() {
		if (dbUtils == null)
			dbUtils = new DBUtils();
		return dbUtils;
	}
	
	/**
	 * 获取数据库连接
	 */
	public Connection getConnction(){
		Connection conn = null;
		//String url = "jdbc:mysql://localhost:3306/j2ee?user=root&password=liyibu&useUnicode=true&characterEncoding=UTF8";
		String url = "jdbc:mysql://115.28.46.153:3306/tjzyz?user=root&password=liyibu&useUnicode=true&characterEncoding=UTF8";
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
	
	public void closeResource(Connection conn, PreparedStatement ps){
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
	
	
	public void closeResource(Connection conn, Statement st){
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
		closeResource(conn,st);
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(rs != null){
			rs = null;
		}
	}
	
	public void closeResource(Connection conn, PreparedStatement ps, ResultSet rs){
		closeResource(conn,ps);
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
