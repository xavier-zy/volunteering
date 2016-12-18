/**
 * 
 */
package com.bbs.lib;

import static org.junit.Assert.*;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bbs.bean.Activity;
import com.bbs.bean.BackMsg;
import com.bbs.bean.TUserInfo;
import com.bbs.util.DBUtils;
import com.bbs.lib.*;
/**
 * @author IvanYe
 *
 */
public class SqlStatementTest {

	
	@Test
	public void testSelectOne() throws NoSuchMethodException, SecurityException, Exception {
//		String table = SqlStatement.MYACTIVITY;
//		int id=1;
//		ResultSet rs = (ResultSet)SqlStatement.selectOne(table, id);
//		try {
//			while(rs.next()){
//				System.out.println("Reason:"+rs.getString("activityReason"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//∑¥…‰ª˙÷∆≤‚ ‘
//		Activity activity=new Activity();
//		BackMsg backMsg=new BackMsg();
		TUserInfo tuserinfo=new TUserInfo();
		Class<?> classType = tuserinfo.getClass();
//		Method[] methods=classType.getDeclaredMethods();
		Field[] fields=classType.getDeclaredFields();
		for(int i=0;i<fields.length;i++)
        {
            System.out.println(fields[i].getName());
        }
		
		//sql”Ôæ‰≤‚ ‘
//		Activity activity=new Activity();
////		SqlStatement.insert("myactivity",activity);
//		SqlStatement.getSql("insert", "myactivity", activity);
	}

}
