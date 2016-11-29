package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.Thoughts;
import com.bbs.dao.MyActivityDao;
import com.bbs.dao.ThoughtsDao;

/**
 * Servlet implementation class ThoughtsUpdateServlet
 */
@WebServlet("/api/ThoughtsUpdateServlet")
public class ThoughtsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThoughtsUpdateServlet() {
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
		}else{
			result.setUserId(null);
		}
		result.setThoughtsTitle(request.getParameter("thoughtsTitle"));
		result.setThoughtsContent(request.getParameter("thoughtsContent"));
		result.setPublishTime(request.getParameter("publishTime"));
		if (null!=request.getParameter("id")) {
			result.setId(Integer.parseInt(request.getParameter("id")));
		} else {
			result.setId(null);
		}
//		result.setUserId(4);
//		result.setThoughtsTitle("This is a bad activity!");
//		result.setThoughtsContent("789465132714285396");
//		result.setId(1);
//		result.setPublishTime("123456789632147");
		int rowNumber=ThoughtsDao.updateThoughts(result);
		Thoughts result2=ThoughtsDao.getThoughtsById(Integer.parseInt(request.getParameter("id")));
//		Thoughts result2=ThoughtsDao.getThoughtsById(1);
		if (0==rowNumber) {
			response.getWriter().write("Error");
		}else{
			JSONObject jsonObject =JSONObject.fromObject(result2);
			response.getWriter().write(jsonObject.toString());
		}
	}

}
