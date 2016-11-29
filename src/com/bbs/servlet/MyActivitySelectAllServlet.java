package com.bbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class MyActivitySelectAllServlet
 */
@WebServlet("/api/MyActivitySelectAllServlet")
public class MyActivitySelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyActivitySelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		Integer id=Integer.parseInt(request.getParameter("id"));
		ArrayList<MyActivity> listResult = MyActivityDao.getAllMyActivity(id);
		if (null!=listResult) {
			JSONObject jsonObject =JSONObject.fromObject(listResult);
			response.getWriter().write(jsonObject.toString());
		}else{
			response.getWriter().write("Error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
