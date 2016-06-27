package com.kitri.shopping.order;

import java.util.List;

public interface OrderMapper {
	
	void insert_order();
	
	void inser_order_info();

	String select_order(String user_id);
	
	String select_order_info(String user_id);
	
	List<Order> selectAll_order(String user_id);
	
	List<Order> selectAll_order_info (String user_id);

	void update_order(Order order);

	void update_order_info(Order order);
	
	void delete_order(int order_num);
	
	void delete_order_info(int order_info_num);
	
	
}
