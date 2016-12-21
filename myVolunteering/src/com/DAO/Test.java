package com.DAO;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {
 
    public static void main(String[] args) {
    	String iString = "1123432";
    	int i=1;
    	String string = iString+"  "+i;
    	System.out.println(string);
    }
}
