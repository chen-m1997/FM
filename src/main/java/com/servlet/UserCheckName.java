package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;

@WebServlet("/userCheckName")
public class UserCheckName extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService us=new UserServiceImpl();
		String username=request.getParameter("username");
		String mail=request.getParameter("mail");
		boolean namefalg=us.getUserByUsername(username);
		boolean mailfalg=us.getUserBymail(mail);
		if(namefalg) {
			response.getWriter().print("nametrue");
		}
		if(mailfalg) {
			response.getWriter().print("mailtrue");
		}
	}
}
