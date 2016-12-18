package com.bbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.bbs.bean.Thoughts;
import com.bbs.dao.ThoughtsDao;

/**
 * Servlet implementation class ThoughtsSelectAllServlet
 */
@WebServlet("/api/ThoughtsSelectAllServlet")
public class ThoughtsSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThoughtsSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		ArrayList<Thoughts> listResult = ThoughtsDao.getAllThoughts();
		if (null!=listResult) {
			JSONArray jsonArray =JSONArray.fromObject(listResult);
			response.getWriter().write(jsonArray.toString());
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
