package com.kitri.shopping.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class usersController {
	
	@Resource(name="userService")
	private Service service;
	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value="user/login.do")
	public String loginForm(){
		return "/users/loginForm";
	}
	
	
	
	
	
	
	

}
