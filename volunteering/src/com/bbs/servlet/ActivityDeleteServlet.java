package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Activity;
import com.bbs.dao.ActivityDao;

import net.sf.json.JSONObject;

@WebServlet("/api/deleteActivity")
public class ActivityDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String id="";
		id=request.getParameter("id");
		System.out.println(id);
		if(id!=null){
			Activity activity = null;
			activity =ActivityDao .getActivityByActivityId(id);
			int isSuccess = ActivityDao.deleteActivityById(id);
			if (isSuccess > 0){
				JSONObject jsonObject =JSONObject.fromObject(activity );
				response.getWriter().write(jsonObject.toString());
			}
			else{
				response.getWriter().write("删除失败");
			}
			
		}
		else{
			response.getWriter().write("未传入参数！");
		}
			

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	

}
