package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
@WebServlet("/adminCheckName")
public class AdminCheckName extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService adminService=new AdminServiceImpl();
		String username= request.getParameter("username");
		//System.out.println("页面获取username："+username);
		boolean falg=adminService.getAdminByName(username);
		if(falg) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	//	System.out.println(falg);
	}
}
