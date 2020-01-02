package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Goods;
import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;
@WebServlet("/goodsDelById")
public class GoodsDelById extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsService gs=new GoodsServiceImpl();
		Goods goods=new Goods();
		int result=0;
		String ids=request.getParameter("ids");
		String[] ID=ids.split(",");

		for (int i = 0; i < ID.length; i++) {
			if(!"".equals(ID[i])) {
				int id=Integer.parseInt(ID[i]);
				gs.delGoodsById(id); 
				result++; 
			}
		}

		if(result>0) {
			response.sendRedirect("/FM/goodsGetAllByPageFuzzy");
		}
	}
}
