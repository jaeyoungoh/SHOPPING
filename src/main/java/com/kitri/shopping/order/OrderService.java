package com.kitri.shopping.order;

import java.util.List;

public interface OrderService {

	void add_order(); //주문내역 입력
	
	void add_order_info(); //주문내역 상세 입력

	String get_order(String user_id);//userid로 주문내역 검색 
	
	String get_order_info(String user_id);//상세 주문내역 
	
	List<Order> getAll_order(String user_id);//주문내역 리스트
	
	List<Order> getAll_order_info (String user_id);//주문내역 리스트

	void edit_order(Order order);//주문내역 변경

	void edit_order_info(Order order);//주문내역 변경
	
	void del_order(int order_num);//주문내역 삭제
	
	void del_order_info(int order_info_num);//주문내역 삭제
	
	
}
