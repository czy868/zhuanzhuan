package com.bota.dao;

import java.util.List;

import com.bota.bean.authority;
import com.bota.bean.page;
import com.bota.bean.userauthority;

public interface AuthorityDao {

	public int addAuthority(authority a);
	public List<authority> selectAuthority(page p);
	public List<authority> selectallAuthority();
	public int addpfauthority(userauthority ua);
	public List<userauthority> selectpfauthority(userauthority ua);
	public authority selectauthorityid(authority a);
}
