package com.kitri.shopping.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String login(@RequestParam(value="user_id") String user_id,@RequestParam(value="pwd")String pwd, HttpServletRequest req,@RequestParam(value="uri") String uri,HttpServletResponse response){
		HttpSession session = null;
		//던져주는 값은 id,pwd
		//
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		uri=uri.replace("/shopping", "");
		users u= service.login(user_id);
		if(u!=null){
		
		if(u.getType().equals("탈퇴")){
		}
	
		if (u.getPwd().equals(pwd)) {
			session = req.getSession();
			session.setAttribute("user_id", u.getUser_id());
			session.setAttribute("name", u.getName());
			session.setAttribute("type", u.getType());
			return "redirect:"+uri;
		}else{
			PrintWriter out=null;
			try {
				out = response.getWriter();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				out.write("로그인실패했습니다.");
				return null;
			}			
			//{flag:${flag}}
			
					
			//mav.addObject("msg", "로그인실패했습니;다.");
		}
		
	}
		return null;}
	
	@RequestMapping(value="/user/logout.do")
	public String logOut(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="user/adduser.do")
	public String adduser(users u){
		System.out.println(u.toString()+"가입입력값");
		
		service.adduser(u);				
		
		return "/users/main";
	}	
	
	@RequestMapping(value="/user/modify.do")
	public String modify(users u,@RequestParam(value="msg")String msg){
		
		System.out.println(u.toString()+"유저수정 입력값");
		service.editusers(u);
		if(u.getType().equals("탈퇴")){
			service.delusers(u.getUser_id());
		}
		if(!msg.equals("admin")){
		return "/users/maintest";
		}else{
			return "redirect:/user/admin.do";
		}
	}
	
	@RequestMapping(value="user/modifyform.do")
	public ModelAndView modifyform(HttpServletRequest req){
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		users u = service.get(user_id);
		
		ModelAndView mav = new ModelAndView("users/modify");
		mav.addObject("u", u);
		
		return mav;
		
	}	
	
	@RequestMapping(value="/user/withdraw.do")
	public String withdraw(HttpServletRequest req){
	HttpSession session = req.getSession();
	service.delusers((String)session.getAttribute("user_id"));
	
	return "redirect:/user/main.do";
	}
	
	@RequestMapping(value="/user/withdrawadmin.do")
	public String withdrawadmin(@RequestParam(value="user_id")String user_id){
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			System.out.println(user_id);
	service.delusers(user_id);
		
	return "redirect:/user/admin.do";
	}	
	@RequestMapping(value="user/admin.do")
	public ModelAndView admin(){
		ModelAndView mav = new ModelAndView("/users/admin");
		ArrayList<users> list = (ArrayList<users>) service.getAll();
		
		mav.addObject("list", list);		
		return mav;
	}	
	
	@RequestMapping(value="user/main.do")
	public String main(){
		return "/users/main";
	}
	
	@RequestMapping(value="user/maintest.do")
	public String maintest(){
		return "/users/maintest";
	}
	
	@RequestMapping(value="user/joinform.do")
	public String joinform(){
		return "/users/joinform";
	}
	
	@RequestMapping(value="user/findpwd.do")
	public String findpwd(){
		return "/users/joinform";
	}
	
	
	
	@RequestMapping(value="user/search.do")
	public ModelAndView search_submit(@RequestParam(value="keyword")String keyword){
		
		ModelAndView mav = new ModelAndView("/users/admin");
		
		ArrayList<users> list = (ArrayList<users>) service.getAllType(keyword);
		mav.addObject("list", list);		
		return mav;
		}
	
	@RequestMapping(value="user/user/search.do")
	public ModelAndView listof(){
		
		ModelAndView mav = new ModelAndView("/users/listof");
		ArrayList<users> list = (ArrayList<users>) service.getAll();
		mav.addObject("list", list);		
		return mav;
		
	}
	
	

	

	

}
