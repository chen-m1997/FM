package com.service;

import java.util.List;

import com.entity.User;

public interface UserService {
	//添加用户
	public int addUser(User user);
	//删除
	public int delUserById(int id);
	//改
	public int updateUserById(User user);
	//查 据 id
	public User getUserById(int id);
	//查 据 username
	public boolean  getUserByUsername(String username); 
	//查 据 mail
	public boolean  getUserBymail(String mail); 
	//查 数据总条数
	public int getUserDataCount(String username);
	//查 所有
	public List<User> getAllUser(int pageNo, int pageSize, String username);
	//查 据 username password
	public boolean getUserByNameAndPwd(String username,String password);
	//查 据 mail password
	public boolean getUserBymailAndPwd(String mail,String password);
	//查 据 mail password
	public User getUserByMailAndPwd(String mail,String password);
}
