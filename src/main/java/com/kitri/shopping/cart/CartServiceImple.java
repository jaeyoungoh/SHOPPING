package com.kitri.shopping.cart;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component(value="cartService")
public class CartServiceImple implements CartService {
	
	@Resource(name="sqlSession")
	private SqlSession sqlsession;
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public List<Cart> getSelectAllCart(Cart cart) {
		CartMapper cartMapper = sqlsession.getMapper(CartMapper.class);
		return cartMapper.selectAll(cart);
	}

	@Override
	public void insertCart(Cart cart) {
		CartMapper cartMapper =sqlsession.getMapper(CartMapper.class);
		cartMapper.insert(cart);
	}

	@Override
	public void updateCart(Cart cart) {
		CartMapper cartMapper = sqlsession.getMapper(CartMapper.class);
		cartMapper.update(cart);
	}

	@Override
	public void deleteCart(int cart_num) {
		CartMapper cartMapper = sqlsession.getMapper(CartMapper.class);
		cartMapper.delete(cart_num);
	}

	@Override
	public int searchCnt(int product_id) {
		CartMapper cartMapper = sqlsession.getMapper(CartMapper.class);
		System.out.println(product_id);
		return cartMapper.selectCnt(product_id);
	}
	
	

}
