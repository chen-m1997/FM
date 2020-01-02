package com.service.impl;

import java.util.List;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import com.util.MySqlsessionConnection;
import org.apache.ibatis.session.SqlSession;

public class UserServiceImpl implements UserService{
	SqlSession session = MySqlsessionConnection.getSqlSession();
	UserDao userDao=session.getMapper(UserDao.class);
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	public int delUserById(int id) {
		return userDao.delUserById(id);
	}

	public int updateUserById(User user) {
		return userDao.updateUserById(user);
	}

	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	public boolean getUserByUsername(String username) {
		boolean falg = false;
		User user = userDao.getUserByUsername(username);
		if (user != null){
			falg = true;
		}
		return falg;
	}

	public boolean getUserBymail(String mail) {
		boolean falg = false;
		User user = userDao.getUserBymail(mail);
		if (user != null){
			falg = true;
		}
		return falg;
	}

	public int getUserDataCount(String username) {
		return userDao.getUserDataCount(username);
	}
	
	public List<User> getAllUser(int pageNo, int pageSize, String username) {
		if(pageNo <= 0){
			pageNo = 1;
		}
		int begin = (pageNo-1)*pageSize;
		return userDao.getAllUser(begin, pageSize, username);
	}

	public boolean getUserByNameAndPwd(String username, String password) {
		boolean falg = false;
		User user = userDao.getUserByNameAndPwd(username, password);
		if (user != null){
			falg = true;
		}
		return falg;
	}

	public boolean getUserBymailAndPwd(String mail, String password) {
		boolean falg = false;
		User user = userDao.getUserBymailAndPwd(mail, password);
		if (user != null){
			falg = true;
		}
		return falg;
	}

	public User getUserByMailAndPwd(String mail, String password) {
		return userDao.getUserByMailAndPwd(mail, password);
	}

}
