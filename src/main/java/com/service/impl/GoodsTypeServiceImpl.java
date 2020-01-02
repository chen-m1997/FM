package com.service.impl;

import java.util.List;

import com.dao.GoodsTypeDao;
import com.entity.GoodsType;
import com.service.GoodsTypeService;
import com.util.MySqlsessionConnection;
import org.apache.ibatis.session.SqlSession;

public class GoodsTypeServiceImpl implements GoodsTypeService{
	SqlSession session = MySqlsessionConnection.getSqlSession();
	GoodsTypeDao goodsTypeDao=session.getMapper(GoodsTypeDao.class);
	//商品类型添加
	public int addGoodsType(GoodsType gsType) {
		return goodsTypeDao.addGoodsType(gsType);
	}
	//删除类型
	public int delGoodsTypeById(int typeId) {
		return goodsTypeDao.delGoodsTypeById(typeId);
	}
	//改类型
	public int updateGoodsTypeById(GoodsType gsType) {
		return goodsTypeDao.updateGoodsTypeById(gsType);
	}
	//遍历
	public List<GoodsType> getAllGoodsType() {
		List<GoodsType> GoodstypeList=goodsTypeDao.getAllGoodsType();
		return GoodstypeList;
	}
	//据id查类型
	public GoodsType getAGoodsTypeById(int typeId) {
		GoodsType goodsType=goodsTypeDao.getAGoodsTypeById(typeId);
		return goodsType;
	}
	//据名称查类型
	public boolean getGoodType(String typeName) {
		boolean falg = false;
		GoodsType goodType = goodsTypeDao.getGoodType(typeName);
		if(goodType != null){
			falg = true;
		}
		return falg;
	}
	
	//数据总数 ok
	public int getGoodTypeCount(String typeName) {
		return goodsTypeDao.getGoodTypeCount(typeName);
	}
	//分页
	public List<GoodsType> getGoodsTypeFuzzy(int pageNo, int pageSize, String typeName) {
		if(pageNo <= 0){
			pageNo = 1;
		}
		int begin = (pageNo-1)*pageSize;
		return goodsTypeDao.getGoodsTypeFuzzy(begin, pageSize, typeName);
	}

}
