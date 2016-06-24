package com.kitri.shopping.cart;

import java.util.List;

public interface CartMapper {

	/**
	 * 장바구니 리스트 뽑기
	 * @param user_id
	 * @return
	 */
	List<Cart> selectAll (String user_id1);
	
	/**
	 * 장바구니 추가
	 * @param cart
	 */
	void insert(Cart cart);
	
	/**
	 * 장바구니 갯수 수정
	 * 
	 */
	void update(Cart cart);
	
	/**
	 * 장바구니 삭제
	 * 
	 */
	void delete(int cart_num);
}
