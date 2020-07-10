package com.bota.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.authority;
import com.bota.bean.page;
import com.bota.bean.userauthority;
import com.bota.dao.AuthorityDao;
import com.bota.service.AuthorityService;

@Service("AuthorityServiceImpl")
public class AuthorityServiceImpl implements AuthorityService{
	
	@Resource
	private AuthorityDao ad;
	@Override
	public int addAuthority(authority a) {
		return ad.addAuthority(a);
	}
	
	@Override
	public List<authority> selectAuthority(page p){
		return ad.selectAuthority(p);
	}
	@Override
	public List<authority> selectallAuthority(){
		return ad.selectallAuthority();
	}
	@Override
	public int addpfauthority(userauthority ua) {
		return ad.addpfauthority(ua);
	}
	@Override
	public List<userauthority> selectpfauthority(userauthority ua){
		return ad.selectpfauthority(ua);
	}
	@Override
	public authority selectauthorityid(authority a) {
		return ad.selectauthorityid(a);
	}
}
