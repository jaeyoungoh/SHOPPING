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
		System.out.println("입력된 user_id : "+ user_id);
		ModelAndView mav = new ModelAndView("/cart/list");
		ArrayList<Cart> list = (ArrayList<Cart>) cartService.getSelectAllCart(user_id);
		mav.addObject("list", list);
		System.out.println("list 안에 내용 : "+list);
		return mav;
	}
	
	@RequestMapping(value="/cart/add.do")
	public String addCart(Cart cart){
		cartService.insertCart(cart);
		return "redirect:/cart/list.do?user_id=qwer";
	}
	
	@RequestMapping(value="/cart/update.do")
	public String updateCart(Cart cart){
		cartService.updateCart(cart);
		return "redirect:/cart/list.do?update_cnt=";
		
	}
	
	@RequestMapping(value="/cart/delete.do")
	public void deleteCart(int cart_num){
			cartService.deleteCart(cart_num);
	}
	
}
