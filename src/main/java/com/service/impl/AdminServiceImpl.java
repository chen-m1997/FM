package com.service.impl;

import java.util.List;

import com.dao.AdminDao;
import com.entity.Admin;
import com.service.AdminService;
import com.util.MySqlsessionConnection;
import org.apache.ibatis.session.SqlSession;

public class AdminServiceImpl implements AdminService{
	SqlSession session = MySqlsessionConnection.getSqlSession();
	AdminDao adminDao=session.getMapper(AdminDao.class);
	public int addAdmin(String username, String password) {
		return adminDao.addAdmin(username, password);
	}

	public boolean login(String username, String password) {
		boolean falg = false;
		Admin admin = adminDao.login(username, password);
		if(admin != null){
			falg = true;
		}
		return falg;
	}

	public boolean getAdminByName(String username) {
		boolean falg = false;
		Admin admin = adminDao.getAdminByName(username);
		if(admin != null){
			falg = true;
		}
		return falg;
	}

	public List<Admin> getAdminAll(int pageNo, int pageSize, String username) {
		if(pageNo <= 0 ){
			pageNo = 1;
		}
		int begin = (pageNo-1)*pageSize;
		return adminDao.getAdminAll(begin, pageSize, username);
	}

	public int delAdmin(int id) {
		return adminDao.delAdmin(id);
	}

	public int updateAdmin(Admin admin) {
		return adminDao.updateAdmin(admin);
	}

	public Admin getAdminById(int id) {
		return adminDao.getAdminById(id);
	}

	public int getAdminDataCoutn(String condition) {
		return adminDao.getAdminDataCoutn(condition);
	}
}
