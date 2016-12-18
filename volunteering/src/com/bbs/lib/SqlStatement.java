package com.bbs.lib;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.bbs.util.*;

public class SqlStatement {
	public static String MYACTIVITY="myactivity";
	public static String POSTEDMSG="postedMsg";
	public static String THOUGHTS="thoughts";
	public static String TUSERINFO="tuserinfo";
	public static String ACTIVITY="activity";
	private static Object rs;
	private static int number;
//	private static List<Object> rsList;
	
	@SuppressWarnings("finally")
	public static Object selectOne(String table,int id){
		String sql="select *from "+table+" where userId="+id;
		System.out.println("SelectOneSql:"+sql);
//		System.out.println(sql);
		try {
			Connection conn = DBUtils.getInstance().getConnction();
			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
			rs = (ResultSet)ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (rs==null) {
				return null;
			} else {
				return rs;
			}
		}
//		return null;
		
	}
	
	@SuppressWarnings("finally")
	public static Object selectOneById(String table,int id){
		String sql="select *from "+table+" where id="+id;
		System.out.println("SelectOneSql:"+sql);
//		System.out.println(sql);
		try {
			Connection conn = DBUtils.getInstance().getConnction();
			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
			rs = (ResultSet)ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (rs==null) {
				return null;
			} else {
				return rs;
			}
		}
//		return null;
		
	}
	@SuppressWarnings("finally")
	public static Object selectAll(String table){
		String sql="select *from "+table;
		System.out.println("SelectAllSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = (ResultSet)ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if (rs==null) {
				return null;
			} else {
				return rs;
			}
		}
		
	}
	@SuppressWarnings("finally")
	public static Object selectAllByUserId(String table,int id){
		String sql="select *from "+table+" where userId="+id;
		System.out.println("SelectAllSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = (ResultSet)ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if (rs==null) {
				return null;
			} else {
				return rs;
			}
		}
		
	}
	
	public static int insert(String table,Object ob) throws NoSuchMethodException, SecurityException, Exception{
		String sql=getSql("insert",table, ob);
		System.out.println("InsertSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		PreparedStatement ps=conn.prepareStatement(sql);
		number=ps.executeUpdate();
//		System.out.println("sql:"+sql);
		
			return number;
		
		
	}
	/**
	 * ��ȡ�����sql���
	 * @param table
	 * @param ob
	 * @return
	 * @throws NoSuchMethodException
	 * @throws Exception
	 */
	public static String getSql(String operation,String table, Object ob)
			throws NoSuchMethodException, Exception {
		Class<?> classType = ob.getClass();
//		Method[] methods=classType.getDeclaredMethods();
		Field[] fields=classType.getDeclaredFields();
		String sql="";
		switch (operation) {
		case "insert":
			sql="insert into "+table+" (";
			for (int i = 1; i < fields.length; i++) {
				sql+=fields[i].getName().toString();
				if(i>=0 && i< fields.length-1){
		            sql += ", ";
		        }
			}
			sql+=") values(";
			for (int i = 1; i < fields.length; i++) {
				String value=getReflectValue(ob, fields[i]);
				sql+="'"+value+"'";
				if(i>=0 && i< fields.length-1){
		            sql += ", ";
		        }
			}
			sql+=")";
//			System.out.println("sql:"+sql);
			break;
		case "update":
			sql="update "+table+" set ";
			for (int i = 1; i < fields.length; i++) {
				sql+=fields[i].getName().toString()+"='"+getReflectValue(ob, fields[i])+"'";
				if(i>=0 && i< fields.length-1){
		            sql += ", ";
		        }
			}
			Method m = (Method) ob.getClass().getMethod(
					"getUserId");
			int val = (int) m.invoke(ob);
			sql+=" where UserId="+val;
//			System.out.println("sql:"+sql);
			break;
		case "updateById":
			sql="update "+table+" set ";
			for (int i = 1; i < fields.length; i++) {
				sql+=fields[i].getName().toString()+"='"+getReflectValue(ob, fields[i])+"'";
				if(i>=0 && i< fields.length-1){
					sql += ", ";
				}
			}
			Method m2 = (Method) ob.getClass().getMethod(
					"getId");
			int val2 = (int) m2.invoke(ob);
			sql+=" where id="+val2;
//			System.out.println("sql:"+sql);
			break;
		default:
			break;
		}
		
		return sql;
	}
	
	public static int update(String table,Object ob) throws NoSuchMethodException, Exception{
		String sql=getSql("update", table, ob);
		System.out.println("UpdateSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		PreparedStatement ps=conn.prepareStatement(sql);
		number=ps.executeUpdate();
		return number;
		
	}
	public static int updateById(String table,Object ob) throws NoSuchMethodException, Exception{
		String sql=getSql("updateById", table, ob);
		System.out.println("UpdateSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		PreparedStatement ps=conn.prepareStatement(sql);
		number=ps.executeUpdate();
		return number;
		
	}
	/**
	 * ����userId��ɾ����Ϣ
	 * @param table Ҫ�����ı���
	 * @param id userId
	 * @return ��Ӱ��ļ�¼����
	 * @throws SQLException
	 */
	public static int delete(String table,int id) throws SQLException{
		String sql="delete from "+table+" where UserId = "+id;
		System.out.println("DeleteSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		PreparedStatement ps=conn.prepareStatement(sql);
		number=ps.executeUpdate();
		return number;
		
	}
	/**
	 * ����idɾ����Ϣ
	 * @param table ɾ����Ϣ�ı���
	 * @param id id
	 * @return ��Ӱ��ļ�¼������
	 * @throws SQLException
	 */
	public static int deleteById(String table,int id) throws SQLException{
		String sql="delete from "+table+" where id = "+id;
		System.out.println("DeleteSql:"+sql);
		Connection conn=DBUtils.getInstance().getConnction();
		PreparedStatement ps=conn.prepareStatement(sql);
		number=ps.executeUpdate();
		return number;
		
	}
	/**
	 * ͨ��������ƻ�ȡ�����Ե�ֵ
	 * @param object
	 * @param field
	 * @return
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws Exception
	 */
	private static String getReflectValue(Object object, Field field) throws NoSuchMethodException, SecurityException, Exception{
//		for (Field field : fields) {// --for() begin

			// ���������String
			if (field.getGenericType().toString().equals("class java.lang.String")) { // ���type�������ͣ���ǰ�����"class "�����������
				// �õ������Ե�gettet����

				Method m = (Method) object.getClass().getMethod(
						"get" + getMethodName(field.getName()));
				String val = (String) m.invoke(object);// ����getter������ȡ����ֵ
				if (val != null) {
					// System.out.println("String type:" + val);
					return val.toString();
				}
			}
			// ���������Integer
			if (field.getGenericType().toString().equals("class java.lang.Integer")) {
				Method m = (Method) object.getClass().getMethod(
						"get" + getMethodName(field.getName()));
				Integer val = (Integer) m.invoke(object);
				if (val != null) {
					// System.out.println("Integer type:" + val);
					return val.toString();
				}
			}
			// ���������Double
			if (field.getGenericType().toString().equals("class java.lang.Double")) {
				Method m = (Method) object.getClass().getMethod(
						"get" + getMethodName(field.getName()));
				Double val = (Double) m.invoke(object);
				if (val != null) {
					// System.out.println("Double type:" + val);
					return val.toString();
				}
			}
			// ���������Boolean �Ƿ�װ��
			if (field.getGenericType().toString().equals("class java.lang.Boolean")) {
				Method m = (Method) object.getClass()
						.getMethod(field.getName());
				Boolean val = (Boolean) m.invoke(object);
				if (val != null) {
					// System.out.println("Boolean type:" + val);
					return val.toString();
				}
			}
			// ���������boolean �����������Ͳ�һ�� �����е�˵������������� isXXX�� �Ǿ�ȫ����isXXX��
			// �����Ҳ���getter�ľ�����
			if (field.getGenericType().toString().equals("boolean")) {
				Method m = (Method) object.getClass()
						.getMethod(field.getName());
				Boolean val = (Boolean) m.invoke(object);
				if (val != null) {
					// System.out.println("boolean type:" + val);
					return val.toString();
				}
			}
			// ���������Date
			if (field.getGenericType().toString().equals("class java.util.Date")) {
				Method m = (Method) object.getClass().getMethod(
						"get" + getMethodName(field.getName()));
				Date val = (Date) m.invoke(object);
				if (val != null) {
					// System.out.println("Date type:" + val);
					return val.toString();
				}
			}
			// ���������Short
			if (field.getGenericType().toString()
					.equals("class java.lang.Short")) {
				Method m = (Method) object.getClass().getMethod(
						"get" + getMethodName(field.getName()));
				Short val = (Short) m.invoke(object);
				if (val != null) {
					// System.out.println("Short type:" + val);
					return val.toString();
				}
			}
			// �������Ҫ�������������Լ�����չ
//		}// for() --end
		return null;
	}
	/**
	 * ���ַ���������ĸ��ɴ�д
	 * @param fildeName
	 * @return
	 * @throws Exception
	 */
	private static String getMethodName(String fildeName) throws Exception{
		  byte[] items = fildeName.getBytes();
		  items[0] = (byte) ((char) items[0] - 'a' + 'A');
		  return new String(items);
		 }
}
