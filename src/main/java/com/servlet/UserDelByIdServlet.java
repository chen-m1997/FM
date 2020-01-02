package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;
@WebServlet("/userDelByIdServlet")
public class UserDelByIdServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService=new UserServiceImpl();
		String ids= request.getParameter("ids");
		System.out.println(ids);
		String [] ID=ids.split(",");
		for (int i = 0; i < ID.length; i++) {
			if(!ID[i].equals("") && !ID[i].equals("null")) {
				userService.delUserById(Integer.parseInt(ID[i]));
			}
		}
		response.sendRedirect("/FM/userListSevlet");	
	}
}
