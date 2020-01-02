package com.dao;

import com.entity.GoodsType;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

public class GoodsTypeDaoTest {
    SqlSession session=null;
    InputStream in=null;
    @Before
    public void init(){
        try {
            in = Resources.getResourceAsStream("SqlConfig.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            SqlSessionFactory factory = builder.build(in);
            session = factory.openSession(true);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @After
    public void destroy(){
        try {
            session.close();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void addGoodsType(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        GoodsType goodsType = new GoodsType();
        goodsType.setTypename("气球");
        int i = goodsTypeDao.addGoodsType(goodsType);
        System.out.println(i);
    }

    @Test
    public void delGoodsTypeById(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        goodsTypeDao.delGoodsTypeById(14);
    }

    @Test
    public void updateGoodsTypeById(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        GoodsType goodsType = new GoodsType();
        goodsType.setId(13);
        goodsType.setTypename("优质蔬菜");
        goodsTypeDao.updateGoodsTypeById(goodsType);
    }
    @Test
    public void getAllGoodsType(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        List<GoodsType> typeList = goodsTypeDao.getAllGoodsType();
        Iterator<GoodsType> iterator = typeList.iterator();
        while(iterator.hasNext()){
            System.out.println( iterator.next());
        }
    }

    @Test
    public void getAGoodsTypeById(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        GoodsType goodsType = goodsTypeDao.getAGoodsTypeById(13);
        System.out.println(goodsType);
    }

    @Test
    public void getGoodType(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        goodsTypeDao.getGoodType("优质蔬菜");
    }

    @Test
    public void getGoodTypeCount(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        int count = goodsTypeDao.getGoodTypeCount("蔬菜");
        System.out.println(count);
    }

    @Test
    public void getGoodsTypeFuzzy(){
        GoodsTypeDao goodsTypeDao = session.getMapper(GoodsTypeDao.class);
        List<GoodsType> typeList = goodsTypeDao.getGoodsTypeFuzzy(0, 5, "");
        for (GoodsType goodsType:typeList
             ) {
            System.out.println(goodsType);
        }
    }
}
