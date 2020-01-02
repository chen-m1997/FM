package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Admin;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
import com.util.PageUtil;
@WebServlet("/adminList")
public class AdminList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService adminServer=new AdminServiceImpl();
		PageUtil pu=new PageUtil();
		//模糊查询
		String username=request.getParameter("username");
		//分页
		String pNo=request.getParameter("pageNo");
		int pageNo=0;
		int pageSize=5;
		if(pNo==null) {
			pNo="1";
		}
		if(pNo!=null && !("").equals(pNo)) {
			pageNo=Integer.parseInt(pNo);
		}
		if(pageNo<1) {
			pageNo=1;
		}
		int dataCount=adminServer.getAdminDataCoutn(username);
		pu.setPageNo(pageNo);
		pu.setPageSize(pageSize);
		pu.setDataCount(dataCount);
		int pageCount=pu.getPageCount();
		if(pageNo>pageCount) {
			pageNo=pageCount;
			if(pageCount<1) {//当数据总条数为0，页码设为1.避免SQL语句错误
				pageNo=1;
			}
			pu.setPageCount(pageCount);
		}
	//	System.out.println("dataCount:  "+dataCount+"pageNo:"+pageNo+" pageCount:"+pageCount);
		List<Admin> adminList= adminServer.getAdminAll(pageNo, pageSize,username);
		request.setAttribute("pu", pu);
		request.setAttribute("adminList", adminList);
		request.getRequestDispatcher("/after/admin_list.jsp").forward(request, response);
	}
}
