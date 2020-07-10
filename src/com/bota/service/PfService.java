package com.bota.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bota.bean.page;
import com.bota.bean.pfmanage;
import com.bota.bean.userauthority;

public interface PfService {
	
	public boolean addpfdo(pfmanage pf);
	public List<pfmanage> selectallpf();
	public void deletpfau(userauthority ua);
	public List<pfmanage> selectfypf(page p);
	public List<pfmanage> selectpfxq(pfmanage p);
	public int updatepf(pfmanage p);
	public List<pfmanage> sousuopfname(pfmanage p);
	public void deletepf(pfmanage p);
}
