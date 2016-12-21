package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MyEventsHandler;
import com.Entity.MyEvents;

/**
 * Servlet implementation class EnrollAnEventServlet
 */
@WebServlet("/EnrollAnEventServlet")
public class EnrollAnEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EnrollAnEventServlet() {
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
		System.out.println("Enroll Servlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		MyEvents myevent = new MyEvents();
		
		myevent.setUserId(Integer.parseInt(request.getParameter("userId")));
		myevent.setEventId(Integer.parseInt(request.getParameter("eventId")));
		myevent.setEventStatus(request.getParameter("eventStatus"));
		
		MyEventsHandler.addMyEvent(myevent);
		
	}
}
