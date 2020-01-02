package com.dao;

import java.util.List;

import com.entity.Admin;
import com.entity.User;
import org.apache.ibatis.annotations.*;

public interface AdminDao {
	//添加用戶
	@Insert("insert into admin(username,password) values(#{username},#{password})")
	public int addAdmin(@Param("username") String username, @Param("password") String password );

	//删除
	@Delete("delete from admin where id=#{id}")
	public int delAdmin(int id);

	//改
	@Update("update admin set username=#{username}, password=#{password}  where id= #{id}")
	public int updateAdmin(Admin admin);

	//查找Admin是否存在
	@Select("select * from admin where username=#{username} and password=#{password}")
	public Admin login(@Param("username") String username,
					   @Param("password") String password);

	//查找Admin username是否存在
	@Select("select username from admin where username=#{username}")
	public Admin getAdminByName(@Param("username")String username);

	//查找 根据id 查Admin
	@Select("select * from admin where id=#{id}")
	public Admin getAdminById(int id); 

	//查所有
	public List<Admin> getAdminAll(@Param("begin") int begin,
								   @Param("pageSize") int pageSize,
								   @Param("condition") String condition);

	//查询数据总数
    @Select("select count(1) from admin where #{condition}")
	public int getAdminDataCoutn(@Param("condition") String condition);
}
