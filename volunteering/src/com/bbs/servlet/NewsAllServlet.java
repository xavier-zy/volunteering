package com.bbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.News;
import com.bbs.dao.NewsDao;

import net.sf.json.JSONArray;

@WebServlet("/api/news")
public class NewsAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		ArrayList<News> newslist =null;
		newslist = NewsDao.getNewsAll();
		System.out.println(newslist );
		if(newslist !=null){
			JSONArray jsonArray = JSONArray.fromObject( newslist );
			response.getWriter().write(jsonArray.toString());
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
}

