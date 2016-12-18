package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.BackThoughts;
import com.bbs.dao.BackThoughsDao;

import net.sf.json.JSONObject;

@WebServlet("/api/updateBackThoughts")
public class BackThoughtsUpdateServlet extends HttpServlet {
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
		int m_bt_id =Integer.parseInt(request.getParameter("bt_id"));
		String m_thoughtsID = request.getParameter("thoughtsID");
		String m_backContent = request.getParameter("backContent");
		String m_backDate = request.getParameter("backDate");
		int m_Backid =Integer.parseInt(request.getParameter("id"));
		
		BackThoughts backThoughts = new BackThoughts();
		
		backThoughts.setBt_id(m_bt_id);
		backThoughts.setThoughtsID(m_thoughtsID);
		backThoughts.setBackContent(m_backContent);
		backThoughts.setBackDate(m_backDate);
		backThoughts.setBackid(m_Backid);
		
		int isSuccess = BackThoughsDao.updateBackThoughts( backThoughts);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(backThoughts);
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("¸üÐÂÊ§°Ü");
		}
	}
	

}
