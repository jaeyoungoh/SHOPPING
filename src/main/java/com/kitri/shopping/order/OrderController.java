package com.kitri.shopping.order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.shopping.cart.CartService;

@Controller
public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	/**
	 * 주문 리스트
	 */
	@RequestMapping(value="/order/list.do")
	public ModelAndView showListOrder(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("/order/list");
		List<Order> list = orderService.getOrderList((String)session.getAttribute("user_id"));
		mav.addObject("list",list);
		return mav;
	}
	
	/**
	 * 주문 정보 추가 
	 */
	@RequestMapping(value="/order/add.do")
	public ModelAndView addOrder(int cart_num,Order order, HttpServletRequest request){
		HttpSession session = request.getSession();
		order.setUser_id((String)session.getAttribute("user_id"));
		System.out.println(order);
		ModelAndView mav = new ModelAndView("redirect:/order/list.do");
		orderService.addOrder(order);
		cartService.deleteCart(cart_num);
		return mav;
	}
	
	/**
	 * 주문 상태 수정
	 */
	@RequestMapping(value="/order/update.do")
	public ModelAndView updateOrder(Order order){
		System.out.println(order);
		ModelAndView mav = new ModelAndView("redirect:/order/list.do");
		orderService.editOrder(order);
		return mav;
	}
	
	/**
	 * 전체 주문 정보 리스트 출력
	 */
	@RequestMapping(value="/order/allList.do")
	public void showAllList(){
		
	}
	
}
