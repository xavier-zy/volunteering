package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.Activity;
import com.bbs.bean.TUserInfo;
import com.bbs.dao.ActivityDao;
import com.bbs.dao.TUserInfoDao;

/**
 * Servlet implementation class TUserInfoDeleteServlet
 */
@WebServlet("/api/TUserInfoDeleteServlet")
public class TUserInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TUserInfoDeleteServlet() {
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
			int userId=Integer.parseInt(id);
//			Activity activity = null;
			TUserInfo tuserinfo=new TUserInfo();
//			activity =ActivityDao .getActivityByActivityId(id);
			tuserinfo=TUserInfoDao.getUserInfoByUserId(userId);
			int isSuccess = TUserInfoDao.deleteTUserInfo(userId);
			if (isSuccess > 0){
				JSONObject jsonObject =JSONObject.fromObject(tuserinfo);
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
