package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserInfoHandler;
import com.Entity.UserInfo;

/**
 * Servlet implementation class ChangeUserInfoServlet
 */
@WebServlet("/ChangeUserInfoServlet")
public class ChangeUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeUserInfoServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");

		UserInfo userInfo = new UserInfo();

		userInfo.setAddress(request.getParameter("address"));
		userInfo.setAge(Integer.parseInt(request.getParameter("age")));
		userInfo.setEmail(request.getParameter("email"));
		userInfo.setGender(request.getParameter("gender"));
		userInfo.setPhone(request.getParameter("phone"));
		userInfo.setSignature(request.getParameter("signature"));
		if (null != request.getParameter("userId")) {
			userInfo.setUserId(Integer.parseInt(request.getParameter("userId")));
		} else {
			userInfo.setUserId(null);
		}

		UserInfoHandler.updateUserInfo(userInfo);
	}

}
