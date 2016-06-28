package com.kitri.shopping.order;

import java.util.List;

public interface OrderMapper {
	
	/**
	 * 주문내역 추가
	 */
	void insertOrder(Order order);
	
	/**
	 * userid 상세 주문내역 검색
	 * @param user_id
	 * @return
	 */
	List<Order> selectOrder(int order_num);
	
	/**
	 * 상세 주문내역
	 * @param user_id
	 * @return
	 */
	
	List<Order> selectOrderList(String user_id);
	
	/**
	 * 주문내역 리스트
	 * @param order
	 */
	List<Order> selectAllOrderInfo ();

	/**
	 * 주문내역 상태 변경
	 * @param order
	 */
	void editOrder(Order order);
	
	/**
	 * 주문내역 취소
	 * @param order_num
	 */
	void cancelOrder(int order_num);
	
}
