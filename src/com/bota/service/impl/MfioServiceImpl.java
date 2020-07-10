package com.bota.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.mf;
import com.bota.bean.minoutfile;
import com.bota.bean.page;
import com.bota.dao.MfioDao;
import com.bota.service.MfinouService;
@Service("mfioService")
public class MfioServiceImpl implements MfinouService{

	@Resource
	private MfioDao miod;
	
	@Override
	public mf selectmfkc(mf m) {
		return miod.selectmfkc(m);
		
	}

	@Override
	public int updatemfkc(mf m) {
		return miod.updatemfkc(m);
	}

	@Override
	public int addmfio(minoutfile mfio) {
		return miod.addmfio(mfio);
	}

	@Override
	public List<minoutfile> selectinandout() {
		return miod.selectinandout();
	}

	@Override
	public List<minoutfile> selectlimitinandou(page p) {
		return miod.selectlimitinandou(p);
	}

}
