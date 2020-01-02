package com.dao;

import java.util.List;

import com.entity.GoodsType;
import org.apache.ibatis.annotations.*;

public interface GoodsTypeDao {
	//商品类型 增
	@Insert("insert into t_goodstype(typename) values(#{typename})")
	public int addGoodsType(GoodsType gsType);    
	//商品类型 删 据id
	@Delete("DELETE FROM t_goodstype WHERE id = #{typeId}")
	public int delGoodsTypeById(int typeId);
	//商品类型 改 据id
	@Update("update t_goodstype set typename=#{typename} where id=#{id}")
	public int updateGoodsTypeById(GoodsType gsType);
	//商品类型 查 遍历
	@Select("select * from t_goodstype")
	public List<GoodsType> getAllGoodsType();   
	//商品类型 查 据id
	@Select("select * from t_goodstype where id=#{typeId}")
	public GoodsType getAGoodsTypeById(int typeId);
	//商品类型 查 据姓名
	@Select("select * from t_goodstype where  typename = #{typeName}")
	public GoodsType getGoodType (@Param("typeName") String typeName );
	//商品类型 查 数据条数
	@Select("select count(1) from t_goodstype where typename like '%${typename}%'")
	public int getGoodTypeCount (@Param("typename") String typename);
	//商品类型 模糊查 分页
	public List<GoodsType> getGoodsTypeFuzzy(@Param("begin") int begin, @Param("pageSize") int pageSize, @Param("typename") String typename);
}
