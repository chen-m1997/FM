package com.service;

import java.util.List;

import com.entity.Goods;

public interface GoodsService {
	//添加商品
		public int addGoods(Goods goods); 
		//删除商品
		public int delGoodsById(int goodsid);
		//改商品
		public int updateGoodsById(Goods goods);
		//联合模糊查询兼分页
		public List<Goods> getGoodsAndTypeFuzzy(int pageNo, int pageSize, String goodsName,int typeId);
		//查商品总数
		public int getGoodsDataCoutn(String goodsName,int typeId);
		//据名称商品id查商品
		public Goods getGoods(int goodsid);
		//据名称查商品
		public boolean  getGoodsByName(String goodsName);
		//查某类型商品数量据 商品id
		public int getGoodsByTypeId(int typeId);
}
