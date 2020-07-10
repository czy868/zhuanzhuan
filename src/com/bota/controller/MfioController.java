package com.bota.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bota.bean.mf;
import com.bota.bean.minoutfile;
import com.bota.bean.page;
import com.bota.service.MfService;
import com.bota.service.MfinouService;

import jxl.Cell;
import jxl.Sheet;
import jxl.*;
import jxl.read.biff.BiffException;

@Controller
public class MfioController {

	@Autowired
	private MfService mf;

	@Autowired
	private MfinouService mios; 
	@RequestMapping("mfout")
	public String Mfinjsp(HttpServletRequest request,HttpSession session,int pageNum,int pageSize){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date=String.valueOf(df.format(new Date()));
		String s="";
		for(int i=0;i<date.length();i++) {
			if(date.charAt(i)>='0'&&date.charAt(i)<='9')
				s+=String.valueOf(date.charAt(i));
		}
		System.out.println(s);
		session.setAttribute("dddate", date);
		session.setAttribute("ddnumber", s);
		List<minoutfile> dlist=new ArrayList<>();
		session.setAttribute("dlist", dlist);
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
		return "mfio/mfou";
	}
	/*
	 * 物料入仓
	 */
	@RequestMapping("mfin")
	public String mfin(HttpServletRequest request,HttpSession session,int pageNum,int pageSize){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date=String.valueOf(df.format(new Date()));
		String s="";
		for(int i=0;i<date.length();i++) {
			if(date.charAt(i)>='0'&&date.charAt(i)<='9')
				s+=String.valueOf(date.charAt(i));
		}
		System.out.println(s);
		session.setAttribute("dddate", date);
		session.setAttribute("ddnumber", s);
		List<minoutfile> rlist=new ArrayList<>();
		session.setAttribute("rlist", rlist);
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
		return "mfio/mfin";
	}

	@RequestMapping("chuku")
	@ResponseBody
	public String chuku(String mnumber,String mname,int ms,int cksl,HttpSession session,int rn) {
		if(cksl>ms)
			return "b";
		System.out.println(mnumber+" "+mname+" "+ms+" "+cksl);
		List<minoutfile> dlist=(List<minoutfile>) session.getAttribute("dlist");
		String s=(String) session.getAttribute("ddnumber");
		String date=(String) session.getAttribute("dddate");
		String usernumber=String.valueOf((Long) session.getAttribute("studentId"));
		System.out.println(usernumber);
		minoutfile mio=new minoutfile();
		mio.setDnumber(s);
		mio.setDate(date);
		mio.setUsernumber(usernumber);
		mio.setMnumber(mnumber);
		mio.setMname(mname);
		mio.setShuliang(cksl);
		mio.setStauts("出货");
		dlist.add(mio);
		session.setAttribute("dlist", dlist);
		return "a";
	}

	@RequestMapping("ruku")
	@ResponseBody
	public String ruku(String mnumber,String mname,int ms,int cksl,HttpSession session,int rn) {
		if(cksl>ms)
			return "b";
		List<minoutfile> rlist=(List<minoutfile>) session.getAttribute("rlist");
		String s=(String) session.getAttribute("ddnumber");
		String date=(String) session.getAttribute("dddate");
		String usernumber=String.valueOf((Long) session.getAttribute("studentId"));
		System.out.println(usernumber);
		minoutfile mio=new minoutfile();
		mio.setDnumber(s);
		mio.setDate(date);
		mio.setUsernumber(usernumber);
		mio.setMnumber(mnumber);
		mio.setMname(mname);
		mio.setShuliang(cksl);
		mio.setStauts("入货");
		rlist.add(mio);
		session.setAttribute("dlist", rlist);
		return "a";
	}

	@RequestMapping("daochucc")
	public String daochucc(HttpSession session) {
		List<minoutfile> dlist=(List<minoutfile>) session.getAttribute("dlist");
		for(int i=0;i<dlist.size();i++) {
			mf m =new mf();
			m.setMnumber(dlist.get(i).getMnumber());
			mf mm=mios.selectmfkc(m);
			m.setNumber(mm.getNumber()-dlist.get(i).getShuliang());
			System.out.println(m.getNumber());
			int k=mios.updatemfkc(m);
			int b=mios.addmfio(dlist.get(i));
		}
		session.setAttribute("sxlist", dlist);
		return "mfio/sxxls";
	}

	@RequestMapping("qdrk")
	public String qdrk(HttpSession session) {
		List<minoutfile> dlist=(List<minoutfile>) session.getAttribute("rlist");
		for(int i=0;i<dlist.size();i++) {
			mf m =new mf();
			m.setMnumber(dlist.get(i).getMnumber());
			mf mm=mios.selectmfkc(m);
			m.setNumber(mm.getNumber()+dlist.get(i).getShuliang());
			System.out.println(m.getNumber());
			int k=mios.updatemfkc(m);
			int b=mios.addmfio(dlist.get(i));
		}
		List<minoutfile> list=new ArrayList<>();
		session.setAttribute("rlist", list);
		return "redirect:mfin.do?pageNum=1&pageSize=5";
	}
	@RequestMapping("tuichudd")
	public String tuichudd(HttpSession session) {
		List<minoutfile> dlist=new ArrayList<>();
		session.setAttribute("dlist", dlist);
		return "mfio/mfou";
	}

	@RequestMapping("selectinandoutrq")
	public String selectinandoutrq(int pageNum,int pageSize,HttpSession session) {
		page p= new page();
		p.setPageNum(pageNum*15-15);
		p.setPageSize(15);
		List<minoutfile> list=new ArrayList<>();
		List<minoutfile> listall=mios.selectinandout();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("miopage", page);
		list=mios.selectlimitinandou(p);
		session.setAttribute("miolist", list);
		session.setAttribute("miopageNum", pageNum);
		return "mfio/selectminoutrq";
	}

	@RequestMapping("selectinandoutmf")
	public String selectinandoutmf(int pageNum,int pageSize,HttpSession session) {
		page p= new page();
		p.setPageNum(pageNum*15-15);
		p.setPageSize(15);
		List<minoutfile> list=new ArrayList<>();
		List<minoutfile> listall=mios.selectinandout();
		int num=listall.size()%pageSize,page;
		if(num==0) {
			page=listall.size()/pageSize;
		}
		else {
			page=listall.size()/pageSize+1;
		}
		session.setAttribute("miopage", page);
		list=mios.selectlimitinandou(p);
		session.setAttribute("miolist", list);
		session.setAttribute("miopageNum", pageNum);
		return "mfio/selectminoutmf";
	}

	@RequestMapping("mionextpage")
	@ResponseBody
	public String nextpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("miopageNum")+1;
		int maxpage=(Integer)session.getAttribute("miopage");
		if(pageNum>maxpage)
			return "b";
		else {
			List<minoutfile> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*15-15);
			p.setPageSize(15);
			list=mios.selectlimitinandou(p);
			System.out.println(list.size());
			session.setAttribute("miolist", list);
			session.setAttribute("miopageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("mioagopage")
	@ResponseBody
	public String agopage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("miopageNum")-1;
		int maxpage=(Integer)session.getAttribute("miopage");
		if(pageNum==0)
			return "b";
		else {
			List<minoutfile> list=new ArrayList<>();
			page p= new page();
			p.setPageNum(pageNum*15-15);
			p.setPageSize(15);
			list=mios.selectlimitinandou(p);
			System.out.println(list.size());
			session.setAttribute("miolist", list);
			session.setAttribute("miopageNum", pageNum);
			return "a";
		}
	}

	@RequestMapping("miofirstpage")
	@ResponseBody
	public String firstpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=1;
		List<minoutfile> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*15-15);
		p.setPageSize(15);
		list=mios.selectlimitinandou(p);
		System.out.println(list.size());
		session.setAttribute("miolist", list);
		session.setAttribute("miopageNum", pageNum);
		return "a";
	}

	@RequestMapping("mioslastpage")
	@ResponseBody
	public String lastpage(HttpServletRequest request,HttpSession session,int rn) {
		int pageNum=(Integer)session.getAttribute("miopage");
		int maxpage=(Integer)session.getAttribute("miopage");
		System.out.println(pageNum+" "+maxpage);
		List<minoutfile> list=new ArrayList<>();
		page p= new page();
		p.setPageNum(pageNum*15-15);
		p.setPageSize(15);
		list=mios.selectlimitinandou(p);
		System.out.println(list.size());
		session.setAttribute("miolist", list);
		session.setAttribute("miopageNum", pageNum);
		return "a";
	}
	@RequestMapping("mfnamesx")
	@ResponseBody
	public String mfnamesx(String year,String mother,String mfname,int rn,HttpSession session) {
		List<minoutfile> listall=mios.selectinandout();
		List<minoutfile> list=new ArrayList<>();
		String s1=year+"-"+mother;
		for(int i=0;i<listall.size();i++) {
			String s=listall.get(i).getDate().substring(0, 7);
			String s2=listall.get(i).getMname();
			System.out.println(s1+" "+s+" "+s2+" "+mfname);
			if(s.equals(s1)&&s2.equals(mfname)) {
				list.add(listall.get(i));
			}
		}
		session.setAttribute("sxlist", list);
		return "a";
	}

	@RequestMapping("mfnamesxrq")
	@ResponseBody
	public String mfnamesxrq(String year,String mother,int rn,HttpSession session) {
		System.out.println(mother+"mother");
		if(mother.length()==0) {
			System.out.println(mother);
			List<minoutfile> listall=mios.selectinandout();
			List<minoutfile> list=new ArrayList<>();
			String s1=year;
			System.out.println(listall.size());
			for(int i=0;i<listall.size();i++) {
				String s=listall.get(i).getDate().substring(0, 4);
				System.out.println(s1+" "+s);
				if(s.equals(s1)) {
					list.add(listall.get(i));
				}
			}
			session.setAttribute("sxlist", list);
			return "a";
		}
		else {
			System.out.println(mother+"mother");
			List<minoutfile> listall=mios.selectinandout();
			List<minoutfile> list=new ArrayList<>();
			String s1=year+"-"+mother;
			System.out.println(listall.size());
			for(int i=0;i<listall.size();i++) {
				String s=listall.get(i).getDate().substring(0, 7);
				System.out.println(s1+" "+s);
				if(s.equals(s1)) {
					list.add(listall.get(i));
				}
			}
			session.setAttribute("sxlist", list);
			return "a";
		}
	}
	@RequestMapping(value="regist", method= {RequestMethod.GET, RequestMethod.POST})
	public String daoru(@RequestParam MultipartFile file,HttpSession session) throws BiffException, IOException {
		try {
			String fileName = file.getOriginalFilename();
			String headPath = "D:\\" + fileName;
			File dest = new File(headPath);
			System.out.println(headPath);
			//开始存文件，路径上一行已经写进去了
			file.transferTo(dest);
			String lujin="D://"+fileName;
			System.out.println(lujin);
			File f = new File(lujin);
			Workbook rwb = Workbook.getWorkbook(f);
			Sheet sheet = rwb.getSheet(0);
			List<minoutfile> list=new ArrayList<>();
			for (int i = 1; i < sheet.getRows(); i++) {
				String[] str = new String[sheet.getColumns()];
				Cell cell = null;
				//列数
				minoutfile m=new minoutfile();
				System.out.println(sheet.getColumns());
				for (int j = 0; j < sheet.getColumns(); j++) {
					cell = sheet.getCell(j, i);
					str[j] = cell.getContents();
					if(j==0)
						m.setMnumber(cell.getContents());
					else if(j==1)
						m.setMname(cell.getContents());
					else if(j==2)
						m.setShuliang(Integer.valueOf(cell.getContents()));
				}
				m.setStauts("入货");
				String usernumber=String.valueOf((Long) session.getAttribute("studentId"));
				m.setUsernumber(usernumber);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				String date=String.valueOf(df.format(new Date()));
				String s="";
				for(int k=0;k<date.length();k++) {
					if(date.charAt(k)>='0'&&date.charAt(k)<='9')
						s+=String.valueOf(date.charAt(k));
				}
				m.setDnumber(s);
				list.add(m);	
			}
			session.setAttribute("rlist", list);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("上传失败");
		}
		return "mfio/mfin";
	}
}
