package com.bota.dao;

import java.util.List;

import com.bota.bean.page;
import com.bota.bean.pfmanage;
import com.bota.bean.userauthority;

public interface PfDao {

	public int addpfdo(pfmanage pf);
	public List<pfmanage> selectallpf();
	public void deletpfau(userauthority ua);
	public List<pfmanage> selectfypf(page p);
	public List<pfmanage> selectpfxq(pfmanage p);
	public int updatepf(pfmanage p);
	public List<pfmanage> sousuopfname(pfmanage p);
	public void deletepf(pfmanage p);
}
