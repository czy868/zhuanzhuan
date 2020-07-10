package com.bota.dao.impl;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bota.bean.User;
import com.bota.bean.pfmanage;
import com.bota.dao.UserDao;
import com.bota.util.Dictionary;

@Repository("userDaoImpl")
public class UserDaoImpl extends CommonDaoImpl<User> implements UserDao{

	@Override
	public List<pfmanage> selectpf(String usernumber){
		return null;
	}
	

	@Override
	public String selectUserByUserNumber(long userNumber) {
		String sql = "select * from user where userNumber="+userNumber;
		Map<String, Object> map = super.findBySql(sql);
		if(map != null && map.size() > 0){
			return Dictionary.S_SUCCESS;
		}
		return Dictionary.S_FAIL;
	}

	
	@Override
	public Map<String,Object> verifyByUser(long userNumber, String password){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		String userSql = "select * from user where userNumber="+userNumber+" and password='"+password+"'";
		Map<String, Object> userMap = super.findBySql(userSql);
		if(userMap == null || userMap.size() <= 0){
			resultMap.put("status", Dictionary.S_PWD_ERR);
			return resultMap;
		}
		String sql = "select * from user where userNumber="+userNumber+" and password='"+password
				+"'";
		Map<String, Object> map = super.findBySql(sql);
		if(map == null || map.size() <= 0){
			resultMap.put("status", Dictionary.S_ROLE_ERR);
			return resultMap;
		}
		resultMap.put("status", Dictionary.S_SUCCESS);
		resultMap.put("map", map);
		return resultMap;
	}


	@Override
	public int updateuserpwd(User u) {
		return 1;
	}


	@Override
	public int adduser(User u) {
		// TODO 自动生成的方法存根
		return 0;
	}
	

}
