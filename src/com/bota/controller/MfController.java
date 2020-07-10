package com.bota.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bota.bean.authority;
import com.bota.bean.mf;
import com.bota.bean.page;
import com.bota.service.MfService;

@Controller
public class MfController {

	@Autowired
	private MfService mf; 
	@RequestMapping("mf")
	public String mf() {
		return "mf/addmf";
	}
	
	@RequestMapping("addmf")
	@ResponseBody
	public String addmf(String mnumber,String mname,String model,String unit,int number,String Remarks) {
		mf m=new mf();
		m.setMnumber(mnumber);
		m.setMname(mname);
		m.setModel(model);
		m.setUnit(unit);
		m.setNumber(number);
		m.setRemarks(Remarks);
		if(mf.addmf(m)>0)
			return "a";
		return "b";
	}
	@RequestMapping("selectallmf")
	public String sleectallmf(HttpServletRequest request,HttpSession session,int pageNum,int pageSize){
		List<mf> list=new ArrayList<>();
		pageSize=5;
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(pageSize);
		List<mf> listall=mf.selectallmf();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("mfpage", page);
		System.out.println(pageNum+" "+pageSize);
		list=mf.selectlimitmf(p);
		session.setAttribute("mflist", list);
		session.setAttribute("mfpageNum", pageNum);
		return "mf/selectmf";
	}
	@RequestMapping("selectmf")
	public String selectmf(String mnumber,HttpSession session) {
		mf m=new mf();
		m.setMnumber(mnumber);
		List<mf> list=mf.selectmf(m);
		session.setAttribute("mfxqlist", list);
		return "mf/mfxq";
	}
	
	@RequestMapping("mnextpage")
	@ResponseBody
	public String nextpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("mfpageNum")+1;
		int maxpage=(Integer)session.getAttribute("mfpage");
		if(pageNum>maxpage)
			return "b";
		else {
			List<mf> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=mf.selectlimitmf(p);
			System.out.println(list.size());
			session.setAttribute("mflist", list);
			session.setAttribute("mfpageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("magopage")
	@ResponseBody
	public String agopage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("mfpageNum")-1;
		int maxpage=(Integer)session.getAttribute("mfpage");
		if(pageNum==0)
			return "b";
		else {
			List<mf> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=mf.selectlimitmf(p);
			System.out.println(list.size());
			session.setAttribute("mflist", list);
			session.setAttribute("mfpageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("mfirstpage")
	@ResponseBody
	public String firstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<mf> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=mf.selectlimitmf(p);
		System.out.println(list.size());
		session.setAttribute("mflist", list);
		session.setAttribute("mfpageNum", pageNum);
		return "a";
	}

	@RequestMapping("mlastpage")
	@ResponseBody
	public String lastpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("mfpage");
		int maxpage=(Integer)session.getAttribute("mfpage");
		List<mf> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=mf.selectlimitmf(p);
		System.out.println(list.size());
		session.setAttribute("mflist", list);
		session.setAttribute("mfpageNum", pageNum);
		return "a";
	}
	
	/*
	 * 查看并且更新物料信息
	 */
	@RequestMapping("changemf")
	@ResponseBody
	public String changemf(String mnumber,String mname,String model,String unit,int number,String Remarks) {
		mf m=new mf();
		System.out.println(mnumber+mname+model);
		m.setMnumber(mnumber);
		m.setMname(mname);
		m.setModel(model);
		m.setNumber(number);
		m.setUnit(unit);
		m.setRemarks(Remarks);
		if(mf.updatemf(m)>0) {
			return "a";
		}
		return "b";
	}
	
	@RequestMapping("mmfirstpage")
	public String mfirstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<mf> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=mf.selectlimitmf(p);
		System.out.println(list.size());
		session.setAttribute("mflist", list);
		session.setAttribute("mfpageNum", pageNum);
		return "mf/selectmf";
	}
	/*
	 * 这里是单独搜索物料
	 */
	@RequestMapping("sousuomfname")
	@ResponseBody
	public String sousuomfname(String mname,int rn,HttpSession session) {
		mf m=new mf();
		m.setMname(mname);
		List<mf> list=mf.sousuomfname(m);
		if(list.size()>0) {
			session.setAttribute("sousuomflist", list);
			return "a";
		}
		return "b";
	}
	/*
	 * 
	 */
	@RequestMapping("deletemf")
	public String deletemf(String mnumber,HttpSession session) {
		mf m=new mf();
		m.setMnumber(mnumber);
		mf.deletemf(m);
		int pageNum=1;
		List<mf> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=mf.selectlimitmf(p);
		System.out.println(list.size());
		session.setAttribute("mflist", list);
		session.setAttribute("mfpageNum", pageNum);
		return "mf/selectmf";
	}
}
