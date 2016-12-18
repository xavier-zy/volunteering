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
//@WebServlet("/servlet/RegisterServlet")
/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int random = (int)(1+Math.random()*(10-1+1));
		  String headImg="files/img/"+String.valueOf(random)+".jpg";
		  response.setContentType("text/html;charset=utf-8");
		  String userName = request.getParameter("userName");
		  String passWord = request.getParameter("password");
		  String nickname = request.getParameter("nickname");
		 
		  Connection conn = DBUtils.getInstance().getConnction();
		 
		  try{
			  String sql = "INSERT INTO TUSER (userName,password,level,Lastlogin,nickname,headImg) VALUES (?,?,1,now(),?,?)";
			  PreparedStatement ps = conn.prepareStatement(sql);
		      ps.setString(1, userName);
		      ps.setString(2, passWord);
		      ps.setString(3, nickname);
		      ps.setString(4,headImg);
		      ps.executeUpdate();
		      
			  PrintWriter out =response.getWriter();
			  out.println("<script type=\"text/javascript\">\n"+"alert('注册成功');window.location.href=\"../index.jsp\"; "+"</script>");
		  } catch (SQLException e) {
			  PrintWriter out =response.getWriter();
			  out.println("<script type=\"text/javascript\">\n"+"alert('用户名已存在，请重新注册。');window.location.href=\"../index.jsp\"; "+"</script>");
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
