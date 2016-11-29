package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.bbs.bean.MyActivity;
import com.bbs.bean.PostedMsg;
import com.bbs.dao.MyActivityDao;
import com.bbs.dao.PostedMsgDao;

/**
 * Servlet implementation class PostedMsgInsertServlet
 */
@WebServlet("/api/PostedMsgInsertServlet")
public class PostedMsgInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostedMsgInsertServlet() {
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
		PostedMsg result=new PostedMsg();
		if (null!=request.getParameter("userId")) {
			result.setUserId(Integer.parseInt(request.getParameter("userId")));
		} else {
			result.setUserId(null);
		}
		result.setPostTitle(request.getParameter("postTitle"));
		result.setPostContent(request.getParameter("postContent"));
		result.setPublishTime(request.getParameter("publishTime"));
//		result.setUserId(1);
//		result.setPostTitle("This is a good post!");
//		result.setPostContent("qazwsxedcrfvtgbyhnujmiko");
//		result.setPublishTime("798465132815926");
		int rowNumber=PostedMsgDao.addPostedMsg(result);
		if (0==rowNumber) {
			response.getWriter().write("Error");
		}else{
			JSONObject jsonObject =JSONObject.fromObject(result );
			response.getWriter().write(jsonObject.toString());
		}
	}

}
