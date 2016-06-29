package com.kitri.shopping.cart;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView cartListGetAll(Cart cart,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/cart/list");
		HttpSession loginSession = request.getSession();
		cart.setUser_id((String)loginSession.getAttribute("user_id"));
		ArrayList<Cart> list = (ArrayList<Cart>) cartService.getSelectAllCart(cart);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/cart/add.do")
	public String addCart(Cart cart){
		cartService.insertCart(cart);
		return "redirect:/cart/list.do?user_id=qwer";
	}
	
	@RequestMapping(value="/cart/update.do")
	public ModelAndView updateCart(Cart cart, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("redirect:/cart/list.do");
		HttpSession loginSession = request.getSession();
		cart.setUser_id((String)loginSession.getAttribute("user_id"));
		int chk = cartService.searchCnt(cart.getProduct_id());
		System.out.println(chk);
		if(chk < cart.getCart_cnt()){
			mav.addObject("update_msg", "fail");
			mav.addObject("max_cnt", chk);
			return mav;
		}else{
			cartService.updateCart(cart);
			mav.addObject("update_msg", "success");
			return mav;
		}
		
	}
	
	@RequestMapping(value="/cart/delete.do")
	public void deleteCart(int cart_num){
			cartService.deleteCart(cart_num);
	}
	
}
