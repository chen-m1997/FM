package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.GoodsType;
import com.service.GoodsTypeService;
import com.service.impl.GoodsTypeServiceImpl;
import com.util.PageUtil;
@WebServlet("/goodsTypeGetAll")
public class GoodsTypeGetAll extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsTypeServiceImpl gts=new GoodsTypeServiceImpl();
		//模糊查询SQL
		String goodTypeName=request.getParameter("goodTypeName");
		if(goodTypeName != null && !goodTypeName.equals("")){
			request.setAttribute("goodTypeName",goodTypeName);
		}
		//页码设置（超范围处理）
		PageUtil pu=new PageUtil();
		String pNo=request.getParameter("pageNo");
		//	System.out.println("获取pNo:  "+pNo);
		int pageNo=0;
		int pageSize=5;

		if(pNo==null) {
			pNo="1";
		}else {
			pageNo=Integer.parseInt(pNo);
		}
		if(pageNo<=1) {
			pageNo=1;
				System.out.println("pNo<=1:处理后：  "+pNo);
		}
		//数据总条数 处理页码超范围
		int dataCount=gts.getGoodTypeCount(goodTypeName);
		System.out.println("dataCount:  "+dataCount);
		pu.setPageSize(pageSize);        //每页显示数据
		pu.setDataCount(dataCount);      //数据总条数
		pu.setPageNo(pageNo);		     //页码
		int pageCount=pu.getPageCount(); //页码总数
		if(pageNo>pageCount) {
			if(pageCount<1) {
				pageNo=1;
			}
			pageNo=pageCount;
		}

		System.out.println(pu);
		//执行
		List<GoodsType> goodsTypelist=gts.getGoodsTypeFuzzy(pageNo, pageSize, goodTypeName);

		//数据装车
		request.setAttribute("pu", pu);
		request.setAttribute("goodsTypelist",goodsTypelist);
		//数据发送
		request.getRequestDispatcher("/after/goods_type_list.jsp").forward(request, response);;
	}
}
