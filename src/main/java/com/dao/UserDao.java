package com.dao;

import java.util.List;

import com.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserDao {
//添加用户
public int addUser(User user);
//删除
public int delUserById(@Param("id") int id);
//改
public int updateUserById(User user);
//查 据 id
public User getUserById(int id);
//查 据 username
public User  getUserByUsername(@Param("username") String username);
//查 据 mail
public User  getUserBymail(@Param("mail") String mail);
//查 数据总条数
public int getUserDataCount(@Param("username") String username);
//查 所有
public List<User> getAllUser(@Param("begin") int begin, @Param("pageSize") int pageSize,@Param("username")String username);
//查 据 username password
public User getUserByNameAndPwd(@Param("username")String username,@Param("password")String password);
//查 据 mail password
public User getUserBymailAndPwd(@Param("mail")String mail,@Param("password")String password);
//查 据 mail password
public User getUserByMailAndPwd(@Param("mail")String mail,@Param("password")String password);

}
