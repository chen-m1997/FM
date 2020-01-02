package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
@WebServlet("/adminDelById")
public class AdminDelById extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String IDS=request.getParameter("ids");
		System.out.println(IDS);
		AdminService as=new AdminServiceImpl();
		String[] ids=IDS.split(",");
		int id=0;
		for (int i = 0; i < ids.length; i++) {
			if(ids[i]!=null && !"".equals(ids[i])) {
				id=Integer.parseInt(ids[i]);
				as.delAdmin(id);
			}
		}
		response.sendRedirect("/FM/adminList");
	}
}
