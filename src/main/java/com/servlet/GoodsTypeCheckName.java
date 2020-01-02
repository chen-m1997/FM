package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.GoodsTypeService;
import com.service.impl.GoodsTypeServiceImpl;
@WebServlet("/goodsTypeCheckName")
public class GoodsTypeCheckName extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String typename=req.getParameter("typename");
		GoodsTypeServiceImpl gts =new GoodsTypeServiceImpl();
		if(gts.getGoodType(typename)) {
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
