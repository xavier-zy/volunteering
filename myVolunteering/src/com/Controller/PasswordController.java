package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserHandler;
import com.Entity.User;

/**
 * Servlet implementation class PasswordController
 */
@WebServlet("/PasswordController")
public class PasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println("nihao");

		System.out.println(user.getUserName());
		System.out.println(user.getPassword());
		System.out.println(user.getUserId());
		System.out.println(user.getEmail());



		String currentPW, newPW1, newPW2;

		currentPW = request.getParameter("currentpw");
		newPW1 = request.getParameter("newpw1");
		newPW2 = request.getParameter("newpw2");

		if (!currentPW.equals(user.getPassword())) {
			System.out
					.println("ChangePasswordAction:the current Password is wrong!");
			request.getRequestDispatcher("/JSPs/myProfile&Events.jsp").forward(request,
					response);

			return;
		} else if (!newPW1.equals(newPW2)) {
			System.out
					.println("ChangePasswordAction:the new Passwords are not the same!");
			request.getRequestDispatcher("/JSPs/myProfile&Events.jsp").forward(request,
					response);

			return;
		}

		user.setPassword(newPW1);

		UserHandler.updateUserPW(user);

		session.removeAttribute("user");
		session.setAttribute("user", user);

	}

}
