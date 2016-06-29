package com.kitri.shopping.order;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component(value="orderService")
public class OrderServiceImpl implements OrderService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addOrder(Order order) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.insertOrder(order);
	}

	@Override
	public List<Order> getOrder(int order_num) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.selectOrder(order_num);
	}

	@Override
	public List<Order> getOrderList(String user_id) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.selectOrderList(user_id);
	}

	@Override
	public List<Order> getAllOrderInfo() {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.selectAllOrderInfo();
	}

	@Override
	public void editOrder(Order order) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.editOrder(order);
	}

	@Override
	public void cancelOrder(int order_num) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.cancelOrder(order_num);
	}


}
