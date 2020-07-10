package com.bota.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bota.bean.User;
import com.bota.bean.authority;
import com.bota.bean.page;
import com.bota.bean.pfmanage;
import com.bota.bean.userauthority;
import com.bota.service.AuthorityService;
import com.bota.service.PfService;
import com.bota.service.UserService;

@Controller
public class Pfcontroller {

	@Autowired
	private PfService pfs;
	
	@Autowired
	private AuthorityService as;
	@Autowired
	private UserService users;
	
	@RequestMapping("addpf")
	public String addpf() {
		return "pf/addpf";
	}
	@RequestMapping("addpfdo")
	@ResponseBody
	public String addpfdo(String usernumber,String username,String sex,String birthday,String idnumber,String jg,String hometown,String phone,String remarks) {
		System.out.println(usernumber+" "+username);
		pfmanage pf=new pfmanage();
		pf.setUsernumber(usernumber);
		pf.setUsername(username);
		pf.setSex(sex);
		pf.setBirthday(birthday);
		pf.setIdnumber(idnumber);
		pf.setJg(jg);
		pf.setHometown(hometown);
		pf.setPhone(phone);
		pf.setRemarks(remarks);
		User u=new User();
		u.setUsernumber(Long.valueOf(usernumber));
		u.setPassword("111");
		u.setUsername(username);
		users.adduser(u);
		if(pfs.addpfdo(pf)==true)
			return "a";
		return "b";
	}
	
	@RequestMapping("selectallpf")
	public String selectallpf(HttpServletRequest request,HttpSession session) {
		List<pfmanage> list=pfs.selectallpf();
		List<authority> alist=as.selectallAuthority();
		session.setAttribute("pflist", list);
		session.setAttribute("apflist", alist);
		return "pf/selectallpf";
	}
	
	@RequestMapping("selectallfypf")
	public String selectallfypf(HttpSession session,int pageNum,int pageSize) {
		List<authority> alist=as.selectallAuthority();
		session.setAttribute("apflist", alist);
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(pageSize);
		List<pfmanage> listall=pfs.selectallpf();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("pfpage", page);
		System.out.println(pageNum+" "+pageSize);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "pf/selectallpf";
	}
	
	
	@RequestMapping("addpfauthority")
	@ResponseBody
	public String addpfauthority(String usernumber,String authority,int rn,HttpSession session) {
		userauthority ua=new userauthority();
		ua.setUsernumber(usernumber);
		ua.setAuthority(authority);
		authority a=new authority();
		a.setAuthorityfeatures(authority);
		authority aa=as.selectauthorityid(a);
		ua.setAuthorityid(aa.getAuthorityname());
		List<userauthority> list=as.selectpfauthority(ua);
		List<userauthority> list1=as.selectpfauthority(ua);
		session.setAttribute("curpfauthority", list1);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getAuthority().equals(authority)) {
				return "b";
			}
		}
		if(as.addpfauthority(ua)>0)
			return "a";
		return null;
	}
	@RequestMapping("selectpfauthority")
	public String selectpfauthority(String usernumber,HttpSession session) {
		userauthority ua=new userauthority();
		ua.setUsernumber(usernumber);
		List<userauthority> list=as.selectpfauthority(ua);
		session.setAttribute("ccurpfauthority", list);
		return "pf/userauthority";
	}
	@RequestMapping("deletpfau")
	public String deletpfau(String usernumber,String authorityid,HttpSession session) {
		userauthority ua=new userauthority();
		ua.setUsernumber(usernumber);
		ua.setAuthorityid(authorityid);
		pfs.deletpfau(ua);
		List<userauthority> list=as.selectpfauthority(ua);
		session.setAttribute("curpfauthority", list);
		return "pf/userauthority";
	}
	/*
	 * 分页查询
	 */
	@RequestMapping("selectfypf")
	public String selectfypf(HttpSession session,int pageNum,int pageSize) {
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(pageSize);
		List<pfmanage> listall=pfs.selectallpf();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("pfpage", page);
		System.out.println(pageNum+" "+pageSize);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "pf/selectfypf";
	}
	@RequestMapping("pfnextpage")
	@ResponseBody
	public String nextpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("pfpageNum")+1;
		int maxpage=(Integer)session.getAttribute("pfpage");
		if(pageNum>maxpage)
			return "b";
		else {
			List<pfmanage> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=pfs.selectfypf(p);
			System.out.println(list.size());
			session.setAttribute("pffylist", list);
			session.setAttribute("pfpageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("pfagopage")
	@ResponseBody
	public String agopage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("pfpageNum")-1;
		int maxpage=(Integer)session.getAttribute("pfpage");
		if(pageNum==0)
			return "b";
		else {
			List<pfmanage> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=pfs.selectfypf(p);
			System.out.println(list.size());
			session.setAttribute("pffylist", list);
			session.setAttribute("pfpageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("pffirstpage")
	@ResponseBody
	public String firstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "a";
	}
	@RequestMapping("ppffirstpage")
	public String pfirstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "pf/selectfypf";
	}
	
	@RequestMapping("pflastpage")
	@ResponseBody
	public String lastpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("pfpage");
		int maxpage=(Integer)session.getAttribute("pfpage");
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "a";
	}
	@RequestMapping("selectpfxq")
	public String selectpfxq(String usernumber,HttpSession session) {
		pfmanage p=new pfmanage();
		p.setUsernumber(usernumber);
		List<pfmanage> list=pfs.selectpfxq(p);
		session.setAttribute("pfxqlist", list);
		return "pf/pfxq";
	}
	@RequestMapping("updatepf")
	@ResponseBody
	public String updatepf(String usernumber,String username,String sex,String birthday,String idnumber,String jg,String hometown,String phone,String remarks) {
		pfmanage pf=new pfmanage();
		pf.setUsernumber(usernumber);
		pf.setUsername(username);
		pf.setSex(sex);
		pf.setBirthday(birthday);
		pf.setIdnumber(idnumber);
		pf.setJg(jg);
		pf.setHometown(hometown);
		pf.setPhone(phone);
		pf.setRemarks(remarks);
		if(pfs.updatepf(pf)>0) {
			return "a";
		}
		return "b";
	}
	
	@RequestMapping("sousuopfname")
	@ResponseBody
	public String sousuopfname(String pfname,int rn,HttpSession session) {
		pfmanage p=new pfmanage();
		p.setUsername(pfname);
		List<pfmanage> list=pfs.sousuopfname(p);
		System.out.println("aaa");
		if(list.size()>0) {
			session.setAttribute("sousuopflist", list);
			return "a";
		}
		return "b";
	}
	
	@RequestMapping("deletepf")
	public String deletepf(String usernumber,HttpSession session) {
		pfmanage pf=new pfmanage();
		pf.setUsernumber(usernumber);
		pfs.deletepf(pf);
		int pageNum=1;
		List<pfmanage> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=pfs.selectfypf(p);
		System.out.println(list.size());
		session.setAttribute("pffylist", list);
		session.setAttribute("pfpageNum", pageNum);
		return "pf/selectfypf";
	}
}
