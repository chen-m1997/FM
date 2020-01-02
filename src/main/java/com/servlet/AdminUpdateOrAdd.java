package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Admin;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
@WebServlet("/adminUpdateOrAdd")
public class AdminUpdateOrAdd extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID=request.getParameter("id");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		AdminService AdminServer=new AdminServiceImpl();
		Admin admin=new Admin();
		if(ID!=null && !"".equals(ID)) {//修改
			int id=Integer.parseInt(ID);
			admin.setId(id);
			admin.setUsername(username);
			admin.setPassword(password);

			if(!AdminServer.getAdminByName(username)) {
				AdminServer.updateAdmin(admin);
			}else {
				System.out.println("该名称已存在");
			}

		}else {
			if(!AdminServer.getAdminByName(username)) {
				AdminServer.addAdmin(username, password);//添加

				/** 关于cookie*/
				Cookie cookie=new Cookie("unamecookie", username);//将username放入
				cookie.setMaxAge(60*60*24);//设置cookie失效时间，单位 S
				response.addCookie(cookie);//将其添加
				response.getWriter().print("注册成功！三秒后跳转页面----");
				response.setHeader("refresh", "3,url='/FM/login.jsp'");
				
			}else {
				System.out.println("该名称已存在");
			}

		}
		response.sendRedirect("/FM/adminList");
	}
}
