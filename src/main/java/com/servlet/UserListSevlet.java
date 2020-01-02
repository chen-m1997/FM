package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.util.PageUtil;
@WebServlet("/userListSevlet")
public class UserListSevlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService=new UserServiceImpl();
		//模糊查询Sql部分
		String username=request.getParameter("username");
		if(username != null && !username.equals("")){
			request.setAttribute("username",username);
		}
		//分页部分
		PageUtil pu=new PageUtil();
		int pageSize=5;
		int pageNo=1;
		String pNo=request.getParameter("pageNo");
		if(pNo!=null) {                  //页码小于1处理
			pageNo=Integer.parseInt(pNo);
			if(pageNo<=1) {
				pageNo=1;
			}
		}

		//获取总页数
		int dataCount=userService.getUserDataCount(username);
		pu.setPageNo(pageNo);
		pu.setDataCount(dataCount);
		pu.setPageSize(pageSize);
		int pageCount=pu.getPageCount();
		if(pageNo>pageCount) {
			pageNo=pageCount;
			if(pageCount<1) {
				pageNo=1;
			}
			pu.setPageCount(pageCount);
		}
		
		List<User> userList=userService.getAllUser(pageNo, pageSize, username);
		request.setAttribute("pu", pu);
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/after/user.jsp").forward(request, response);
	}
}
