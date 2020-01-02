package com.service;

import java.util.List;

import com.entity.Admin;

public interface AdminService {
	//添加用戶
	public int addAdmin(String username,String password );
	//删除
	public int delAdmin(int id);
	//改
	public int updateAdmin(Admin admin);
	//查找Admin是否存在
	public boolean login(String username,String password);
	//查找Admin username是否存在
	public boolean getAdminByName(String username); 
	//查找 根据id 查Admin
	public Admin getAdminById(int id); 
	//查所有
	public List<Admin> getAdminAll(int pageNo, int pageSize, String username);
	//查询数据总数
	public int getAdminDataCoutn(String username);
}
