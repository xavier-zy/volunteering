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

@WebServlet("/api/deleteLetter")
public class LetterDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String id="";
		id=request.getParameter("id");
		System.out.println(id);
		if(id!=null){
			Letter letter = null;
			letter =LetterDao .getLetteryBySendId(id);
			int isSuccess = LetterDao.deleteLetterById(id);
			if (isSuccess > 0){
				JSONObject jsonObject =JSONObject.fromObject(letter );
				response.getWriter().write(jsonObject.toString());
			}
			else{
				response.getWriter().write("删除失败");
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
