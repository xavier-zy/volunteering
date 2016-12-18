package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.StoriesHandler;
import com.Entity.Stories;
import com.Entity.User;

/**
 * Servlet implementation class StoryWritingServlet
 */
@WebServlet("/StoryWritingServlet")
public class StoryWritingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryWritingServlet() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		System.out.println("aaaaaMMMYYYHELLO");
		
		response.setContentType("text/html; charset=utf-8");
		String m_title =request.getParameter("title");
		String m_content= request.getParameter("content");
		String m_writtenTime = request.getParameter("writtenTime");
		
		Stories story = new Stories();
		story.setTitle(m_title);
		story.setContent(m_content);
		story.setWrittenTime(m_writtenTime);
		System.out.println("MMMMYYYHELLO");
		
		StoriesHandler.addStory(story, user.getUserId());
		
		System.out.println("HELLO");
	}

}
