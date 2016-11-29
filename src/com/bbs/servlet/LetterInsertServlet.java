package com.bbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Letter;
import com.bbs.dao.LetterDao;

import net.sf.json.JSONObject;

@WebServlet("/api/letterInsert")
public class LetterInsertServlet extends HttpServlet {
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
		int m_receiveID =Integer.parseInt(request.getParameter("receiveID"));
		String m_content = request.getParameter("content");
		String m_postDate = request.getParameter("postDate");
		Letter letter = new Letter();
		letter.setReceiveID(m_receiveID);
		letter.setContent(m_content);
		letter.setPostDate(m_postDate);
	
		int isSuccess = LetterDao.addLetter( letter);
		if (isSuccess > 0)
		{
			JSONObject jsonObject =JSONObject.fromObject(letter );
			response.getWriter().write(jsonObject.toString());
		}
		else
		{
			response.getWriter().write("≤Â»Î ß∞‹");
		}
	}
	

}

