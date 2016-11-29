package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bbs.bean.BackMsg;
import com.bbs.dao.BackMsgDao;

import net.sf.json.JSONObject;

@WebServlet("/api/backMsgById")
public class BackMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String bmid="";
		bmid=request.getParameter("id");
		System.out.println(bmid);
		if(bmid!=null){
			BackMsg backMsg = null;
			backMsg =BackMsgDao.getBackMsgByBackMsgId(bmid);
			System.out.println(backMsg);
			if(backMsg !=null){
				JSONObject jsonObject =JSONObject.fromObject(backMsg );
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
}
	