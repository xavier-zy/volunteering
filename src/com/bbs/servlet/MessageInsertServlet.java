package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Message;
import com.bbs.dao.MessageDao;

import net.sf.json.JSONObject;

@WebServlet("/api/messageInsert")
public class MessageInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
	doPost(request, response);	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String m_userName =request.getParameter("userName");
		String m_writeDate = request.getParameter("writeDate");
		String m_content = request.getParameter("content");
		Message message = new Message();
		message.setUserName(m_userName);
		message.setWriteDate(m_writeDate);
		message.setContent(m_content);
	
		int isSuccess = MessageDao.addMessage( message);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(message);
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("≤Â»Î ß∞‹");
		}
	}
	

}

