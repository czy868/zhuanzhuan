package com.bota.service;

import java.util.List;
import java.util.Map;

import com.bota.bean.User;
import com.bota.bean.pfmanage;

public interface UserService {
	
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
	 * @param user
	 * @return
	 */
	public Map<String, Object> verifyByUser(User user);
	public int updateuserpwd(User u);
	public int adduser(User u);
}
