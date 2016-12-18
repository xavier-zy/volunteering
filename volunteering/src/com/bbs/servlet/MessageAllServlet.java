package com.bbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Message;
import com.bbs.dao.MessageDao;

import net.sf.json.JSONArray;

@WebServlet("/api/message")
public class MessageAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		ArrayList<Message> messagelist =null;
		messagelist = MessageDao.getMessageAll();
		System.out.println(messagelist );
		if(messagelist !=null){
			JSONArray jsonArray = JSONArray.fromObject(messagelist );
			response.getWriter().write(jsonArray.toString());
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
}