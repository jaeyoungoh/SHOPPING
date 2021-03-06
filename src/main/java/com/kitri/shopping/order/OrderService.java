package com.kitri.shopping.order;

import java.util.List;

public interface OrderService {

	/**
	 * 주문내역 추가
	 */
	void addOrder(Order order);
	/**
	 * 주문 건수 건당 상세 주문내역 검색
	 * @param user_id
	 * @return
	 */
	List<Order> getOrder(int order_num);

	/**
	 * 주문내역 리스트
	 * @param user_id
	 * @return
	 */
	List<Order> getOrderList(String user_id);
	
	/**
	 * 주문내역 전체 리스트 관리자
	 * @param order
	 */
	List<Order> getAllOrderInfo();

	/**
	 * 주문내역 상태 변경 결제완료, 결제취소, 환불, 구매결정완료
	 * @param order
	 */
	void editOrder(Order order);
	
}
