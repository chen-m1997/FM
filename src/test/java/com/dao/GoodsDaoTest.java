package com.dao;

import com.entity.Goods;
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
import java.util.Date;
import java.util.List;

public class GoodsDaoTest {

    InputStream in = null;
    SqlSession session = null;
    @Before
    public void init()  {
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
    public void addGoods(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        Goods goods = new Goods();
        goods.setGoodsName("502");
        int i = goodsDao.addGoods(goods);
        Logger logger = Logger.getLogger("GoodsDao.xml");
        logger.debug(i);
    }

    @Test
    public void delGoodsById(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        goodsDao.delGoodsById(32);
    }

    @Test
    public void updateGoodsById(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        Goods goods = new Goods();
        goods.setId(31);
        goods.setGoodsName("牛二");
        goods.setPrice(123);
        goods.setImgPath("dlrb1.png");
        goods.setDescription("好");
        goodsDao.updateGoodsById(goods);
    }

    @Test
    public void getGoodsAndTypeFuzzy(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        List<Goods> goodsList = goodsDao.getGoodsAndTypeFuzzy(0, 5, "小",1);
        Logger logger = Logger.getLogger("GoodsDao.xml");
        logger.debug(goodsList);
    }
    @Test
    public void getGoodsDataCoutn(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        int coutn = goodsDao.getGoodsDataCoutn("小",1);
        System.out.println(coutn);
    }

    @Test
    public void getGoodsByName(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        Goods goods = goodsDao.getGoodsByName("小米8");
        System.out.println(goods);
    }

    @Test
    public void getGoods(){
        GoodsDao goodsDao = session.getMapper(GoodsDao.class);
        Goods goods = goodsDao.getGoods(5);
        Logger logger = Logger.getLogger("GoodsDao.xml");
        logger.debug(goods);
    }
}
