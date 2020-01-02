package com.servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.entity.Goods;
import com.entity.GoodsType;
import com.service.GoodsService;
import com.service.GoodsTypeService;
import com.service.impl.GoodsServiceImpl;
import com.service.impl.GoodsTypeServiceImpl;

@WebServlet("/goodsSaveOrUpdate")
@MultipartConfig
public class GoodsSaveOrUpdate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Goods goods = new Goods();
		GoodsType goodstype=new GoodsType();
		GoodsTypeServiceImpl gst=new GoodsTypeServiceImpl();

		String id = request.getParameter("id");
		String goodsName = request.getParameter("goodsName");
		String price = request.getParameter("price");
		if(price!=null) {
			double prices = Double.parseDouble(price);
			goods.setPrice(prices);
		}
		String description = request.getParameter("description");
		String typeId = request.getParameter("typeId");
		//System.out.println("TypeId:"+typeId);
		if (!("".equals(typeId)) && typeId != null) {
			int tid = Integer.parseInt(typeId);
			goods.setTypeId(tid);
			goodstype=gst.getAGoodsTypeById(tid);
		}
		goods.setGoodsName(goodsName);
		goods.setDescription(description);
		goods.setGoodsType(goodstype);
		//图片部分	
		Part part = request.getPart("imgPath");   //获取指定表单文件    
		String imgName = part.getSubmittedFileName();//获取图片名称，通过UUID设置特有名，防止重名。
		if(imgName==null || imgName.equals("")) {
			String img=request.getParameter("img");
			//System.out.println(img);
			goods.setImgPath(img);
		}else {
			//将文件写入指定路径
			part.write("D:\\apache-tomcat-8.5.43-windows-x64-FILE\\apache-tomcat-8.5.43\\webapps\\uploadfile\\images\\"+ imgName);
			goods.setImgPath(imgName);
		}
		GoodsService gs = new GoodsServiceImpl();
		int result = 0;
		if (!(id.equals("")) && id != null) {
			int ID = Integer.parseInt(id);
			goods.setId(ID);
			result =gs.updateGoodsById(goods);//修改
			//System.out.println(result);
		} else {
			if(!gs.getGoodsByName(goodsName)) {
				result = gs.addGoods(goods);//添加
			}
		}
		response.sendRedirect("/FM/goodsGetAllByPageFuzzy");
	}
}
