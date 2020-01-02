package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;
@WebServlet("/userCheckMail")
public class UserCheckMail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService us=new UserServiceImpl();
		String mail=req.getParameter("mail");
		boolean falg=us.getUserBymail(mail);
		if(falg) {
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
