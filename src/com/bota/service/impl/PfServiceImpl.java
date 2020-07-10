package com.bota.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.page;
import com.bota.bean.pfmanage;
import com.bota.bean.userauthority;
import com.bota.dao.PfDao;
import com.bota.service.PfService;

@Service("PfServiceImpl")
public class PfServiceImpl implements PfService{
	
	@Resource
	private PfDao pfdao;
	
	@Override
	public boolean addpfdo(pfmanage pf) {
		if(pfdao.addpfdo(pf)>0)
			return true;
		return false;
	}
	@Override
	public List<pfmanage> selectallpf(){
		return pfdao.selectallpf();
	}

	@Override
	public void deletpfau(userauthority ua) {
		pfdao.deletpfau(ua);
	}
	@Override
	public List<pfmanage> selectfypf(page p) {
		return pfdao.selectfypf(p);
	}
	@Override
	public List<pfmanage> selectpfxq(pfmanage p) {
		return pfdao.selectpfxq(p);
	}
	@Override
	public int updatepf(pfmanage p) {
		return pfdao.updatepf(p);
	}
	@Override
	public List<pfmanage> sousuopfname(pfmanage p) {
		return pfdao.sousuopfname(p);
	}
	@Override
	public void deletepf(pfmanage p) {
		pfdao.deletepf(p);
	}
}
