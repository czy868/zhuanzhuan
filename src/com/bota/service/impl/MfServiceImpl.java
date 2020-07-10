package com.bota.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.mf;
import com.bota.bean.page;
import com.bota.dao.MfDao;
import com.bota.service.MfService;

@Service("mfService")
public class MfServiceImpl implements MfService{
	
	@Resource
	private MfDao md;
	
	@Override
	public int addmf(mf m) {
		return md.addmf(m);
	}
	@Override
	public List<mf> selectallmf() {
		return md.selectallmf();
	}
	@Override
	public List<mf> selectlimitmf(page p) {
		return md.selectlimitmf(p);
	}
	@Override
	public List<mf> selectmf(mf m) {
		return md.selectmf(m);
	}
	@Override
	public int updatemf(mf m) {
		return md.updatemf(m);
	}
	@Override
	public List<mf> sousuomfname(mf m) {
		// TODO 自动生成的方法存根
		return md.sousuomfname(m);
	}
	@Override
	public void deletemf(mf m) {
		md.deletemf(m);
		
	}
	
	
}
