package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;

@WebServlet("/checkGoodsName")
//可用
public class CheckGoodsName extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String goodsName=request.getParameter("goodsName");
		GoodsService gs=new GoodsServiceImpl();
		if(gs.getGoodsByName(goodsName)) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}

}
