package com.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.util.DBUtils;

/**
 * Servlet implementation class RegisterServlet
 */

public class Release extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Release() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int nextAID = 0;
		  response.setContentType("text/html;charset=utf-8");
		  String title = request.getParameter("title");
		  String activityDate = request.getParameter("activityDate");
		  String deadline = request.getParameter("deadline");
		  String number = request.getParameter("number");
		  int number2=Integer.parseInt(number);
		  String index = request.getParameter("index");
		  int index2=Integer.parseInt(index);
		  String address = request.getParameter("address");
		  String organizator = request.getParameter("organizator");
		  String state = request.getParameter("state");
		  String introduction = request.getParameter("introduction");
		  String adminid = request.getParameter("adminid");
		  String sql;
		  Connection conn = DBUtils.getInstance().getConnction();
		 
		  try{
			  sql = "INSERT INTO activity (activityDate,deadline,address,number,organizator,state,introduction,title,index2,adminid) VALUES (?,?,?,?,?,?,?,?,?,?)";
			  PreparedStatement ps = conn.prepareStatement(sql);
		     
		      ps.setString(1, activityDate);
		      ps.setString(2, deadline);
		      ps.setString(3, address);
		      ps.setInt(4, number2);
		      ps.setString(5, organizator);
		      ps.setString(6,state);
		      ps.setString(7,introduction);
		      ps.setString(8,title);
		      ps.setInt(9,index2);
		      ps.setString(10,adminid);
		      ps.executeUpdate();
		      
			  PrintWriter out =response.getWriter();
			  out.println("<script type=\"text/javascript\">\n"+"alert('发布成功');window.location.href=\"../project.jsp\"; "+"</script>");
		  } catch (SQLException e) {
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
