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
	 * 주문내역 상태 변경 /환불, 결제 취소, 결제 완료/   
	 * @param order
	 */
	void editOrder(Order order);
	
}
