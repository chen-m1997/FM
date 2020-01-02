package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.GoodsType;
import com.service.GoodsTypeService;
import com.service.impl.GoodsTypeServiceImpl;
@WebServlet("/goodTypeaddOrUpdate")
public class GoodsTypeUpdateById extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String typeId=request.getParameter("id");
		String typename=request.getParameter("typename");
		GoodsTypeServiceImpl gts =new GoodsTypeServiceImpl();
		GoodsType gsType=new GoodsType();
		int id=0;
		if(typeId!=null && !"".equals(typeId) ) {
			id=Integer.parseInt(typeId);
			gsType.setId(id);
		}
		gsType.setTypename(typename);
		System.out.println("id  "+id+"gsType  "+gsType);
		if(id!=0) {
			gts.updateGoodsTypeById(gsType);
		}else {
			if(!gts.getGoodType(typename)) {
				gts.addGoodsType(gsType);
			}
		}
		response.sendRedirect("/FM/goodsTypeGetAll");
	}
	
}
