package com.dao;

import com.entity.GoodsType;
import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserDaoTest {
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
    public void getUserDataCount(){
        UserDao userDao = session.getMapper(UserDao.class);
        int userDataCount = userDao.getUserDataCount("曹操");
        System.out.println(userDataCount);
    }

    @Test
    public void getAllUser(){
        UserDao userDao = session.getMapper(UserDao.class);
        List<User> typeList = userDao.getAllUser(0, 5, "曹操");
        System.out.println(typeList);
    }

    @Test
    public void addUser(){
        User user = new User();
        user.setMail("2322051198.qq.com");
        UserDao userDao = session.getMapper(UserDao.class);
        int i = userDao.addUser(user);
        System.out.println(i);
    }

    @Test
    public void getUserByNameAndPwd(){
        UserDao userDao = session.getMapper(UserDao.class);
        userDao.getUserByNameAndPwd("陈孟","0000");
    }

}
