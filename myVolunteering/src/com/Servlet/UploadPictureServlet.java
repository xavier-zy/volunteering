package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.DAO.UserHandler;
import com.Entity.User;

/** 
 * Servlet implementation class PictureUploadAction
 * 7.5 andy
 */
@WebServlet("/UploadPictureAction")
public class UploadPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_PATH = "/Users/a/Desktop/Upload/";
	private static final String SAVE_PATH = "/upload/";
	private String uploadName = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadPictureServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(
				diskFileItemFactory);
		String userId = request.getParameter("userId");
		
		User user = UserHandler.getTUserById(Integer.parseInt(userId));
		
		try {
			List<FileItem> fileItemList = servletFileUpload
					.parseRequest(request);
			Iterator<FileItem> iterator = fileItemList.iterator();
			String picturePath = null;
			
			while (iterator.hasNext()) {
				FileItem fileItem = iterator.next();

				String fileName = fileItem.getName();

				String saveFileName = user.getUserName()
						+ "_"
						+ new SimpleDateFormat("yy_D_HH_mm_ss")
								.format(new Date())
						+ fileName.substring(fileName.lastIndexOf("."));

				String filePath = UPLOAD_PATH + saveFileName;

				File saveFile = new File(filePath);

				fileItem.write(saveFile);
				
				picturePath = SAVE_PATH + saveFileName;
			}
			
			user.setHeadImg(picturePath);
			UserHandler.updateUserHeadImg(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// smg
		System.out.println(uploadName);
//		ArrayList<User> goodsSearch = UserHandler.getUserByUserName(user.getUserName());
//		if (uploadName != null) {
//			request.setAttribute("goodsList", goodsSearch);
//		}
//		request.getRequestDispatcher("/jsp/SearchResult.jsp").forward(request,
//				response);
//		// smg
	}
}
