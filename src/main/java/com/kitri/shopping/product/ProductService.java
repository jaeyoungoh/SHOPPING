package com.kitri.shopping.product;

import java.util.List;

public interface ProductService {
	List<Product> getAllProduct();
	List<Product> getProductbyName(String name);
	List<Product> getProductbyCategory(String category);
	List<Product> getProductbyUser(String users_id);//판매자별 관리자

	Product getProduct(int product_id);
	boolean addProduct(Product product);
	int editProduct(Product product);
	int delProduct(int product_id);
}
