package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.Thoughts;
import com.bbs.dao.ThoughtsDao;

/**
 * Servlet implementation class ThoughtsInsertServlet
 */
@WebServlet("/api/ThoughtsInsertServlet")
public class ThoughtsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThoughtsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		Thoughts result=new Thoughts();
		if (null!=request.getParameter("userId")) {
			result.setUserId(Integer.parseInt(request.getParameter("userId")));
		} else {
			result.setUserId(null);
		}
		result.setThoughtsTitle(request.getParameter("thoughtsTitle"));
		result.setThoughtsContent(request.getParameter("thoughtsContent"));
		result.setPublishTime(request.getParameter("publishTime"));
//		result.setUserId(2);
//		result.setThoughtsTitle("It is a good activity!");
//		result.setThoughtsContent("qwertyuiopasdfghjkzxcvbnm");
//		result.setPublishTime("12345678912345678");
		int rowNumber=ThoughtsDao.addThoughts(result);
//		Thoughts result2=ThoughtsDao.getThoughtsById();
		if (0==rowNumber) {
			response.getWriter().write("Error");
		}else{
			JSONObject jsonObject =JSONObject.fromObject(result);
			response.getWriter().write(jsonObject.toString());
		}
	}

}
