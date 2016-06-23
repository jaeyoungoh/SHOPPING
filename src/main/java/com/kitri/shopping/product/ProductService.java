package com.kitri.shopping.product;

import java.util.List;

public interface ProductService {
	List<Product> getAllProduct();
	List<Product> getProductbyName(String name);
	List<Product> getProductbyCategory(String category);
	Product getProduct(int product_id);
	boolean addProduct(Product product);
	int editProduct(Product product);
	int delProduct(int product_id);
}
