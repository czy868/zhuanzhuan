package com.bota.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.User;
import com.bota.bean.pfmanage;
import com.bota.dao.UserDao;
import com.bota.redis.JedisPoolUtil;
import com.bota.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDaoImpl;
	
	@Resource
	private UserDao userDao;
	
	
	
	@Override
	public List<pfmanage> selectpf(String usernumber){
		return userDao.selectpf(usernumber);
	}


	@Override
	public String selectUserByUserNumber(long userNumber) {
		
		return userDaoImpl.selectUserByUserNumber(userNumber);
	}
	
	@Override
	public Map<String, Object> verifyByUser(User user) {
		long usernumber = user.getUsernumber();
		String password = user.getPassword();
		return userDaoImpl.verifyByUser(usernumber,password);
	}


	@Override
	public int updateuserpwd(User u) {
		return userDao.updateuserpwd(u);
	}


	@Override
	public int adduser(User u) {	
		return userDao.adduser(u);
	}

}
