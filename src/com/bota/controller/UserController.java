package com.bota.controller;

import java.util.List;

import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bota.bean.User;
import com.bota.bean.pfmanage;
import com.bota.bean.userauthority;
import com.bota.redis.JedisPoolUtil;
import com.bota.service.AuthorityService;
import com.bota.service.UserService;
import com.bota.util.Dictionary;
import com.sun.mail.util.MailSSLSocketFactory;

/**
 * 
 * @author 波塔
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthorityService as;
	/**
	 * 跳转到个人中心页面
	 * 
	 */
	@RequestMapping("login")
	@ResponseBody
	public String loginPage(User user,String password,HttpSession session,HttpServletResponse response){
		System.out.println("login");
		System.out.println(user.getUsernumber());
		JedisPoolUtil redis=new JedisPoolUtil();
		String usernumber=String.valueOf(user.getUsernumber());
		userauthority ua=new userauthority();
		ua.setUsernumber(usernumber);
		List<userauthority> list=as.selectpfauthority(ua);
		session.setAttribute("curpfauthority", list);
		session.setAttribute("studentId", user.getUsernumber());
		session.setAttribute("userpassword", user.getPassword());
		String result = userService.selectUserByUserNumber(user.getUsernumber());
		if(result == Dictionary.S_FAIL){
			return result;
		}else{
			Map<String, Object> ending = userService.verifyByUser(user);
			String loginInfo=String.valueOf(user.getUsernumber());
			Cookie userCode=new Cookie("userCode", loginInfo);
			userCode.setMaxAge(30*24*60*60);
			userCode.setPath("/");
			Cookie userPassword=new Cookie("userPassword",user.getPassword());
			userPassword.setPath("/");
			response.addCookie(userCode);
			response.addCookie(userPassword);
			if(ending.get("status").toString() == Dictionary.S_SUCCESS){
				session.setAttribute("user", ending.get("map"));
			}
			return ending.get("status").toString();
		}
	}

	@RequestMapping("user")
	public String hh(){ 
		return "login/login";
	}
	/**
	 * 退出
	 * 
	 */
	@RequestMapping("exit")
	public String exit(HttpSession session){		
		session.removeAttribute("user");
		return "login/login";
	}

	/**
	 * 我的信息页面
	 * @return
	 */
	@RequestMapping("myselfPage")
	public String myselfPage(HttpSession session){ 
		List<pfmanage> list=userService.selectpf(String.valueOf((Long)session.getAttribute("studentId")));
		session.setAttribute("pflist", list);
		System.out.println(list.size());
		System.out.println("login");
		return "personalCenter/myself";
	}

	@RequestMapping("updatePwdPage")
	public String updatePwdPage() {
		return "user/updatepw";
	}

	@RequestMapping("updateuserpwd")
	@ResponseBody
	public String updateuserpwd(String jiupwd,String newpwd,String nnewpwd,int rn,HttpSession session) {
		User u=new User();
		String userpassword=(String) session.getAttribute("userpassword");
		if(!userpassword.equals(jiupwd)) {
			System.out.println("dd"+userpassword);
			return "b";
		}
		else{
			u.setPassword(newpwd);
			u.setUsernumber((Long)session.getAttribute("studentId"));
			if(userService.updateuserpwd(u)>0) {
				return "a";
			}
		}
		return "c";
	}
	@RequestMapping("yanzhengma")
	public String yanzhengma() {
		System.out.println("忘记密码");
		return "user/yzm";
	}

	@RequestMapping("fsyzm")
	@ResponseBody
	public String fsyzm(String yx,int rn,HttpSession sessions) {
		int res = 0;
		String mailServer="smtp.163.com";
		String loginAccount = "caizhengyufjut@163.com";
		String loginAuthCode = "UJGDUVXWGLBNTCKB";
		String sender = "caizhengyufjut@163.com";
		try {
			// 跟smtp服务器建立一个连接
			Properties p = new Properties();
			// 设置邮件服务器主机名
			p.setProperty("mail.host", mailServer);
			// 发送服务器需要身份验证,要采用指定用户名密码的方式去认证
			p.setProperty("mail.smtp.auth", "true");
			// 发送邮件协议名称
			p.setProperty("mail.transport.protocol", "smtp");

			// 开启SSL加密，否则会失败
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			p.put("mail.smtp.ssl.enable", "true");
			p.put("mail.smtp.ssl.socketFactory", sf);
			// 创建session
			Session session = Session.getDefaultInstance(p,
					new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					// 用户名可以用QQ账号也可以用邮箱的别名:第一个参数为邮箱账号,第二个为授权码
					PasswordAuthentication pa = new PasswordAuthentication(
							loginAccount, loginAuthCode);
					return pa;
				}
			});
			// 设置打开调试状态
			session.setDebug(true);
			// 可以发送几封邮件:可以在这里 for循环多次
			// 声明一个Message对象(代表一封邮件),从session中创建
			MimeMessage msg = new MimeMessage(session);
			// 邮件信息封装
			// 1发件人
			InternetAddress sendInternetAddress = new InternetAddress(sender);
			msg.setFrom(sendInternetAddress);
			System.out.println("a");
			// 2一个的收件人
			System.out.println(yx);
			InternetAddress receiveInternetAddress = new InternetAddress(yx);
			msg.setRecipient(RecipientType.TO, receiveInternetAddress);
			System.out.println("a");
			/*			// 2多个收件人,把String数组转成InternetAddress数组
							 InternetAddress[] receiveInternetAddresses = new
				 InternetAddress[receiverAddresses.length];
				 for (int i = 0; i < receiverAddresses.length; i++) {
				 receiveInternetAddresses[i] = new
				 InternetAddress(receiverAddresses[i]);
				 }
				 msg.setRecipients(RecipientType.TO, receiveInternetAddresses);*/

			// 3邮件内容:主题、内容
			String s="";
			Random r = new Random();
			for(int i=0 ; i<=5 ;  i++)
			{
				int ran1 = r.nextInt(9);
				s+=String.valueOf(ran1);
			}
			sessions.setAttribute("pwyzm", s);
			System.out.println(s+" "+(String)sessions.getAttribute("pwyzm"));
			String emailContentType="text/html;charset=utf-8";
			String emailSubject="111";
			msg.setSubject(emailSubject);
			System.out.println("a");
			// msg.setContent("Hello, 我是debug!!!", );//纯文本
			msg.setContent(s, emailContentType);// 发html格式的文本
			System.out.println("a");
			// 发送动作
			Transport.send(msg);
			System.out.println("a");
			System.out.println("邮件发送成功");
			res = 1;
		} catch (Exception e) {
			System.out.println("邮件发送失败: " + e.getMessage());
			res = 0;
		}
		return "a";
	}
	@RequestMapping("yzyzm")
	@ResponseBody
	public String yzyzm(String yzm,HttpSession session) {
		if(yzm.equals((String)session.getAttribute("pwyzm"))) {
			return "a";
		}
		else
			return "b";
	}


	@RequestMapping("changepwd")
	@ResponseBody
	public String changepwd(String newpwd,int rn,HttpSession session) {
		System.out.println("a");
		User u=new User();
		u.setPassword(newpwd);
		u.setUsernumber((Long)session.getAttribute("studentId"));
		int k=userService.updateuserpwd(u);
		System.out.println("a");
		if(k>0)
			return "a";
		return "b";
	}
}

