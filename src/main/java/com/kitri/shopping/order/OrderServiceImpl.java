package com.kitri.shopping.order;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

public class OrderServiceImpl implements OrderService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void add_order() {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		
		orderMapper.insert_order();
	}

	@Override
	public void add_order_info() {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		
		orderMapper.inser_order_info();
		

	}

	@Override
	public String get_order(String user_id) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.select_order(user_id);
	}

	@Override
	public String get_order_info(String user_id) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.select_order_info(user_id);
	}

	@Override
	public List<Order> getAll_order(String user_id) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.selectAll_order(user_id);
	}

	@Override
	public List<Order> getAll_order_info(String user_id) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		return orderMapper.selectAll_order_info(user_id);
	}

	@Override
	public void edit_order(Order order) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.update_order(order);
	}

	@Override
	public void edit_order_info(Order order) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.update_order_info(order);
	}

	@Override
	public void del_order(int order_num) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.delete_order(order_num);
	}

	@Override
	public void del_order_info(int order_info_num) {
		// TODO Auto-generated method stub
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.delete_order_info(order_info_num);
	}

}
