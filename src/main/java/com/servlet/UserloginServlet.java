package com.servlet;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
@WebServlet("/userLoginServlet")
public class UserloginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println("username: "+username+" password: "+password);
		UserService userService=new UserServiceImpl();

		//邮箱格式判断
		Pattern pattern=Pattern.compile("\\w+@(\\w+.)+[a-z]{2,3}");//\w表示a-z，A-Z，0-9(\\转义符)
		Matcher matcher=pattern.matcher(username);
		boolean judgeMail=matcher.matches();

		//登录
		boolean flag=false;
		User user=new User();
		if(judgeMail) {//邮箱登录
			String mail=username;
			flag=userService.getUserBymailAndPwd(mail, password);
			user=userService.getUserByMailAndPwd(mail, password);
		}else {
			flag=userService.getUserByNameAndPwd(username, password);//用户名登录
			user.setUsername(username);
			user.setPassword(password);
		}
		if(flag) {
			request.getSession().setAttribute("user",user);
			response.sendRedirect("/FM/goodsGetAllByPageFuzzy");
		}else {
			response.sendRedirect("/FM/after/userlogin.jsp");
		}
	}
}
