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

@WebServlet("/api/backMsgInsert")
public class BackMsgInsertServlet extends HttpServlet {
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
		int m_bm_id =Integer.parseInt(request.getParameter("bm_id"));
		String m_msgID = request.getParameter("msgID");
		String m_backContent = request.getParameter("backContent");
		String m_backdate = request.getParameter("backdate");
		
		BackMsg backMsg = new BackMsg();
		
		backMsg.setBm_id(m_bm_id);
		backMsg.setMsgID(m_msgID);
		backMsg.setBackContent(m_backContent);
		backMsg.setBackdate(m_backdate);
		
		int isSuccess = BackMsgDao.addBackMsg( backMsg);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(backMsg);
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("≤Â»Î ß∞‹");
		}
	}
	

}
