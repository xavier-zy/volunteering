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
 * Servlet implementation class TUserInfoSelectOneServlet
 */
@WebServlet("/api/TUserInfoSelectOneServlet")
public class TUserInfoSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TUserInfoSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String aid;
		aid=request.getParameter("id");
//		System.out.println(aid);
		if(aid!=null){
			Integer userId=Integer.parseInt(aid);
			TUserInfo tuserinfo =TUserInfoDao.getUserInfoByUserId(userId);
//			System.out.println(activity );
			if(tuserinfo !=null){
				JSONObject jsonObject =JSONObject.fromObject(tuserinfo);
				response.getWriter().write(jsonObject.toString());
			}
			else{
				response.getWriter().write("id无效");
			}
		}
		else{
			response.getWriter().write("未传入参数！");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
