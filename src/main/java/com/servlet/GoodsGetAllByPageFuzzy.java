package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.entity.Goods;
import com.entity.GoodsType;
import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;
import com.util.PageUtil;
@WebServlet("/goodsGetAllByPageFuzzy")
public class GoodsGetAllByPageFuzzy extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsService goodsService=new GoodsServiceImpl();
		List<GoodsType> typelist=new ArrayList<GoodsType>();
		PageUtil pu=new PageUtil();
		/**获取页码*/		
		String pNo=request.getParameter("pageNo");
		int pageNo=1;
		int pageSize=5;
		if(pNo!=null) {
			pageNo=Integer.parseInt(pNo);
			if(pageNo<1) {//处理页码小于1问题
				pageNo=1;
			}
		}


		String goodsName=request.getParameter("goodsName");
		if(goodsName != null && !goodsName.equals("")){
			request.setAttribute("goodsName",goodsName);
		}
		String typeid =request.getParameter("typeId");
		int typeId = 0;
		if(typeid != null && !typeid.equals("")){
			typeId = Integer.parseInt(typeid);
			request.setAttribute("typeId",typeId);
		}
		//数据总条数  处理页码大于总页数问题
		int dataCount=goodsService.getGoodsDataCoutn(goodsName,typeId);
		pu.setPageSize(pageSize);
		pu.setDataCount(dataCount);
		int pageCount=pu.getPageCount();
		pu.setDataCount(dataCount);
		if(pageNo>pageCount) {            
			pageNo=pageCount;
			if(pageCount<1) {
				pageCount=1;
			}
		}
		pu.setPageNo(pageNo);

        System.out.println(pu);

		List<Goods> list=new ArrayList<Goods>();
		list=goodsService.getGoodsAndTypeFuzzy(pageNo, pageSize,goodsName,typeId);
		request.setAttribute("list", list);//遍历
		request.setAttribute("pu", pu);//分页
		request.getRequestDispatcher("/after/goods_list.jsp").forward(request, response);
	}

}
