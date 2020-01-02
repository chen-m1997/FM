package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.GoodsService;
import com.service.GoodsTypeService;
import com.service.impl.GoodsServiceImpl;
import com.service.impl.GoodsTypeServiceImpl;
@WebServlet("/goodsTypeDelById")
public class GoodsTypeDelById extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsService gs=new GoodsServiceImpl();
		GoodsTypeServiceImpl gts=new GoodsTypeServiceImpl();
		int result=0;
		String ids= request.getParameter("ids");
		String [] ID=ids.split(",");
		for (int i = 0; i < ID.length; i++) {
			if(!ID[i].equals("") && !ID[i].equals("null")) {
				int id=Integer.parseInt(ID[i]);
				int goodsCount=gs.getGoodsByTypeId(id);
				if(goodsCount==0) {
					gts.delGoodsTypeById(id);
				}else {
					System.out.println("改类型仍存在商品");
				}
				
			}
			result++;
		}
		if(result>0) {
			response.sendRedirect("/FM/goodsTypeGetAll");
		}
		
	}
}
