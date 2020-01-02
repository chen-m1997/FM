package com.service.impl;

import java.util.List;

import com.dao.GoodsDao;
import com.entity.Goods;
import com.service.GoodsService;
import com.util.MySqlsessionConnection;
import org.apache.ibatis.session.SqlSession;

public class GoodsServiceImpl implements GoodsService{
	SqlSession session = MySqlsessionConnection.getSqlSession();
	GoodsDao goodsDao=session.getMapper(GoodsDao.class);
	//添加商品
	public int addGoods(Goods goods) {
		return goodsDao.addGoods(goods);
	}
	//删除商品
	public int delGoodsById(int goodsid) {
		return goodsDao.delGoodsById(goodsid);
		
	}
	//改商品
	public int updateGoodsById(Goods goods) {
		return goodsDao.updateGoodsById(goods);
	}
	//遍历商品
	public List<Goods> getGoodsAndTypeFuzzy(int pageNo, int pageSize, String goodsName, int typeId) {
		if(pageNo<=0){
			pageNo = 1;
		}
		int begin = (pageNo-1)*pageSize;
		List<Goods> list=goodsDao.getGoodsAndTypeFuzzy(begin,pageSize,goodsName,typeId);
		return list;
	}
	//商品总数
	public int getGoodsDataCoutn(String goodsName,int typeId) {
		int coutn = goodsDao.getGoodsDataCoutn(goodsName, typeId);
		return coutn;
	}
	//据id查商品
	public Goods getGoods(int goodsid) {
		return goodsDao.getGoods(goodsid);
	}
	//据名称查商品
	public boolean getGoodsByName(String goodsName) {
		boolean falg = false;
		Goods goods = goodsDao.getGoodsByName(goodsName);
		if(goods != null){
			falg = true;
		}
		return falg;
	}
	//查某类型商品数量 据商品id
	public int getGoodsByTypeId(int typeId) {
		return goodsDao.getGoodsByTypeId(typeId);
	}
}
