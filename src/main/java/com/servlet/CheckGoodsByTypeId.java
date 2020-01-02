package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;
@WebServlet("/checkGoodsByTypeId")
public class CheckGoodsByTypeId extends HttpServlet{

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
		GoodsService gs=new GoodsServiceImpl();
		String typeid=request.getParameter("typeId");
		int typeId = 0;
		if(typeid != null && typeid.equals("")){
			typeId = Integer.parseInt(typeid);
		}
		int count = gs.getGoodsByTypeId(typeId);
		if(count>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		System.out.println("checkGoodsByTypeId");
	}
}
