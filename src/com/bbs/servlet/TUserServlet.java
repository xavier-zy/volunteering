package com.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.bean.TUser;
import com.bbs.dao.TUserDao;

//@WebServlet("/servlet/TUserServlet")

public class TUserServlet extends HttpServlet {

	public TUserServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		
		TUserDao userDao = new TUserDao();
		TUser tuser = userDao.getTUser(userName, passWord);
		if(tuser==null){
			PrintWriter out =response.getWriter();
			out.println("<script type=\"text/javascript\">\n"+"alert('用户名或密码错误请重新输入');window.location.href=\"../index.jsp\"; "+"</script>");
		}else{
		    HttpSession session = request.getSession();
		    session.setAttribute("tuser", tuser);
	    	response.sendRedirect("../index.jsp");
		}
	}

	public void init() throws ServletException {

	}

}
