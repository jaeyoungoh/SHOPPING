package com.kitri.shopping.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
	@RequestMapping(value="/")
	public String main(){
		return "main";
	}
}
