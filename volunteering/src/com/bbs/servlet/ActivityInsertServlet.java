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

@WebServlet("/api/activityInsert")
public class ActivityInsertServlet extends HttpServlet {
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
		String m_activityDate =request.getParameter("activityDate");
		String m_dealine = request.getParameter("deadline");
		String m_address = request.getParameter("address");
		int m_number = Integer.parseInt(request.getParameter("number"));
		String m_orgnizator = request.getParameter("orgnizator");
		String m_state = request.getParameter("state");
		String m_introduction = request.getParameter("introduction");
		String m_titlt = request.getParameter("title");
		int m_index2 = Integer.parseInt(request.getParameter("index2"));
		int m_adminid=Integer.parseInt(request.getParameter("adminid"));
		System.out.println(m_adminid);
		Activity activity = new Activity();
		activity.setActivityDate(m_activityDate);
		activity.setDeadline(m_dealine);
		activity.setAddress(m_address);
		activity.setNumber(m_number);
		activity.setOrganizator(m_orgnizator);
		activity.setState(m_state);
		activity.setIntroduction(m_introduction);
		activity.setTitile(m_titlt);
		activity.setIndex2(m_index2);
		activity.setAdminid(m_adminid);
		int isSuccess = ActivityDao.addActivity(activity);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(activity );
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("≤Â»Î ß∞‹");
		}
	}
	

}
