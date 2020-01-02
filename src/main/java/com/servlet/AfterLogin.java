package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Admin;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
@WebServlet("/afterlogin")
public class AfterLogin extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		AdminService adminService=new AdminServiceImpl();
		Admin admin=new Admin();
		boolean flag=adminService.login(username, password);
		if(flag) {
			admin.setUsername(username);
			admin.setPassword(password);
			request.getSession().setAttribute("admin", admin);
			response.sendRedirect("/FM/adminList");
		}else {
			response.sendRedirect("/FM/after/login.jsp");
			//System.out.println("登录失败");
		}
	}
}
