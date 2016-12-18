package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.News;
import com.bbs.dao.NewsDao;

import net.sf.json.JSONObject;

@WebServlet("/api/updateNews")
public class NewsUpdateServlet extends HttpServlet {
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
		String m_title =request.getParameter("title");
		String m_content= request.getParameter("content");
		String m_publishtime = request.getParameter("publishtime");
		int m_id = Integer.parseInt(request.getParameter("id"));
		
		News news = new News();
		news.setTitle(m_title);
		news.setContent(m_content);
		news.setPublishtime(m_publishtime);
		news.setId(m_id);
		
		int isSuccess = NewsDao.updateNews( news);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(news );
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("¸üÐÂÊ§°Ü");
		}
	}
	

}