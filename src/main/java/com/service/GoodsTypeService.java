package com.service;

import java.util.List;

import com.entity.GoodsType;

public interface GoodsTypeService {
	//商品类型 增
	public int addGoodsType(GoodsType gsType);    
	//商品类型 删 据id
	public int delGoodsTypeById(int typeId);
	//商品类型 改 据id
	public int updateGoodsTypeById(GoodsType gsType);
	//商品类型 查 遍历
	public List<GoodsType> getAllGoodsType();   
	//商品类型 查 据id
	public GoodsType getAGoodsTypeById(int typeId);
	//商品类型 查 据姓名
	public boolean getGoodType (String typeName );
	//商品类型 查 数据条数
	public int getGoodTypeCount (String typeName);
	//商品类型 模糊查 分页
	public List<GoodsType> getGoodsTypeFuzzy(int pageNo, int pageSize, String typeName);
}
