package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		// UserHandler.insertUser(name, password, email);
		String url = "jdbc:mysql://10.60.42.203:8888/db_11?user=T11&password=0Cbaq8DO";

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection conn = DriverManager.getConnection(url);

			if (conn != null) {
				out.println("Success!!!");
			}
			String sql = "INSERT INTO user (userId,password,lastlogin,level,userName,email) VALUES (12,?,now(),1,?,?)";
			PreparedStatement ps;

			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, name);
			ps.setString(3, email);
			System.out.println("!!!!!!!!!1");
			ps.executeUpdate();
			System.out.println("!!!!!!!!!1");
			out.println("<script type=\"text/javascript\">\n" + "alert('SUCCESS');window.location.href=\"../index.jsp\"; "
					+ "</script>");
		}catch (SQLException e) {
			out.println("<script type=\"text/javascript\">\n"
					+ "alert('FAIL');window.location.href=\"../index.jsp\"; " + "</script>");
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
//		Connection conn = DBUtil.getInstance().getConnection();
//
//		String sql = "INSERT INTO user (password,Lastlogin,level,userName,email) VALUES (?,now(),1,?,?)";
//		PreparedStatement ps;
//		try {
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, password);
//			ps.setString(2, name);
//			ps.setString(3, email);
//			ps.executeUpdate();
//			out.println("<script type=\"text/javascript\">\n" + "alert('注册成功');window.location.href=\"../index.jsp\"; "
//					+ "</script>");
//		} catch (SQLException e) {
//			out.println("<script type=\"text/javascript\">\n"
//					+ "alert('用户名已存在，请重新注册');window.location.href=\"../index.jsp\"; " + "</script>");
//			e.printStackTrace();
//		}

	}

}
