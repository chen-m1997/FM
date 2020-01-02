package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
@WebServlet("/userUpdateOrAdd")
public class UserUpdateOrAddServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService=new UserServiceImpl();
		User user=new User();
		String ID=request.getParameter("id");
		String username=request.getParameter("username");
		String phone=request.getParameter("phone");
		String mail=request.getParameter("mail");
		String password=request.getParameter("password");
		
		user.setUsername(username);
		user.setPhone(phone);
		user.setMail(mail);
		user.setPassword(password);
		if(ID!=null && !"".equals(ID)) {//ID存在 修改用户信息
			int id=Integer.parseInt(ID);
			user.setId(id);
			userService.updateUserById(user);
			response.sendRedirect("/FM/userListSevlet");
		}else {//ID不存在，添加用户。 用户名 和 email 不存在，添加用户
			if(!(userService.getUserBymail(mail)) && !(userService.getUserByUsername(username))) {
				userService.addUser(user);
			}
			response.sendRedirect("/FM/goodsGetAllByPageFuzzy");
		}
	}
}
