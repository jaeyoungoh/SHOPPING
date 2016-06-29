package com.kitri.shopping.order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
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
	public void addOrder(){
		
	}
	
	/**
	 * 주문 상태 수정
	 */
	@RequestMapping(value="/order/update.do")
	public void updateOrder(){
		
	}
	
	/**
	 * 전체 주문 정보 리스트 출력
	 */
	@RequestMapping(value="/order/allList.do")
	public void showAllList(){
		
	}
	
}
