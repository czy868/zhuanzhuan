package com.bota.dao;

import java.util.List;
import java.util.Map;

import com.bota.bean.User;
import com.bota.bean.pfmanage;

public interface UserDao {
	
	public List<pfmanage> selectpf(String usernumber);
	
	/**
	 * 根据学号查询该用户是否存在
	 * @author bota
	 * @param userNumber
	 * @return
	 */
	public String selectUserByUserNumber(long userNumber);
	
	/**
	 * 验证登录信息
	 * @author bota
	 * @param usernumber 学号或工号
	 * @param password 密码
	 * @param identity 身份
	 * @return
	 */
	public Map<String, Object> verifyByUser(long userNumber, String password);

	/**
	 * 修改密码
	 * @param id 用户id
	 * @param password 新密码
	 * @return
	 */
	public int updateuserpwd(User u);
	public int adduser(User u);
	
}