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
 * Servlet implementation class ThoughtsDeleteServlet
 */
@WebServlet("/api/ThoughtsDeleteServlet")
public class ThoughtsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThoughtsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String id="";
		id=request.getParameter("id");
//		System.out.println(id);
		if(id!=null){
			int id2=Integer.parseInt(id);
//			Activity activity = null;
			Thoughts result=new Thoughts();
//			activity =ActivityDao .getActivityByActivityId(id);
			result=ThoughtsDao.getThoughtsById(id2);
			int isSuccess = ThoughtsDao.deleteThoughts(id2);
			if (isSuccess > 0){
				JSONObject jsonObject =JSONObject.fromObject(result);
				response.getWriter().write(jsonObject.toString());
			}
			else{
				response.getWriter().write("Error");
			}
			
		}
		else{
			response.getWriter().write("Parameter is empty!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
