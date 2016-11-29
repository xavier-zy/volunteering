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
 * Servlet implementation class MyActivitySelectOneServlet
 */
@WebServlet("/api/MyActivitySelectOneServlet")
public class MyActivitySelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyActivitySelectOneServlet() {
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
			Integer id=Integer.parseInt(aid);
			MyActivity result =MyActivityDao.getMyActivityById(id);
//			System.out.println(activity );
			if(result !=null){
				JSONObject jsonObject =JSONObject.fromObject(result);
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
