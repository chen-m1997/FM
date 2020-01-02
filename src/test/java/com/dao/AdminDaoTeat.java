package com.dao;

import com.entity.Admin;
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

public class AdminDaoTeat {
    SqlSession session = null;
    InputStream in = null;
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
    //OK
    public void addAdmin(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        String username = "陈萌";
        String password = "0000";
        adminDao.addAdmin(username,password);
    }

    @Test//OK
    public void delAdmin(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        adminDao.delAdmin(40);
    }

    @Test
    public void updateAdmin(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        Admin admin = new Admin();
        admin.setUsername("杨玉环");
        admin.setPassword("0000");
        admin.setId(38);
        adminDao.updateAdmin(admin);
    }

    @Test//OK
    public void login(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        String username = "陈孟";
        String password = "0000";
        Admin admin = adminDao.login(username, password);
        System.out.println(admin);
    }

    @Test
    public void getAdminByName(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        Admin admin = adminDao.getAdminByName("陈孟");
        System.out.println(admin);
    }

    @Test
    public void getAdminById(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        Admin admin = adminDao.getAdminById(39);
        System.out.println(admin);
    }

    @Test
    public void getAdminAll(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        String condition = " 1=1 ";
        int begin=1;
        int pageSize=2;
        List<Admin> adminList = adminDao.getAdminAll(begin, pageSize, condition);
        System.out.println(adminList);
    }

    @Test
    public void getAdminDataCoutn(){
        AdminDao adminDao = session.getMapper(AdminDao.class);
        int coutn = adminDao.getAdminDataCoutn("1=1");
        System.out.println(coutn);
    }

}
