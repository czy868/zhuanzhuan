package com.bota.dao;

import java.util.List;

import com.bota.bean.mf;
import com.bota.bean.minoutfile;
import com.bota.bean.page;

public interface MfioDao {
	public mf selectmfkc(mf m);
	public int updatemfkc(mf m);
	public int addmfio(minoutfile mfio);
	public List<minoutfile> selectinandout();
	public List<minoutfile> selectlimitinandou(page p);
}
