package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOutServlet
 */
//@WebServlet("/servlet/LoginOutServlet")
public class LoginOutServlet extends HttpServlet {

	/**
	 * @category �˳���¼��Servlet,ע��
	 * @author Bird
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);//��ֹ����Session
		if(session == null){
			response.sendRedirect("../index.jsp");
			return;
		}
		session.invalidate();
		response.sendRedirect("../index.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

