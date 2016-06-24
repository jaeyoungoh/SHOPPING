package com.kitri.shopping.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class usersController {
	
	@Resource(name="userService")
	private Service service;
	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value= "/user/login.do")
	public String login(@RequestParam(value="user_id") String user_id,@RequestParam(value="pwd")String pwd, HttpServletRequest req){
		HttpSession session = null;
		//던져주는 값은 id,pwd
		//
		
		users u= service.login(user_id);
		System.out.println(u+"u의 값");
		System.out.println("pwd:"+pwd);
		
		if(u.getPwd().equals(pwd)){
			session = req.getSession();
			session.setAttribute("user_id", u.getUser_id());
			session.setAttribute("name", u.getName());
			session.setAttribute("type", u.getType());
			return "users/maintest";
		}else{
			return "users/main";
		}
			
		
	}
	
	@RequestMapping(value="user/adduser.do")
	public String adduser(users u){
		System.out.println(u.toString()+"가입입력값");
		
		service.adduser(u);				
		
		return "/users/main";
	}	
	
	@RequestMapping(value="/user/editform")
	public ModelAndView edit(HttpServletRequest req){
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		users u = service.get(user_id);
		
		ModelAndView mav = new ModelAndView("user/editform");
		mav.addObject("editinfo", u);
		
		return mav;
	}
	
	@RequestMapping(value= "/user/Logout.do")
	public String logOut(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.invalidate();
		return "user/main";
	}
	
	@RequestMapping(value="/user/withdraw.do")
	public String withdraw(users u){
		
		
		
		return "user/main";
	}
	
	
	@RequestMapping(value="user/admin.do")
	public String admin(){
		return "/users/admin";
	}	
	
	@RequestMapping(value="user/main.do")
	public String main(){
		return "/users/main";
	}
	
	@RequestMapping(value="user/joinform.do")
	public String joinform(){
		return "/users/joinform";
	}
	

}
