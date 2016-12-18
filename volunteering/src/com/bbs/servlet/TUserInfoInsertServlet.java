package com.bbs.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.TUserInfo;
import com.bbs.dao.TUserInfoDao;

/**
 * Servlet implementation class TUserInfoInsertServlet
 */
@WebServlet("/api/TUserInfoInsertServlet")
public class TUserInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TUserInfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		TUserInfo tuserinfo=new TUserInfo();
		tuserinfo.setAddress(request.getParameter("address"));
		if (null!=request.getParameter("age")) {
			tuserinfo.setAge(Integer.parseInt(request.getParameter("age")));
		}else{
			tuserinfo.setAge(null);
		}
		tuserinfo.setEmail(request.getParameter("email"));
		tuserinfo.setGender(request.getParameter("gender"));
		tuserinfo.setPhone(request.getParameter("phone"));
		tuserinfo.setSignature(request.getParameter("signature"));
		if (null!=request.getParameter("userId")) {
			tuserinfo.setUserId(Integer.parseInt(request.getParameter("userId")));
		}else{
			tuserinfo.setUserId(null);
		}
		tuserinfo.setUsername(request.getParameter("username"));
		tuserinfo.setTime(request.getParameter("time"));
		tuserinfo.setDepartment(request.getParameter("department"));
		tuserinfo.setRealname(request.getParameter("realname"));
//		tuserinfo.setAddress("ShangHai Jiading");
//		tuserinfo.setAge(19);
//		tuserinfo.setEmail("1542403623@qq.com");
//		tuserinfo.setGender("male");
//		tuserinfo.setPhone("15221629666");
//		tuserinfo.setSignature("SITP");
//		tuserinfo.setUserId(5);
//		tuserinfo.setUsername("lalala");
//		tuserinfo.setTime("20150704173752");
		
		int rowNumber=TUserInfoDao.addTUserInfo(tuserinfo);
		TUserInfo tuserinfo2=TUserInfoDao.getUserInfoByUserId(tuserinfo.getUserId());
		if (0==rowNumber) {
			response.getWriter().write("Error");
		}else{
			JSONObject jsonObject =JSONObject.fromObject(tuserinfo2);
			response.getWriter().write(jsonObject.toString());
		}
	}

}
