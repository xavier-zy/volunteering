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
 * Servlet implementation class NewsPublishingController
 */
@WebServlet("/NewsPublishingController")
public class NewsPublishingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsPublishingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		String sql = "INSERT INTO news(newsId,title,content,publishTime) VALUES(?,?,?,now())";

		DBUtil util = new DBUtil();
		Connection conn = util.getConnection();

		PreparedStatement ps;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(2, title);
			ps.setString(3, content);
			
			ps.executeUpdate();
			response.sendRedirect("/myVolunteering/newsInResources.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
