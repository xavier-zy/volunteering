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
import com.bbs.bean.PostedMsg;
import com.bbs.dao.MyActivityDao;
import com.bbs.dao.PostedMsgDao;

/**
 * Servlet implementation class PostedMsgSelectAllServlet
 */
@WebServlet("/api/PostedMsgSelectAllServlet")
public class PostedMsgSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostedMsgSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		ArrayList<PostedMsg> listResult = PostedMsgDao.getAllPostedMsg();
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
