package com.bota.service;

import java.util.List;

import com.bota.bean.mf;
import com.bota.bean.page;

public interface MfService {

	public int addmf(mf m);
	public List<mf> selectallmf();
	public List<mf> selectlimitmf(page p);
	public List<mf> selectmf(mf m);
	public int updatemf(mf m);
	public List<mf> sousuomfname(mf m);
	public void deletemf(mf m);
}
