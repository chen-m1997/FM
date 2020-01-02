package com.dao;

import java.util.List;

import com.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface GoodsDao {

	//添加商品
	public int addGoods(Goods goods); 
	//删除商品
	public int delGoodsById(int goodsid);
	//改商品
	public int updateGoodsById(Goods goods);
	//联合模糊查询兼分页
	public List<Goods> getGoodsAndTypeFuzzy(@Param("begin") int begin,
											@Param("pageSize")int pageSize,
											@Param("goodsName")String goodsName,
											@Param("typeId")int typeId);
	//查商品总数
	public int getGoodsDataCoutn(@Param("goodsName")String goodsName,
								 @Param("typeId")int typeId);
	//据名称商品id查商品
	public Goods getGoods(int goodsid);
	//据名称查商品
	public Goods  getGoodsByName(@Param("goodsName")String goodsName);
	//查某类型商品数量据 商品id
	public int getGoodsByTypeId(int typeId);
}
