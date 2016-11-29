package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.MyActivity;
import com.bbs.bean.TUserInfo;
import com.bbs.dao.MyActivityDao;
import com.bbs.dao.TUserInfoDao;

/**
 * Servlet implementation class MyActivityUpdateServlet
 */
@WebServlet("/api/MyActivityUpdateServlet")
public class MyActivityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyActivityUpdateServlet() {
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
		MyActivity result=new MyActivity();
		if (null!=request.getParameter("userId")) {
			result.setUserId(Integer.parseInt(request.getParameter("userId")));
		} else {
			result.setUserId(null);
		}
		if (null!=request.getParameter("activityId")) {
			result.setActivityId(Integer.parseInt(request.getParameter("activityId")));
		} else {
			result.setActivityId(null);
		}
		result.setActivityStatus(request.getParameter("activityStatus"));
		result.setId(Integer.parseInt(request.getParameter("id")));
//		result.setUserId(4);
//		result.setActivityId(1);
//		result.setActivityStatus("1");
//		result.setId(1);
		int rowNumber=MyActivityDao.updateMyActivity(result);
		if (0==rowNumber) {
			response.getWriter().write("Error");
		}else{
			JSONObject jsonObject =JSONObject.fromObject(result);
			response.getWriter().write(jsonObject.toString());
		}
	}

}
