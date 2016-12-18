package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBUtil.DBUtil;

/**
 * Servlet implementation class EventsPublishingController
 */
@WebServlet("/EventsPublishingController")
public class EventsPublishingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventsPublishingController() {
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
		String eventDate = request.getParameter("eventDate");
		String title = request.getParameter("title");
		String introduction = request.getParameter("introduction");

		String sql = "INSERT INTO events(eventId,title,introduction,eventDate,state,index2,adminid) VALUES(22,?,?,?,?,3,100)";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		PreparedStatement ps;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, introduction);
			ps.setString(3, eventDate);
			ps.setString(4, "2");
			ps.executeUpdate();
			response.sendRedirect("/myVolunteering/events.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
