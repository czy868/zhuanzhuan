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
import com.bota.bean.page;
import com.bota.service.AuthorityService;

@Controller
public class AuthorityController {

	@Autowired
	private AuthorityService as;

	@RequestMapping("adda")
	public String adda() {
		return "authority/addauthority";
	}

	@RequestMapping("addAuthority")
	@ResponseBody
	public String addAuthority(String authorityid,String authority) {
		authority a=new authority();
		a.setAuthorityname(authorityid);
		a.setAuthorityfeatures(authority);
		if(as.addAuthority(a)>0)
			return "a";
		return "b";
	}



	@RequestMapping("selectAuthority")
	public String selectAuthority(HttpServletRequest request,HttpSession session,int pageNum,int pageSize) {
		List<authority> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(pageSize);
		List<authority> listall = as.selectallAuthority();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("page", page);
		System.out.println(pageNum+" "+pageSize);
		list=as.selectAuthority(p);
		System.out.println(list.size());
		session.setAttribute("authoritylist", list);
		session.setAttribute("pageNum", pageNum);
		return "authority/selectauthority";
	}

	@RequestMapping("nextpage")
	@ResponseBody
	public String nextpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("pageNum")+1;
		int maxpage=(Integer)session.getAttribute("page");
		if(pageNum>maxpage)
			return "b";
		else {
			List<authority> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=as.selectAuthority(p);
			System.out.println(list.size());
			session.setAttribute("authoritylist", list);
			session.setAttribute("pageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("agopage")
	@ResponseBody
	public String agopage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("pageNum")-1;
		int maxpage=(Integer)session.getAttribute("page");
		if(pageNum==0)
			return "b";
		else {
			List<authority> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*5-5);
			p.setPageSize(5);
			list=as.selectAuthority(p);
			System.out.println(list.size());
			session.setAttribute("authoritylist", list);
			session.setAttribute("pageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("firstpage")
	@ResponseBody
	public String firstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<authority> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=as.selectAuthority(p);
		System.out.println(list.size());
		session.setAttribute("authoritylist", list);
		session.setAttribute("pageNum", pageNum);
		return "a";
	}

	@RequestMapping("lastpage")
	@ResponseBody
	public String lastpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("page");
		int maxpage=(Integer)session.getAttribute("page");
		List<authority> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*5-5);
		p.setPageSize(5);
		list=as.selectAuthority(p);
		System.out.println(list.size());
		session.setAttribute("authoritylist", list);
		session.setAttribute("pageNum", pageNum);
		return "a";
	}

}
