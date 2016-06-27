package com.kitri.shopping.cart;

import java.util.List;

public interface CartService {
	
	/**
	 * 장바구니 리스트 뽑기
	 * @param user_id
	 * @return
	 */
	List<Cart> getSelectAllCart(Cart cart);
	
	/**
	 * 장바구니 추가
	 * @param cart
	 */
	void insertCart(Cart cart);
	
	/**
	 * 장바구니 갯수 수정
	 * 
	 */
	void updateCart(Cart cart);
	
	/**
	 * 장바구니 삭제
	 * 
	 */
	void deleteCart(int cart_num);
	
	/**
	 * 장바구니 수량 가능 갯수 검색
	 */
	int searchCnt(int product_id);
}
