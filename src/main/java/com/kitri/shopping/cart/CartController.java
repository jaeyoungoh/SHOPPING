package com.kitri.shopping.cart;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	
	@Resource
	private CartService cartService;

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	
	@RequestMapping(value="/cart/list.do")
	public ModelAndView cartListGetAll(String user_id){
		ModelAndView mav = new ModelAndView("/cart/list");
		ArrayList<Cart> list = (ArrayList<Cart>) cartService.getSelectAllCart(user_id);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/cart/add.do")
	public String addCart(){
		return "";
	}
	
	@RequestMapping(value="/cart/update.do")
	public String updateCart(){
		return "";
		
	}
	
	@RequestMapping(value="/cart/delete.do")
	public String deleteCart(){
		return "";
	}
	
}
