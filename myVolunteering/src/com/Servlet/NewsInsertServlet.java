package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Entity.News;

import com.DAO.NewsHandler;


@WebServlet("/api/newsInsert")
public class NewsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
	doPost(request, response);	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String tag = request.getParameter("tag");
		String title =request.getParameter("title");
		String content= request.getParameter("content");
		String publishtime = request.getParameter("publishtime");
		
		News news = new News();
		news.setTag(tag);
		news.setTitle(title);
		news.setContent(content);
		news.setPublishTime(publishtime);
		
		NewsHandler.addNews(news);

		
	}
	

}
